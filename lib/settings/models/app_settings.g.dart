// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  themeSettings: json['themeSettings'] == null
      ? const ThemeSettings()
      : ThemeSettings.fromJson(json['themeSettings'] as Map<String, dynamic>),
  playerSettings: json['playerSettings'] == null
      ? const PlayerSettings()
      : PlayerSettings.fromJson(json['playerSettings'] as Map<String, dynamic>),
  sleepTimerSettings: json['sleepTimerSettings'] == null
      ? const SleepTimerSettings()
      : SleepTimerSettings.fromJson(
          json['sleepTimerSettings'] as Map<String, dynamic>,
        ),
  downloadSettings: json['downloadSettings'] == null
      ? const DownloadSettings()
      : DownloadSettings.fromJson(
          json['downloadSettings'] as Map<String, dynamic>,
        ),
  notificationSettings: json['notificationSettings'] == null
      ? const NotificationSettings()
      : NotificationSettings.fromJson(
          json['notificationSettings'] as Map<String, dynamic>,
        ),
  shakeDetectionSettings: json['shakeDetectionSettings'] == null
      ? const ShakeDetectionSettings()
      : ShakeDetectionSettings.fromJson(
          json['shakeDetectionSettings'] as Map<String, dynamic>,
        ),
  homePageSettings: json['homePageSettings'] == null
      ? const HomePageSettings()
      : HomePageSettings.fromJson(
          json['homePageSettings'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'themeSettings': instance.themeSettings,
      'playerSettings': instance.playerSettings,
      'sleepTimerSettings': instance.sleepTimerSettings,
      'downloadSettings': instance.downloadSettings,
      'notificationSettings': instance.notificationSettings,
      'shakeDetectionSettings': instance.shakeDetectionSettings,
      'homePageSettings': instance.homePageSettings,
    };

_ThemeSettings _$ThemeSettingsFromJson(Map<String, dynamic> json) =>
    _ThemeSettings(
      themeMode:
          $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
      highContrast: json['highContrast'] as bool? ?? false,
      useMaterialThemeFromSystem:
          json['useMaterialThemeFromSystem'] as bool? ?? false,
      customThemeColor: json['customThemeColor'] as String? ?? '#FF311B92',
      useMaterialThemeOnItemPage:
          json['useMaterialThemeOnItemPage'] as bool? ?? true,
      useCurrentPlayerThemeThroughoutApp:
          json['useCurrentPlayerThemeThroughoutApp'] as bool? ?? true,
    );

Map<String, dynamic> _$ThemeSettingsToJson(_ThemeSettings instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'highContrast': instance.highContrast,
      'useMaterialThemeFromSystem': instance.useMaterialThemeFromSystem,
      'customThemeColor': instance.customThemeColor,
      'useMaterialThemeOnItemPage': instance.useMaterialThemeOnItemPage,
      'useCurrentPlayerThemeThroughoutApp':
          instance.useCurrentPlayerThemeThroughoutApp,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

_PlayerSettings _$PlayerSettingsFromJson(
  Map<String, dynamic> json,
) => _PlayerSettings(
  miniPlayerSettings: json['miniPlayerSettings'] == null
      ? const MinimizedPlayerSettings()
      : MinimizedPlayerSettings.fromJson(
          json['miniPlayerSettings'] as Map<String, dynamic>,
        ),
  expandedPlayerSettings: json['expandedPlayerSettings'] == null
      ? const ExpandedPlayerSettings()
      : ExpandedPlayerSettings.fromJson(
          json['expandedPlayerSettings'] as Map<String, dynamic>,
        ),
  preferredDefaultVolume:
      (json['preferredDefaultVolume'] as num?)?.toDouble() ?? 1,
  preferredDefaultSpeed:
      (json['preferredDefaultSpeed'] as num?)?.toDouble() ?? 1,
  speedOptions:
      (json['speedOptions'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList() ??
      const [1, 1.25, 1.5, 1.75, 2],
  speedIncrement: (json['speedIncrement'] as num?)?.toDouble() ?? 0.05,
  minSpeed: (json['minSpeed'] as num?)?.toDouble() ?? 0.1,
  maxSpeed: (json['maxSpeed'] as num?)?.toDouble() ?? 4,
  minimumPositionForReporting: json['minimumPositionForReporting'] == null
      ? const Duration(seconds: 10)
      : Duration(
          microseconds: (json['minimumPositionForReporting'] as num).toInt(),
        ),
  playbackReportInterval: json['playbackReportInterval'] == null
      ? const Duration(seconds: 10)
      : Duration(microseconds: (json['playbackReportInterval'] as num).toInt()),
  markCompleteWhenTimeLeft: json['markCompleteWhenTimeLeft'] == null
      ? const Duration(seconds: 15)
      : Duration(
          microseconds: (json['markCompleteWhenTimeLeft'] as num).toInt(),
        ),
  configurePlayerForEveryBook:
      json['configurePlayerForEveryBook'] as bool? ?? true,
);

Map<String, dynamic> _$PlayerSettingsToJson(
  _PlayerSettings instance,
) => <String, dynamic>{
  'miniPlayerSettings': instance.miniPlayerSettings,
  'expandedPlayerSettings': instance.expandedPlayerSettings,
  'preferredDefaultVolume': instance.preferredDefaultVolume,
  'preferredDefaultSpeed': instance.preferredDefaultSpeed,
  'speedOptions': instance.speedOptions,
  'speedIncrement': instance.speedIncrement,
  'minSpeed': instance.minSpeed,
  'maxSpeed': instance.maxSpeed,
  'minimumPositionForReporting':
      instance.minimumPositionForReporting.inMicroseconds,
  'playbackReportInterval': instance.playbackReportInterval.inMicroseconds,
  'markCompleteWhenTimeLeft': instance.markCompleteWhenTimeLeft.inMicroseconds,
  'configurePlayerForEveryBook': instance.configurePlayerForEveryBook,
};

_ExpandedPlayerSettings _$ExpandedPlayerSettingsFromJson(
  Map<String, dynamic> json,
) => _ExpandedPlayerSettings(
  showTotalProgress: json['showTotalProgress'] as bool? ?? false,
  showChapterProgress: json['showChapterProgress'] as bool? ?? true,
);

Map<String, dynamic> _$ExpandedPlayerSettingsToJson(
  _ExpandedPlayerSettings instance,
) => <String, dynamic>{
  'showTotalProgress': instance.showTotalProgress,
  'showChapterProgress': instance.showChapterProgress,
};

_MinimizedPlayerSettings _$MinimizedPlayerSettingsFromJson(
  Map<String, dynamic> json,
) => _MinimizedPlayerSettings(
  useChapterInfo: json['useChapterInfo'] as bool? ?? false,
);

Map<String, dynamic> _$MinimizedPlayerSettingsToJson(
  _MinimizedPlayerSettings instance,
) => <String, dynamic>{'useChapterInfo': instance.useChapterInfo};

_SleepTimerSettings _$SleepTimerSettingsFromJson(Map<String, dynamic> json) =>
    _SleepTimerSettings(
      defaultDuration: json['defaultDuration'] == null
          ? const Duration(minutes: 15)
          : Duration(microseconds: (json['defaultDuration'] as num).toInt()),
      presetDurations:
          (json['presetDurations'] as List<dynamic>?)
              ?.map((e) => Duration(microseconds: (e as num).toInt()))
              .toList() ??
          const [
            Duration(minutes: 5),
            Duration(minutes: 10),
            Duration(minutes: 15),
            Duration(minutes: 20),
            Duration(minutes: 30),
          ],
      maxDuration: json['maxDuration'] == null
          ? const Duration(minutes: 100)
          : Duration(microseconds: (json['maxDuration'] as num).toInt()),
      fadeOutAudio: json['fadeOutAudio'] as bool? ?? false,
      fadeOutDuration: json['fadeOutDuration'] == null
          ? const Duration(seconds: 20)
          : Duration(microseconds: (json['fadeOutDuration'] as num).toInt()),
      autoRewindWhenStopped: json['autoRewindWhenStopped'] as bool? ?? false,
      autoRewindDurations:
          (json['autoRewindDurations'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              int.parse(k),
              Duration(microseconds: (e as num).toInt()),
            ),
          ) ??
          const {
            5: Duration(seconds: 10),
            15: Duration(seconds: 30),
            45: Duration(seconds: 45),
            60: Duration(minutes: 1),
            120: Duration(minutes: 2),
          },
      autoTurnOnTimer: json['autoTurnOnTimer'] as bool? ?? false,
      alwaysAutoTurnOnTimer: json['alwaysAutoTurnOnTimer'] as bool? ?? false,
      autoTurnOnTime: json['autoTurnOnTime'] == null
          ? const Duration(hours: 22, minutes: 0)
          : Duration(microseconds: (json['autoTurnOnTime'] as num).toInt()),
      autoTurnOffTime: json['autoTurnOffTime'] == null
          ? const Duration(hours: 6, minutes: 0)
          : Duration(microseconds: (json['autoTurnOffTime'] as num).toInt()),
    );

Map<String, dynamic> _$SleepTimerSettingsToJson(_SleepTimerSettings instance) =>
    <String, dynamic>{
      'defaultDuration': instance.defaultDuration.inMicroseconds,
      'presetDurations': instance.presetDurations
          .map((e) => e.inMicroseconds)
          .toList(),
      'maxDuration': instance.maxDuration.inMicroseconds,
      'fadeOutAudio': instance.fadeOutAudio,
      'fadeOutDuration': instance.fadeOutDuration.inMicroseconds,
      'autoRewindWhenStopped': instance.autoRewindWhenStopped,
      'autoRewindDurations': instance.autoRewindDurations.map(
        (k, e) => MapEntry(k.toString(), e.inMicroseconds),
      ),
      'autoTurnOnTimer': instance.autoTurnOnTimer,
      'alwaysAutoTurnOnTimer': instance.alwaysAutoTurnOnTimer,
      'autoTurnOnTime': instance.autoTurnOnTime.inMicroseconds,
      'autoTurnOffTime': instance.autoTurnOffTime.inMicroseconds,
    };

_DownloadSettings _$DownloadSettingsFromJson(Map<String, dynamic> json) =>
    _DownloadSettings(
      requiresWiFi: json['requiresWiFi'] as bool? ?? true,
      retries: (json['retries'] as num?)?.toInt() ?? 3,
      allowPause: json['allowPause'] as bool? ?? true,
      maxConcurrent: (json['maxConcurrent'] as num?)?.toInt() ?? 3,
      maxConcurrentByHost: (json['maxConcurrentByHost'] as num?)?.toInt() ?? 3,
      maxConcurrentByGroup:
          (json['maxConcurrentByGroup'] as num?)?.toInt() ?? 3,
    );

Map<String, dynamic> _$DownloadSettingsToJson(_DownloadSettings instance) =>
    <String, dynamic>{
      'requiresWiFi': instance.requiresWiFi,
      'retries': instance.retries,
      'allowPause': instance.allowPause,
      'maxConcurrent': instance.maxConcurrent,
      'maxConcurrentByHost': instance.maxConcurrentByHost,
      'maxConcurrentByGroup': instance.maxConcurrentByGroup,
    };

_NotificationSettings _$NotificationSettingsFromJson(
  Map<String, dynamic> json,
) => _NotificationSettings(
  fastForwardInterval: json['fastForwardInterval'] == null
      ? const Duration(seconds: 30)
      : Duration(microseconds: (json['fastForwardInterval'] as num).toInt()),
  rewindInterval: json['rewindInterval'] == null
      ? const Duration(seconds: 10)
      : Duration(microseconds: (json['rewindInterval'] as num).toInt()),
  progressBarIsChapterProgress:
      json['progressBarIsChapterProgress'] as bool? ?? true,
  primaryTitle: json['primaryTitle'] as String? ?? '\$bookTitle',
  secondaryTitle: json['secondaryTitle'] as String? ?? '\$author',
  mediaControls:
      (json['mediaControls'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$NotificationMediaControlEnumMap, e))
          .toList() ??
      const [
        NotificationMediaControl.rewind,
        NotificationMediaControl.fastForward,
        NotificationMediaControl.skipToPreviousChapter,
        NotificationMediaControl.skipToNextChapter,
      ],
);

Map<String, dynamic> _$NotificationSettingsToJson(
  _NotificationSettings instance,
) => <String, dynamic>{
  'fastForwardInterval': instance.fastForwardInterval.inMicroseconds,
  'rewindInterval': instance.rewindInterval.inMicroseconds,
  'progressBarIsChapterProgress': instance.progressBarIsChapterProgress,
  'primaryTitle': instance.primaryTitle,
  'secondaryTitle': instance.secondaryTitle,
  'mediaControls': instance.mediaControls
      .map((e) => _$NotificationMediaControlEnumMap[e]!)
      .toList(),
};

const _$NotificationMediaControlEnumMap = {
  NotificationMediaControl.fastForward: 'fastForward',
  NotificationMediaControl.rewind: 'rewind',
  NotificationMediaControl.speedToggle: 'speedToggle',
  NotificationMediaControl.stop: 'stop',
  NotificationMediaControl.skipToNextChapter: 'skipToNextChapter',
  NotificationMediaControl.skipToPreviousChapter: 'skipToPreviousChapter',
};

_ShakeDetectionSettings _$ShakeDetectionSettingsFromJson(
  Map<String, dynamic> json,
) => _ShakeDetectionSettings(
  isEnabled: json['isEnabled'] as bool? ?? true,
  direction:
      $enumDecodeNullable(_$ShakeDirectionEnumMap, json['direction']) ??
      ShakeDirection.horizontal,
  threshold: (json['threshold'] as num?)?.toDouble() ?? 5,
  shakeAction:
      $enumDecodeNullable(_$ShakeActionEnumMap, json['shakeAction']) ??
      ShakeAction.resetSleepTimer,
  feedback:
      (json['feedback'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ShakeDetectedFeedbackEnumMap, e))
          .toSet() ??
      const {ShakeDetectedFeedback.vibrate},
  beepVolume: (json['beepVolume'] as num?)?.toDouble() ?? 0.5,
  shakeTriggerCoolDown: json['shakeTriggerCoolDown'] == null
      ? const Duration(seconds: 2)
      : Duration(microseconds: (json['shakeTriggerCoolDown'] as num).toInt()),
  shakeTriggerCount: (json['shakeTriggerCount'] as num?)?.toInt() ?? 2,
  samplingPeriod: json['samplingPeriod'] == null
      ? const Duration(milliseconds: 100)
      : Duration(microseconds: (json['samplingPeriod'] as num).toInt()),
);

Map<String, dynamic> _$ShakeDetectionSettingsToJson(
  _ShakeDetectionSettings instance,
) => <String, dynamic>{
  'isEnabled': instance.isEnabled,
  'direction': _$ShakeDirectionEnumMap[instance.direction]!,
  'threshold': instance.threshold,
  'shakeAction': _$ShakeActionEnumMap[instance.shakeAction]!,
  'feedback': instance.feedback
      .map((e) => _$ShakeDetectedFeedbackEnumMap[e]!)
      .toList(),
  'beepVolume': instance.beepVolume,
  'shakeTriggerCoolDown': instance.shakeTriggerCoolDown.inMicroseconds,
  'shakeTriggerCount': instance.shakeTriggerCount,
  'samplingPeriod': instance.samplingPeriod.inMicroseconds,
};

const _$ShakeDirectionEnumMap = {
  ShakeDirection.horizontal: 'horizontal',
  ShakeDirection.vertical: 'vertical',
};

const _$ShakeActionEnumMap = {
  ShakeAction.none: 'none',
  ShakeAction.playPause: 'playPause',
  ShakeAction.resetSleepTimer: 'resetSleepTimer',
  ShakeAction.fastForward: 'fastForward',
  ShakeAction.rewind: 'rewind',
};

const _$ShakeDetectedFeedbackEnumMap = {
  ShakeDetectedFeedback.vibrate: 'vibrate',
  ShakeDetectedFeedback.beep: 'beep',
};

_HomePageSettings _$HomePageSettingsFromJson(Map<String, dynamic> json) =>
    _HomePageSettings(
      showPlayButtonOnContinueListeningShelf:
          json['showPlayButtonOnContinueListeningShelf'] as bool? ?? true,
      showPlayButtonOnContinueSeriesShelf:
          json['showPlayButtonOnContinueSeriesShelf'] as bool? ?? false,
      showPlayButtonOnAllRemainingShelves:
          json['showPlayButtonOnAllRemainingShelves'] as bool? ?? false,
      showPlayButtonOnListenAgainShelf:
          json['showPlayButtonOnListenAgainShelf'] as bool? ?? false,
    );

Map<String, dynamic> _$HomePageSettingsToJson(
  _HomePageSettings instance,
) => <String, dynamic>{
  'showPlayButtonOnContinueListeningShelf':
      instance.showPlayButtonOnContinueListeningShelf,
  'showPlayButtonOnContinueSeriesShelf':
      instance.showPlayButtonOnContinueSeriesShelf,
  'showPlayButtonOnAllRemainingShelves':
      instance.showPlayButtonOnAllRemainingShelves,
  'showPlayButtonOnListenAgainShelf': instance.showPlayButtonOnListenAgainShelf,
};
