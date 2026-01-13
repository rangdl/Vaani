// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookSettings _$BookSettingsFromJson(Map<String, dynamic> json) =>
    _BookSettings(
      bookId: json['bookId'] as String,
      playerSettings: json['playerSettings'] == null
          ? const NullablePlayerSettings()
          : NullablePlayerSettings.fromJson(
              json['playerSettings'] as Map<String, dynamic>,
            ),
      progress: json['progress'] == null
          ? null
          : BookProgress.fromJson(json['progress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookSettingsToJson(_BookSettings instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'playerSettings': instance.playerSettings,
      'progress': instance.progress,
    };

_BookProgress _$BookProgressFromJson(Map<String, dynamic> json) =>
    _BookProgress(
      lastUpdate: DateTime.parse(json['lastUpdate'] as String),
      currentTime: json['currentTime'] == null
          ? Duration.zero
          : Duration(microseconds: (json['currentTime'] as num).toInt()),
    );

Map<String, dynamic> _$BookProgressToJson(_BookProgress instance) =>
    <String, dynamic>{
      'lastUpdate': instance.lastUpdate.toIso8601String(),
      'currentTime': instance.currentTime.inMicroseconds,
    };
