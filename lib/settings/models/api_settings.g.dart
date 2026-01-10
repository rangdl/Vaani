// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiSettings _$ApiSettingsFromJson(Map<String, dynamic> json) => _ApiSettings(
  activeServer: json['activeServer'] == null
      ? null
      : AudiobookShelfServer.fromJson(
          json['activeServer'] as Map<String, dynamic>,
        ),
  activeUser: json['activeUser'] == null
      ? null
      : AuthenticatedUser.fromJson(json['activeUser'] as Map<String, dynamic>),
  activeLibraryId: json['activeLibraryId'] as String?,
);

Map<String, dynamic> _$ApiSettingsToJson(_ApiSettings instance) =>
    <String, dynamic>{
      'activeServer': instance.activeServer,
      'activeUser': instance.activeUser,
      'activeLibraryId': instance.activeLibraryId,
    };
