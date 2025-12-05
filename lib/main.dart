import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/api/server_provider.dart';
import 'package:vaani/db/storage.dart';
import 'package:vaani/features/logging/core/logger.dart';
import 'package:vaani/features/player/providers/audiobook_player.dart';
import 'package:vaani/features/player/providers/currently_playing_provider.dart';
import 'package:vaani/features/settings/api_settings_provider.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/framework.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/router/router.dart';
import 'package:vaani/theme/providers/system_theme_provider.dart';
import 'package:vaani/theme/providers/theme_from_cover_provider.dart';
import 'package:vaani/theme/theme.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  _runPlatformSpecificCode();

  // Configure the App Metadata
  await initialize();

  // Configure the root Logger
  await initLogging();

  // initialize the storage
  await initStorage();

  // initialize audio player
  // await configurePlayer();
  await container.read(audioHandlerInitProvider.future);
  // run the app
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: Framework(AbsApp()),
    ),
  );
}

Future<void> _runPlatformSpecificCode() async {
  if (kIsWeb) return;
  switch (Platform.operatingSystem) {
    case 'android':
      break;
    case 'ios':
      break;
    case 'linux':
      break;
    case 'macos':
      break;
    case 'windows':
      // 初始化窗口管理器
      await windowManager.ensureInitialized();
      final windowOptions = WindowOptions(
        minimumSize: Size(1050, 700),
        center: true,
        skipTaskbar: false,
      );
      await windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.setPreventClose(true);
      });
      break;
    default:
      break;
  }
}

class AbsApp extends ConsumerWidget {
  const AbsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servers = ref.watch(audiobookShelfServerProvider);
    final apiSettings = ref.watch(apiSettingsProvider);

    final needOnboarding = apiSettings.activeUser == null || servers.isEmpty;

    if (needOnboarding) {
      routerConfig.goNamed(Routes.onboarding.name);
    }
    final appSettings = ref.watch(appSettingsProvider);
    final themeSettings = appSettings.themeSettings;

    ColorScheme lightColorScheme = brandLightColorScheme;
    ColorScheme darkColorScheme = brandDarkColorScheme;

    final shouldUseHighContrast =
        themeSettings.highContrast || MediaQuery.of(context).highContrast;

    if (shouldUseHighContrast) {
      lightColorScheme = lightColorScheme.copyWith(
        surface: Colors.white,
      );
      darkColorScheme = darkColorScheme.copyWith(
        surface: Colors.black,
      );
    }

    if (themeSettings.useMaterialThemeFromSystem) {
      var themes =
          ref.watch(systemThemeProvider(highContrast: shouldUseHighContrast));
      if (themes.valueOrNull != null) {
        lightColorScheme = themes.valueOrNull!.$1;
        darkColorScheme = themes.valueOrNull!.$2;
      }
    }

    if (themeSettings.useCurrentPlayerThemeThroughoutApp) {
      try {
        final currentBook = ref.watch(currentBookProvider);
        if (currentBook != null) {
          final themeLight = ref.watch(
            themeOfLibraryItemProvider(
              currentBook.libraryItemId,
              highContrast: shouldUseHighContrast,
              brightness: Brightness.light,
            ),
          );
          final themeDark = ref.watch(
            themeOfLibraryItemProvider(
              currentBook.libraryItemId,
              highContrast: shouldUseHighContrast,
              brightness: Brightness.dark,
            ),
          );
          if (themeLight.valueOrNull != null && themeDark.valueOrNull != null) {
            lightColorScheme = themeLight.valueOrNull!;
            darkColorScheme = themeDark.valueOrNull!;
          }
        }
      } catch (e) {
        debugPrintStack(stackTrace: StackTrace.current, label: e.toString());
        appLogger.severe('not building with player theme');
        appLogger.severe(e.toString());
      }
    }
    final appThemeLight = ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme.harmonized(),
    );
    final appThemeDark = ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme.harmonized(),
      brightness: Brightness.dark,
      // TODO bottom sheet theme is not working
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: darkColorScheme.surface,
      ),
    );
    try {
      return MaterialApp.router(
        locale: Locale(appSettings.language),
        localizationsDelegates: [
          // 以下是其他代理
          S.delegate, //String 资源的 本地化
          GlobalMaterialLocalizations.delegate, //Material Widgets 的本地化
          GlobalWidgetsLocalizations.delegate, //基础 Widgets 的本地化
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: appThemeLight,
        darkTheme: appThemeDark,
        themeMode: themeSettings.themeMode,
        routerConfig: routerConfig,
        themeAnimationCurve: Curves.easeInOut,
        debugShowCheckedModeBanner: false,
      );
    } catch (e) {
      debugPrintStack(stackTrace: StackTrace.current, label: e.toString());
      appLogger.severe(e.toString());

      if (needOnboarding) {
        routerConfig.goNamed(Routes.onboarding.name);
      }
      return const SizedBox.shrink();
    }
  }
}
