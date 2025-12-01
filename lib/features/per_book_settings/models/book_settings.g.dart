// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookSettingsImpl _$$BookSettingsImplFromJson(Map<String, dynamic> json) =>
    _$BookSettingsImpl(
      bookId: json['bookId'] as String,
      playerSettings: json['playerSettings'] == null
          ? const NullablePlayerSettings()
          : NullablePlayerSettings.fromJson(
              json['playerSettings'] as Map<String, dynamic>),
      progress: json['progress'] == null
          ? null
          : BookProgress.fromJson(json['progress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BookSettingsImplToJson(_$BookSettingsImpl instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'playerSettings': instance.playerSettings,
      'progress': instance.progress,
    };

_$BookProgressImpl _$$BookProgressImplFromJson(Map<String, dynamic> json) =>
    _$BookProgressImpl(
      lastUpdate: DateTime.parse(json['lastUpdate'] as String),
      currentTime: json['currentTime'] == null
          ? Duration.zero
          : Duration(microseconds: (json['currentTime'] as num).toInt()),
    );

Map<String, dynamic> _$$BookProgressImplToJson(_$BookProgressImpl instance) =>
    <String, dynamic>{
      'lastUpdate': instance.lastUpdate.toIso8601String(),
      'currentTime': instance.currentTime.inMicroseconds,
    };
