import 'dart:io';

import 'package:flutter/foundation.dart';

class Utils {
  static isAndroid() {
    return !kIsWeb && Platform.isAndroid;
  }

  static isIOS() {
    return !kIsWeb && Platform.isIOS;
  }

  static isMobile() {
    return !kIsWeb && (Platform.isAndroid || Platform.isIOS);
  }

  static isDesktop() {
    if (kIsWeb) {
      return false;
    }
    return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  }

  static isWindows() {
    return !kIsWeb && Platform.isWindows;
  }

  static isMacos() {
    return !kIsWeb && Platform.isMacOS;
  }

  static isLinux() {
    return !kIsWeb && Platform.isLinux;
  }

  static isWeb() {
    return kIsWeb;
  }
}
