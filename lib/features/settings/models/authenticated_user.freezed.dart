// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authenticated_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthenticatedUser {

 AudiobookShelfServer get server; String get authToken; String get id; String? get username;
/// Create a copy of AuthenticatedUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedUserCopyWith<AuthenticatedUser> get copyWith => _$AuthenticatedUserCopyWithImpl<AuthenticatedUser>(this as AuthenticatedUser, _$identity);

  /// Serializes this AuthenticatedUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticatedUser&&(identical(other.server, server) || other.server == server)&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,server,authToken,id,username);

@override
String toString() {
  return 'AuthenticatedUser(server: $server, authToken: $authToken, id: $id, username: $username)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedUserCopyWith<$Res>  {
  factory $AuthenticatedUserCopyWith(AuthenticatedUser value, $Res Function(AuthenticatedUser) _then) = _$AuthenticatedUserCopyWithImpl;
@useResult
$Res call({
 AudiobookShelfServer server, String authToken, String id, String? username
});


$AudiobookShelfServerCopyWith<$Res> get server;

}
/// @nodoc
class _$AuthenticatedUserCopyWithImpl<$Res>
    implements $AuthenticatedUserCopyWith<$Res> {
  _$AuthenticatedUserCopyWithImpl(this._self, this._then);

  final AuthenticatedUser _self;
  final $Res Function(AuthenticatedUser) _then;

/// Create a copy of AuthenticatedUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? server = null,Object? authToken = null,Object? id = null,Object? username = freezed,}) {
  return _then(_self.copyWith(
server: null == server ? _self.server : server // ignore: cast_nullable_to_non_nullable
as AudiobookShelfServer,authToken: null == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AuthenticatedUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudiobookShelfServerCopyWith<$Res> get server {
  
  return $AudiobookShelfServerCopyWith<$Res>(_self.server, (value) {
    return _then(_self.copyWith(server: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthenticatedUser].
extension AuthenticatedUserPatterns on AuthenticatedUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthenticatedUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthenticatedUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthenticatedUser value)  $default,){
final _that = this;
switch (_that) {
case _AuthenticatedUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthenticatedUser value)?  $default,){
final _that = this;
switch (_that) {
case _AuthenticatedUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AudiobookShelfServer server,  String authToken,  String id,  String? username)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthenticatedUser() when $default != null:
return $default(_that.server,_that.authToken,_that.id,_that.username);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AudiobookShelfServer server,  String authToken,  String id,  String? username)  $default,) {final _that = this;
switch (_that) {
case _AuthenticatedUser():
return $default(_that.server,_that.authToken,_that.id,_that.username);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AudiobookShelfServer server,  String authToken,  String id,  String? username)?  $default,) {final _that = this;
switch (_that) {
case _AuthenticatedUser() when $default != null:
return $default(_that.server,_that.authToken,_that.id,_that.username);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthenticatedUser implements AuthenticatedUser {
  const _AuthenticatedUser({required this.server, required this.authToken, required this.id, this.username});
  factory _AuthenticatedUser.fromJson(Map<String, dynamic> json) => _$AuthenticatedUserFromJson(json);

@override final  AudiobookShelfServer server;
@override final  String authToken;
@override final  String id;
@override final  String? username;

/// Create a copy of AuthenticatedUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticatedUserCopyWith<_AuthenticatedUser> get copyWith => __$AuthenticatedUserCopyWithImpl<_AuthenticatedUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthenticatedUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthenticatedUser&&(identical(other.server, server) || other.server == server)&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,server,authToken,id,username);

@override
String toString() {
  return 'AuthenticatedUser(server: $server, authToken: $authToken, id: $id, username: $username)';
}


}

/// @nodoc
abstract mixin class _$AuthenticatedUserCopyWith<$Res> implements $AuthenticatedUserCopyWith<$Res> {
  factory _$AuthenticatedUserCopyWith(_AuthenticatedUser value, $Res Function(_AuthenticatedUser) _then) = __$AuthenticatedUserCopyWithImpl;
@override @useResult
$Res call({
 AudiobookShelfServer server, String authToken, String id, String? username
});


@override $AudiobookShelfServerCopyWith<$Res> get server;

}
/// @nodoc
class __$AuthenticatedUserCopyWithImpl<$Res>
    implements _$AuthenticatedUserCopyWith<$Res> {
  __$AuthenticatedUserCopyWithImpl(this._self, this._then);

  final _AuthenticatedUser _self;
  final $Res Function(_AuthenticatedUser) _then;

/// Create a copy of AuthenticatedUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? server = null,Object? authToken = null,Object? id = null,Object? username = freezed,}) {
  return _then(_AuthenticatedUser(
server: null == server ? _self.server : server // ignore: cast_nullable_to_non_nullable
as AudiobookShelfServer,authToken: null == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AuthenticatedUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudiobookShelfServerCopyWith<$Res> get server {
  
  return $AudiobookShelfServerCopyWith<$Res>(_self.server, (value) {
    return _then(_self.copyWith(server: value));
  });
}
}

// dart format on
