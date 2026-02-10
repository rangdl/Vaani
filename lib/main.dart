import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:smtc_windows/smtc_windows.dart';
import 'package:vaani/api/server_provider.dart';
import 'package:vaani/db/storage.dart';
import 'package:vaani/features/logging/core/logger.dart';
import 'package:vaani/features/player/core/init.dart';
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/features/settings/api_settings_provider.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/framework.dart';
import 'package:vaani/l10n/generated/l10n.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/router/router.dart';
// import 'package:vaani/shared/utils/helper.dart';
import 'package:vaani/shared/utils/scroll_behavior.dart';
import 'package:vaani/theme/providers/system_theme_provider.dart';
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

  // if (Helper.isWindows()) {
  //   await SMTCWindows.initialize();
  // }

  // initialize audio player
  await configurePlayer();
  // await container.read(configurePlayerProvider.future);
  // run the app
  runApp(
    UncontrolledProviderScope(container: container, child: Framework(AbsApp())),
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
        // titleBarStyle: TitleBarStyle.hidden, // 隐藏标题栏
        // windowButtonVisibility: false, // 隐藏窗口按钮
      );
      await windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.setPreventClose(true);
      });
      break;
    default:
      break;
  }
}

class AbsApp extends HookConsumerWidget {
  const AbsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servers = ref.watch(audiobookShelfServerProvider);
    final activeUser = ref.watch(
      apiSettingsProvider.select((v) => v.activeUser),
    );

    final needOnboarding = activeUser == null || servers.isEmpty;

    if (needOnboarding) {
      routerConfig.goNamed(Routes.onboarding.name);
    }
    final language = ref.watch(appSettingsProvider.select((v) => v.language));
    final themeSettings = ref.watch(
      appSettingsProvider.select((v) => v.themeSettings),
    );
    final currentTheme = ref.watch(
      currentThemeProvider(
        highContrast: MediaQuery.of(context).highContrast,
        id: ref.watch(currentBookProvider)?.libraryItemId,
      ),
    );
    try {
      return MaterialApp.router(
        locale: Locale(language),
        scrollBehavior: AppCustomScrollBehavior(),
        localizationsDelegates: [
          // 以下是其他代理
          S.delegate, //String 资源的 本地化
          GlobalMaterialLocalizations.delegate, //Material Widgets 的本地化
          GlobalWidgetsLocalizations.delegate, //基础 Widgets 的本地化
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: currentTheme.$1,
        darkTheme: currentTheme.$2,
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
