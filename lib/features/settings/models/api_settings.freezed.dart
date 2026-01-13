// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiSettings {

 AudiobookShelfServer? get activeServer; AuthenticatedUser? get activeUser; String? get activeLibraryId;
/// Create a copy of ApiSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiSettingsCopyWith<ApiSettings> get copyWith => _$ApiSettingsCopyWithImpl<ApiSettings>(this as ApiSettings, _$identity);

  /// Serializes this ApiSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiSettings&&(identical(other.activeServer, activeServer) || other.activeServer == activeServer)&&(identical(other.activeUser, activeUser) || other.activeUser == activeUser)&&(identical(other.activeLibraryId, activeLibraryId) || other.activeLibraryId == activeLibraryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeServer,activeUser,activeLibraryId);

@override
String toString() {
  return 'ApiSettings(activeServer: $activeServer, activeUser: $activeUser, activeLibraryId: $activeLibraryId)';
}


}

/// @nodoc
abstract mixin class $ApiSettingsCopyWith<$Res>  {
  factory $ApiSettingsCopyWith(ApiSettings value, $Res Function(ApiSettings) _then) = _$ApiSettingsCopyWithImpl;
@useResult
$Res call({
 AudiobookShelfServer? activeServer, AuthenticatedUser? activeUser, String? activeLibraryId
});


$AudiobookShelfServerCopyWith<$Res>? get activeServer;$AuthenticatedUserCopyWith<$Res>? get activeUser;

}
/// @nodoc
class _$ApiSettingsCopyWithImpl<$Res>
    implements $ApiSettingsCopyWith<$Res> {
  _$ApiSettingsCopyWithImpl(this._self, this._then);

  final ApiSettings _self;
  final $Res Function(ApiSettings) _then;

/// Create a copy of ApiSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeServer = freezed,Object? activeUser = freezed,Object? activeLibraryId = freezed,}) {
  return _then(_self.copyWith(
activeServer: freezed == activeServer ? _self.activeServer : activeServer // ignore: cast_nullable_to_non_nullable
as AudiobookShelfServer?,activeUser: freezed == activeUser ? _self.activeUser : activeUser // ignore: cast_nullable_to_non_nullable
as AuthenticatedUser?,activeLibraryId: freezed == activeLibraryId ? _self.activeLibraryId : activeLibraryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ApiSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudiobookShelfServerCopyWith<$Res>? get activeServer {
    if (_self.activeServer == null) {
    return null;
  }

  return $AudiobookShelfServerCopyWith<$Res>(_self.activeServer!, (value) {
    return _then(_self.copyWith(activeServer: value));
  });
}/// Create a copy of ApiSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthenticatedUserCopyWith<$Res>? get activeUser {
    if (_self.activeUser == null) {
    return null;
  }

  return $AuthenticatedUserCopyWith<$Res>(_self.activeUser!, (value) {
    return _then(_self.copyWith(activeUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApiSettings].
extension ApiSettingsPatterns on ApiSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiSettings value)  $default,){
final _that = this;
switch (_that) {
case _ApiSettings():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ApiSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AudiobookShelfServer? activeServer,  AuthenticatedUser? activeUser,  String? activeLibraryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiSettings() when $default != null:
return $default(_that.activeServer,_that.activeUser,_that.activeLibraryId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AudiobookShelfServer? activeServer,  AuthenticatedUser? activeUser,  String? activeLibraryId)  $default,) {final _that = this;
switch (_that) {
case _ApiSettings():
return $default(_that.activeServer,_that.activeUser,_that.activeLibraryId);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AudiobookShelfServer? activeServer,  AuthenticatedUser? activeUser,  String? activeLibraryId)?  $default,) {final _that = this;
switch (_that) {
case _ApiSettings() when $default != null:
return $default(_that.activeServer,_that.activeUser,_that.activeLibraryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiSettings implements ApiSettings {
  const _ApiSettings({this.activeServer, this.activeUser, this.activeLibraryId});
  factory _ApiSettings.fromJson(Map<String, dynamic> json) => _$ApiSettingsFromJson(json);

@override final  AudiobookShelfServer? activeServer;
@override final  AuthenticatedUser? activeUser;
@override final  String? activeLibraryId;

/// Create a copy of ApiSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiSettingsCopyWith<_ApiSettings> get copyWith => __$ApiSettingsCopyWithImpl<_ApiSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiSettings&&(identical(other.activeServer, activeServer) || other.activeServer == activeServer)&&(identical(other.activeUser, activeUser) || other.activeUser == activeUser)&&(identical(other.activeLibraryId, activeLibraryId) || other.activeLibraryId == activeLibraryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeServer,activeUser,activeLibraryId);

@override
String toString() {
  return 'ApiSettings(activeServer: $activeServer, activeUser: $activeUser, activeLibraryId: $activeLibraryId)';
}


}

/// @nodoc
abstract mixin class _$ApiSettingsCopyWith<$Res> implements $ApiSettingsCopyWith<$Res> {
  factory _$ApiSettingsCopyWith(_ApiSettings value, $Res Function(_ApiSettings) _then) = __$ApiSettingsCopyWithImpl;
@override @useResult
$Res call({
 AudiobookShelfServer? activeServer, AuthenticatedUser? activeUser, String? activeLibraryId
});


@override $AudiobookShelfServerCopyWith<$Res>? get activeServer;@override $AuthenticatedUserCopyWith<$Res>? get activeUser;

}
/// @nodoc
class __$ApiSettingsCopyWithImpl<$Res>
    implements _$ApiSettingsCopyWith<$Res> {
  __$ApiSettingsCopyWithImpl(this._self, this._then);

  final _ApiSettings _self;
  final $Res Function(_ApiSettings) _then;

/// Create a copy of ApiSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeServer = freezed,Object? activeUser = freezed,Object? activeLibraryId = freezed,}) {
  return _then(_ApiSettings(
activeServer: freezed == activeServer ? _self.activeServer : activeServer // ignore: cast_nullable_to_non_nullable
as AudiobookShelfServer?,activeUser: freezed == activeUser ? _self.activeUser : activeUser // ignore: cast_nullable_to_non_nullable
as AuthenticatedUser?,activeLibraryId: freezed == activeLibraryId ? _self.activeLibraryId : activeLibraryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ApiSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudiobookShelfServerCopyWith<$Res>? get activeServer {
    if (_self.activeServer == null) {
    return null;
  }

  return $AudiobookShelfServerCopyWith<$Res>(_self.activeServer!, (value) {
    return _then(_self.copyWith(activeServer: value));
  });
}/// Create a copy of ApiSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthenticatedUserCopyWith<$Res>? get activeUser {
    if (_self.activeUser == null) {
    return null;
  }

  return $AuthenticatedUserCopyWith<$Res>(_self.activeUser!, (value) {
    return _then(_self.copyWith(activeUser: value));
  });
}
}

// dart format on
