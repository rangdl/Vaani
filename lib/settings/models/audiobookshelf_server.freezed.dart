// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audiobookshelf_server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudiobookShelfServer {

 AudiobookShelfUri get serverUrl;
/// Create a copy of AudiobookShelfServer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudiobookShelfServerCopyWith<AudiobookShelfServer> get copyWith => _$AudiobookShelfServerCopyWithImpl<AudiobookShelfServer>(this as AudiobookShelfServer, _$identity);

  /// Serializes this AudiobookShelfServer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudiobookShelfServer&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverUrl);

@override
String toString() {
  return 'AudiobookShelfServer(serverUrl: $serverUrl)';
}


}

/// @nodoc
abstract mixin class $AudiobookShelfServerCopyWith<$Res>  {
  factory $AudiobookShelfServerCopyWith(AudiobookShelfServer value, $Res Function(AudiobookShelfServer) _then) = _$AudiobookShelfServerCopyWithImpl;
@useResult
$Res call({
 AudiobookShelfUri serverUrl
});




}
/// @nodoc
class _$AudiobookShelfServerCopyWithImpl<$Res>
    implements $AudiobookShelfServerCopyWith<$Res> {
  _$AudiobookShelfServerCopyWithImpl(this._self, this._then);

  final AudiobookShelfServer _self;
  final $Res Function(AudiobookShelfServer) _then;

/// Create a copy of AudiobookShelfServer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverUrl = null,}) {
  return _then(_self.copyWith(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as AudiobookShelfUri,
  ));
}

}


/// Adds pattern-matching-related methods to [AudiobookShelfServer].
extension AudiobookShelfServerPatterns on AudiobookShelfServer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudiobookShelfServer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudiobookShelfServer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudiobookShelfServer value)  $default,){
final _that = this;
switch (_that) {
case _AudiobookShelfServer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudiobookShelfServer value)?  $default,){
final _that = this;
switch (_that) {
case _AudiobookShelfServer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AudiobookShelfUri serverUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudiobookShelfServer() when $default != null:
return $default(_that.serverUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AudiobookShelfUri serverUrl)  $default,) {final _that = this;
switch (_that) {
case _AudiobookShelfServer():
return $default(_that.serverUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AudiobookShelfUri serverUrl)?  $default,) {final _that = this;
switch (_that) {
case _AudiobookShelfServer() when $default != null:
return $default(_that.serverUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudiobookShelfServer implements AudiobookShelfServer {
  const _AudiobookShelfServer({required this.serverUrl});
  factory _AudiobookShelfServer.fromJson(Map<String, dynamic> json) => _$AudiobookShelfServerFromJson(json);

@override final  AudiobookShelfUri serverUrl;

/// Create a copy of AudiobookShelfServer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudiobookShelfServerCopyWith<_AudiobookShelfServer> get copyWith => __$AudiobookShelfServerCopyWithImpl<_AudiobookShelfServer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudiobookShelfServerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudiobookShelfServer&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverUrl);

@override
String toString() {
  return 'AudiobookShelfServer(serverUrl: $serverUrl)';
}


}

/// @nodoc
abstract mixin class _$AudiobookShelfServerCopyWith<$Res> implements $AudiobookShelfServerCopyWith<$Res> {
  factory _$AudiobookShelfServerCopyWith(_AudiobookShelfServer value, $Res Function(_AudiobookShelfServer) _then) = __$AudiobookShelfServerCopyWithImpl;
@override @useResult
$Res call({
 AudiobookShelfUri serverUrl
});




}
/// @nodoc
class __$AudiobookShelfServerCopyWithImpl<$Res>
    implements _$AudiobookShelfServerCopyWith<$Res> {
  __$AudiobookShelfServerCopyWithImpl(this._self, this._then);

  final _AudiobookShelfServer _self;
  final $Res Function(_AudiobookShelfServer) _then;

/// Create a copy of AudiobookShelfServer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverUrl = null,}) {
  return _then(_AudiobookShelfServer(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as AudiobookShelfUri,
  ));
}


}

// dart format on
