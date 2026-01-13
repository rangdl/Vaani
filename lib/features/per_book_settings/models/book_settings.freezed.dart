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

 String get bookId; NullablePlayerSettings get playerSettings; BookProgress? get progress;
/// Create a copy of BookSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookSettingsCopyWith<BookSettings> get copyWith => _$BookSettingsCopyWithImpl<BookSettings>(this as BookSettings, _$identity);

  /// Serializes this BookSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookSettings&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.playerSettings, playerSettings) || other.playerSettings == playerSettings)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookId,playerSettings,progress);

@override
String toString() {
  return 'BookSettings(bookId: $bookId, playerSettings: $playerSettings, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $BookSettingsCopyWith<$Res>  {
  factory $BookSettingsCopyWith(BookSettings value, $Res Function(BookSettings) _then) = _$BookSettingsCopyWithImpl;
@useResult
$Res call({
 String bookId, NullablePlayerSettings playerSettings, BookProgress? progress
});


$NullablePlayerSettingsCopyWith<$Res> get playerSettings;$BookProgressCopyWith<$Res>? get progress;

}
/// @nodoc
class _$BookSettingsCopyWithImpl<$Res>
    implements $BookSettingsCopyWith<$Res> {
  _$BookSettingsCopyWithImpl(this._self, this._then);

  final BookSettings _self;
  final $Res Function(BookSettings) _then;

/// Create a copy of BookSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookId = null,Object? playerSettings = null,Object? progress = freezed,}) {
  return _then(_self.copyWith(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,playerSettings: null == playerSettings ? _self.playerSettings : playerSettings // ignore: cast_nullable_to_non_nullable
as NullablePlayerSettings,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as BookProgress?,
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
}/// Create a copy of BookSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookProgressCopyWith<$Res>? get progress {
    if (_self.progress == null) {
    return null;
  }

  return $BookProgressCopyWith<$Res>(_self.progress!, (value) {
    return _then(_self.copyWith(progress: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bookId,  NullablePlayerSettings playerSettings,  BookProgress? progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookSettings() when $default != null:
return $default(_that.bookId,_that.playerSettings,_that.progress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bookId,  NullablePlayerSettings playerSettings,  BookProgress? progress)  $default,) {final _that = this;
switch (_that) {
case _BookSettings():
return $default(_that.bookId,_that.playerSettings,_that.progress);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bookId,  NullablePlayerSettings playerSettings,  BookProgress? progress)?  $default,) {final _that = this;
switch (_that) {
case _BookSettings() when $default != null:
return $default(_that.bookId,_that.playerSettings,_that.progress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookSettings implements BookSettings {
  const _BookSettings({required this.bookId, this.playerSettings = const NullablePlayerSettings(), this.progress});
  factory _BookSettings.fromJson(Map<String, dynamic> json) => _$BookSettingsFromJson(json);

@override final  String bookId;
@override@JsonKey() final  NullablePlayerSettings playerSettings;
@override final  BookProgress? progress;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookSettings&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.playerSettings, playerSettings) || other.playerSettings == playerSettings)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookId,playerSettings,progress);

@override
String toString() {
  return 'BookSettings(bookId: $bookId, playerSettings: $playerSettings, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$BookSettingsCopyWith<$Res> implements $BookSettingsCopyWith<$Res> {
  factory _$BookSettingsCopyWith(_BookSettings value, $Res Function(_BookSettings) _then) = __$BookSettingsCopyWithImpl;
@override @useResult
$Res call({
 String bookId, NullablePlayerSettings playerSettings, BookProgress? progress
});


@override $NullablePlayerSettingsCopyWith<$Res> get playerSettings;@override $BookProgressCopyWith<$Res>? get progress;

}
/// @nodoc
class __$BookSettingsCopyWithImpl<$Res>
    implements _$BookSettingsCopyWith<$Res> {
  __$BookSettingsCopyWithImpl(this._self, this._then);

  final _BookSettings _self;
  final $Res Function(_BookSettings) _then;

/// Create a copy of BookSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookId = null,Object? playerSettings = null,Object? progress = freezed,}) {
  return _then(_BookSettings(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,playerSettings: null == playerSettings ? _self.playerSettings : playerSettings // ignore: cast_nullable_to_non_nullable
as NullablePlayerSettings,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as BookProgress?,
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
}/// Create a copy of BookSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookProgressCopyWith<$Res>? get progress {
    if (_self.progress == null) {
    return null;
  }

  return $BookProgressCopyWith<$Res>(_self.progress!, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}


/// @nodoc
mixin _$BookProgress {

 DateTime get lastUpdate; Duration get currentTime;
/// Create a copy of BookProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookProgressCopyWith<BookProgress> get copyWith => _$BookProgressCopyWithImpl<BookProgress>(this as BookProgress, _$identity);

  /// Serializes this BookProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookProgress&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastUpdate,currentTime);

@override
String toString() {
  return 'BookProgress(lastUpdate: $lastUpdate, currentTime: $currentTime)';
}


}

/// @nodoc
abstract mixin class $BookProgressCopyWith<$Res>  {
  factory $BookProgressCopyWith(BookProgress value, $Res Function(BookProgress) _then) = _$BookProgressCopyWithImpl;
@useResult
$Res call({
 DateTime lastUpdate, Duration currentTime
});




}
/// @nodoc
class _$BookProgressCopyWithImpl<$Res>
    implements $BookProgressCopyWith<$Res> {
  _$BookProgressCopyWithImpl(this._self, this._then);

  final BookProgress _self;
  final $Res Function(BookProgress) _then;

/// Create a copy of BookProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastUpdate = null,Object? currentTime = null,}) {
  return _then(_self.copyWith(
lastUpdate: null == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime,currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [BookProgress].
extension BookProgressPatterns on BookProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookProgress value)  $default,){
final _that = this;
switch (_that) {
case _BookProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookProgress value)?  $default,){
final _that = this;
switch (_that) {
case _BookProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime lastUpdate,  Duration currentTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookProgress() when $default != null:
return $default(_that.lastUpdate,_that.currentTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime lastUpdate,  Duration currentTime)  $default,) {final _that = this;
switch (_that) {
case _BookProgress():
return $default(_that.lastUpdate,_that.currentTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime lastUpdate,  Duration currentTime)?  $default,) {final _that = this;
switch (_that) {
case _BookProgress() when $default != null:
return $default(_that.lastUpdate,_that.currentTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookProgress implements BookProgress {
  const _BookProgress({required this.lastUpdate, this.currentTime = Duration.zero});
  factory _BookProgress.fromJson(Map<String, dynamic> json) => _$BookProgressFromJson(json);

@override final  DateTime lastUpdate;
@override@JsonKey() final  Duration currentTime;

/// Create a copy of BookProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookProgressCopyWith<_BookProgress> get copyWith => __$BookProgressCopyWithImpl<_BookProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookProgress&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastUpdate,currentTime);

@override
String toString() {
  return 'BookProgress(lastUpdate: $lastUpdate, currentTime: $currentTime)';
}


}

/// @nodoc
abstract mixin class _$BookProgressCopyWith<$Res> implements $BookProgressCopyWith<$Res> {
  factory _$BookProgressCopyWith(_BookProgress value, $Res Function(_BookProgress) _then) = __$BookProgressCopyWithImpl;
@override @useResult
$Res call({
 DateTime lastUpdate, Duration currentTime
});




}
/// @nodoc
class __$BookProgressCopyWithImpl<$Res>
    implements _$BookProgressCopyWith<$Res> {
  __$BookProgressCopyWithImpl(this._self, this._then);

  final _BookProgress _self;
  final $Res Function(_BookProgress) _then;

/// Create a copy of BookProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastUpdate = null,Object? currentTime = null,}) {
  return _then(_BookProgress(
lastUpdate: null == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime,currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
