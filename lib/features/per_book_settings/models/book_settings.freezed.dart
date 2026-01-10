// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookSettings {

 String get bookId; NullablePlayerSettings get playerSettings;
/// Create a copy of BookSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookSettingsCopyWith<BookSettings> get copyWith => _$BookSettingsCopyWithImpl<BookSettings>(this as BookSettings, _$identity);

  /// Serializes this BookSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookSettings&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.playerSettings, playerSettings) || other.playerSettings == playerSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookId,playerSettings);

@override
String toString() {
  return 'BookSettings(bookId: $bookId, playerSettings: $playerSettings)';
}


}

/// @nodoc
abstract mixin class $BookSettingsCopyWith<$Res>  {
  factory $BookSettingsCopyWith(BookSettings value, $Res Function(BookSettings) _then) = _$BookSettingsCopyWithImpl;
@useResult
$Res call({
 String bookId, NullablePlayerSettings playerSettings
});


$NullablePlayerSettingsCopyWith<$Res> get playerSettings;

}
/// @nodoc
class _$BookSettingsCopyWithImpl<$Res>
    implements $BookSettingsCopyWith<$Res> {
  _$BookSettingsCopyWithImpl(this._self, this._then);

  final BookSettings _self;
  final $Res Function(BookSettings) _then;

/// Create a copy of BookSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookId = null,Object? playerSettings = null,}) {
  return _then(_self.copyWith(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,playerSettings: null == playerSettings ? _self.playerSettings : playerSettings // ignore: cast_nullable_to_non_nullable
as NullablePlayerSettings,
  ));
}
/// Create a copy of BookSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NullablePlayerSettingsCopyWith<$Res> get playerSettings {
  
  return $NullablePlayerSettingsCopyWith<$Res>(_self.playerSettings, (value) {
    return _then(_self.copyWith(playerSettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookSettings].
extension BookSettingsPatterns on BookSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookSettings value)  $default,){
final _that = this;
switch (_that) {
case _BookSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookSettings value)?  $default,){
final _that = this;
switch (_that) {
case _BookSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bookId,  NullablePlayerSettings playerSettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookSettings() when $default != null:
return $default(_that.bookId,_that.playerSettings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bookId,  NullablePlayerSettings playerSettings)  $default,) {final _that = this;
switch (_that) {
case _BookSettings():
return $default(_that.bookId,_that.playerSettings);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bookId,  NullablePlayerSettings playerSettings)?  $default,) {final _that = this;
switch (_that) {
case _BookSettings() when $default != null:
return $default(_that.bookId,_that.playerSettings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookSettings implements BookSettings {
  const _BookSettings({required this.bookId, this.playerSettings = const NullablePlayerSettings()});
  factory _BookSettings.fromJson(Map<String, dynamic> json) => _$BookSettingsFromJson(json);

@override final  String bookId;
@override@JsonKey() final  NullablePlayerSettings playerSettings;

/// Create a copy of BookSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookSettingsCopyWith<_BookSettings> get copyWith => __$BookSettingsCopyWithImpl<_BookSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookSettings&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.playerSettings, playerSettings) || other.playerSettings == playerSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookId,playerSettings);

@override
String toString() {
  return 'BookSettings(bookId: $bookId, playerSettings: $playerSettings)';
}


}

/// @nodoc
abstract mixin class _$BookSettingsCopyWith<$Res> implements $BookSettingsCopyWith<$Res> {
  factory _$BookSettingsCopyWith(_BookSettings value, $Res Function(_BookSettings) _then) = __$BookSettingsCopyWithImpl;
@override @useResult
$Res call({
 String bookId, NullablePlayerSettings playerSettings
});


@override $NullablePlayerSettingsCopyWith<$Res> get playerSettings;

}
/// @nodoc
class __$BookSettingsCopyWithImpl<$Res>
    implements _$BookSettingsCopyWith<$Res> {
  __$BookSettingsCopyWithImpl(this._self, this._then);

  final _BookSettings _self;
  final $Res Function(_BookSettings) _then;

/// Create a copy of BookSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookId = null,Object? playerSettings = null,}) {
  return _then(_BookSettings(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,playerSettings: null == playerSettings ? _self.playerSettings : playerSettings // ignore: cast_nullable_to_non_nullable
as NullablePlayerSettings,
  ));
}

/// Create a copy of BookSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NullablePlayerSettingsCopyWith<$Res> get playerSettings {
  
  return $NullablePlayerSettingsCopyWith<$Res>(_self.playerSettings, (value) {
    return _then(_self.copyWith(playerSettings: value));
  });
}
}

// dart format on
