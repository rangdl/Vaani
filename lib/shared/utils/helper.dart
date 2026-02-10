import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:vaani/l10n/generated/l10n.dart';

class Helper {
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

  static String formattedTime(Duration position) {
    int totalMinutes = position.inMinutes;
    int hours = totalMinutes >= 60 ? totalMinutes ~/ 60 : 0;
    int minutes = totalMinutes % 60;
    int seconds = position.inSeconds % 60;

    String formattedTime = '';
    if (hours > 0) {
      formattedTime = '${hours.toString().padLeft(2, '0')}:';
    }
    formattedTime +=
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return formattedTime;
  }

  static String formatTimeToClock(num? seconds) {
    if (seconds == null) return '00:00';
    return formattedTime(Duration(seconds: seconds.toInt()));
  }

  static String formatTimeToReadable(
    num? seconds, {
    bool precise = false,
    bool short = false,
  }) {
    if (short) return formatTimeToReadableShort(seconds, precise: precise);

    seconds ??= 0;

    int days = seconds ~/ 86400;
    int hours = (seconds % 86400) ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;

    if (!precise) {
      if (seconds < 60) return S.current.dateFormatSecond(seconds.toInt());
      if (seconds < 3600) return S.current.dateFormatMinute(minutes);
      if (seconds < 86400) {
        return S.current.dateFormatHourMinute(hours, minutes);
      }
      return S.current.dateFormatDayHourMinute(days, hours, minutes);
    } else {
      num timeSeconds = seconds % 60;
      if (seconds < 60) return S.current.dateFormatSecond(timeSeconds.toInt());
      if (seconds < 3600) {
        return S.current.dateFormatMinuteSecond(minutes, timeSeconds.toInt());
      }
      if (seconds < 86400) {
        return S.current.dateFormatHourMinuteSecond(
          hours,
          minutes,
          timeSeconds.toInt(),
        );
      }
      return S.current.dateFormatDayHourMinuteSecond(
        days,
        hours,
        minutes,
        timeSeconds.toInt(),
      );
    }
  }

  static formatTimeToReadableShort(num? seconds, {bool precise = false}) {
    seconds ??= 0;

    int days = seconds ~/ 86400;
    int hours = (seconds % 86400) ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;

    if (!precise) {
      if (seconds < 60) return S.current.dateFormatSecondShort(seconds.toInt());
      if (seconds < 3600) return S.current.dateFormatMinuteShort(minutes);
      if (seconds < 86400) {
        return S.current.dateFormatHourMinuteShort(hours, minutes);
      }
      return S.current.dateFormatDayHourMinuteShort(days, hours, minutes);
    } else {
      num timeSeconds = seconds % 60;
      if (seconds < 60) {
        return S.current.dateFormatSecondShort(timeSeconds.toInt());
      }
      if (seconds < 3600) {
        return S.current.dateFormatMinuteSecondShort(
          minutes,
          timeSeconds.toInt(),
        );
      }
      if (seconds < 86400) {
        return S.current.dateFormatHourMinuteSecondShort(
          hours,
          minutes,
          timeSeconds.toInt(),
        );
      }
      return S.current.dateFormatDayHourMinuteSecondShort(
        days,
        hours,
        minutes,
        timeSeconds.toInt(),
      );
    }
  }
}
