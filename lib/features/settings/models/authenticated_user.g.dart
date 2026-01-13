// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthenticatedUser _$AuthenticatedUserFromJson(Map<String, dynamic> json) =>
    _AuthenticatedUser(
      server: AudiobookShelfServer.fromJson(
        json['server'] as Map<String, dynamic>,
      ),
      authToken: json['authToken'] as String,
      id: json['id'] as String,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$AuthenticatedUserToJson(_AuthenticatedUser instance) =>
    <String, dynamic>{
      'server': instance.server,
      'authToken': instance.authToken,
      'id': instance.id,
      'username': instance.username,
    };
