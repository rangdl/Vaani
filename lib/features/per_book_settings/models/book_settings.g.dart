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
    );

Map<String, dynamic> _$BookSettingsToJson(_BookSettings instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'playerSettings': instance.playerSettings,
    };
