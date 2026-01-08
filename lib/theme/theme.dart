import 'dart:io';

import 'package:flutter/material.dart';

// brand color rgb(49, 27, 146) rgb(96, 76, 236)
const brandColor = Color(0xFF311B92);
const brandColorLight = Color(0xFF604CEC);

final brandLightColorScheme = ColorScheme.fromSeed(
  seedColor: brandColor,
  brightness: Brightness.light,
);

final brandDarkColorScheme = ColorScheme.fromSeed(
  seedColor: brandColor,
  brightness: Brightness.dark,
);

/// 系统字体（跨平台）
String get fontFamilyPlatform {
  if (Platform.isIOS || Platform.isMacOS) {
    return 'PingFang SC'; // 苹方，仅苹果设备
  } else if (Platform.isAndroid) {
    return 'Roboto'; // Android 默认
  } else if (Platform.isWindows) {
    return 'Microsoft YaHei'; // Windows 微软雅黑
    // } else if (Platform.isLinux) {
    //   return 'Ubuntu'; // Linux
  } else {
    return 'Arial'; // 其他平台回退
  }
}

// letterSpacing 字间距
const defaultTextTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 57.0,
    fontWeight: FontWeight.w400,
    height: 1.12,
    letterSpacing: -0.25,
  ),
  displayMedium: TextStyle(
    fontSize: 45.0,
    fontWeight: FontWeight.w400,
    height: 1.16,
    letterSpacing: 0.0,
  ),
  displaySmall: TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.w400,
    height: 1.22,
    letterSpacing: 0.0,
  ),
  headlineLarge: TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w400,
    height: 1.25,
    letterSpacing: 0.0,
  ),
  headlineMedium: TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w400,
    height: 1.29,
    letterSpacing: 0.0,
  ),
  headlineSmall: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.0,
  ),
  titleLarge: TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w400,
    height: 1.27,
    letterSpacing: 0.0,
  ),
  titleMedium: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0.15,
  ),
  titleSmall: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
  ),
  bodyLarge: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.5,
  ),
  bodyMedium: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.25,
  ),
  bodySmall: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
  ),
  labelLarge: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
  ),
  labelMedium: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.5,
  ),
  labelSmall: TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
    height: 1.45,
    letterSpacing: 0.5,
  ),
);

const textTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 44, // 大标题保持较大尺寸
    fontWeight: FontWeight.w400,
    height: 1.12,
    letterSpacing: -0.25,
  ),
  displayMedium: TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    height: 1.16,
    letterSpacing: 0.0,
  ),
  displaySmall: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    height: 1.22,
    letterSpacing: 0.0,
  ),
  headlineLarge: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    height: 1.25,
    letterSpacing: 0.0,
  ),
  headlineMedium: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.29,
    letterSpacing: 0.0,
  ),
  headlineSmall: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.0,
  ),
  titleLarge: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.27,
    letterSpacing: 0.0,
  ),
  titleMedium: TextStyle(
    fontSize: 15, // 保持接近原始比例
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0.15,
  ),
  titleSmall: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
  ),
  bodyLarge: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.5,
  ),
  bodyMedium: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.25,
  ),
  bodySmall: TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
  ),
  labelLarge: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
  ),
  labelMedium: TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.5,
  ),
  labelSmall: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.45,
    letterSpacing: 0.5,
  ),
);
