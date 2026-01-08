import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/theme/providers/theme_from_cover_provider.dart';
import 'package:vaani/theme/theme.dart';

part 'system_theme_provider.g.dart';

final _logger = Logger('SystemThemeProvider');

/// copied from [DynamicColorBuilder]
@Riverpod(keepAlive: true)
FutureOr<(ColorScheme light, ColorScheme dark)?> systemTheme(
  Ref ref, {
  bool highContrast = false,
}) async {
  _logger.fine('Generating system theme');
  ColorScheme? schemeLight;
  ColorScheme? schemeDark;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    CorePalette? corePalette = await DynamicColorPlugin.getCorePalette();

    if (corePalette != null) {
      _logger.fine('dynamic_color: Core palette detected.');
      schemeLight = corePalette.toColorScheme(brightness: Brightness.light);
      schemeDark = corePalette.toColorScheme(brightness: Brightness.dark);
    }
  } on PlatformException {
    _logger.warning('dynamic_color: Failed to obtain core palette.');
  }

  if (schemeLight == null || schemeDark == null) {
    try {
      final Color? accentColor = await DynamicColorPlugin.getAccentColor();

      if (accentColor != null) {
        _logger.fine('dynamic_color: Accent color detected.');
        schemeLight = ColorScheme.fromSeed(
          seedColor: accentColor,
          brightness: Brightness.light,
        );
        schemeDark = ColorScheme.fromSeed(
          seedColor: accentColor,
          brightness: Brightness.dark,
        );
      }
    } on PlatformException {
      _logger.warning('dynamic_color: Failed to obtain accent color.');
    }
  }

  if (schemeLight == null || schemeDark == null) {
    _logger
        .warning('dynamic_color: Dynamic color not detected on this device.');
    return null;
  }
  // set high contrast theme
  if (highContrast) {
    schemeLight = schemeLight
        .copyWith(
          surface: Colors.white,
        )
        .harmonized();
    schemeDark = schemeDark
        .copyWith(
          surface: Colors.black,
        )
        .harmonized();
  }
  return (schemeLight, schemeDark);
}

@riverpod
(ThemeData light, ThemeData dark) currentTheme(
  Ref ref, {
  bool highContrast = false,
  String? id,
}) {
  final themeSettings =
      ref.watch(appSettingsProvider.select((v) => v.themeSettings));
  ColorScheme lightColorScheme = brandLightColorScheme;
  ColorScheme darkColorScheme = brandDarkColorScheme;

  final shouldUseHighContrast = themeSettings.highContrast || highContrast;

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
      if (id != null) {
        final themeLight = ref.watch(
          themeOfLibraryItemProvider(
            id,
            highContrast: shouldUseHighContrast,
            brightness: Brightness.light,
          ),
        );
        final themeDark = ref.watch(
          themeOfLibraryItemProvider(
            id,
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
      _logger.severe('not building with player theme');
      _logger.severe(e.toString());
    }
  }
  final appThemeLight = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme.harmonized(),
    fontFamily: fontFamilyPlatform,
    textTheme: textTheme,
  );
  final appThemeDark = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme.harmonized(),
    fontFamily: fontFamilyPlatform,
    textTheme: textTheme,
    brightness: Brightness.dark,
    // TODO bottom sheet theme is not working
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: darkColorScheme.surface,
    ),
  );
  return (appThemeLight, appThemeDark);
}
