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
