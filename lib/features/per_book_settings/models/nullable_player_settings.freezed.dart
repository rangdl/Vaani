// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nullable_player_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NullablePlayerSettings {

 MinimizedPlayerSettings? get miniPlayerSettings; ExpandedPlayerSettings? get expandedPlayerSettings; double? get preferredDefaultVolume; double? get preferredDefaultSpeed; List<double>? get speedOptions; SleepTimerSettings? get sleepTimerSettings; Duration? get playbackReportInterval;
/// Create a copy of NullablePlayerSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NullablePlayerSettingsCopyWith<NullablePlayerSettings> get copyWith => _$NullablePlayerSettingsCopyWithImpl<NullablePlayerSettings>(this as NullablePlayerSettings, _$identity);

  /// Serializes this NullablePlayerSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NullablePlayerSettings&&(identical(other.miniPlayerSettings, miniPlayerSettings) || other.miniPlayerSettings == miniPlayerSettings)&&(identical(other.expandedPlayerSettings, expandedPlayerSettings) || other.expandedPlayerSettings == expandedPlayerSettings)&&(identical(other.preferredDefaultVolume, preferredDefaultVolume) || other.preferredDefaultVolume == preferredDefaultVolume)&&(identical(other.preferredDefaultSpeed, preferredDefaultSpeed) || other.preferredDefaultSpeed == preferredDefaultSpeed)&&const DeepCollectionEquality().equals(other.speedOptions, speedOptions)&&(identical(other.sleepTimerSettings, sleepTimerSettings) || other.sleepTimerSettings == sleepTimerSettings)&&(identical(other.playbackReportInterval, playbackReportInterval) || other.playbackReportInterval == playbackReportInterval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,miniPlayerSettings,expandedPlayerSettings,preferredDefaultVolume,preferredDefaultSpeed,const DeepCollectionEquality().hash(speedOptions),sleepTimerSettings,playbackReportInterval);

@override
String toString() {
  return 'NullablePlayerSettings(miniPlayerSettings: $miniPlayerSettings, expandedPlayerSettings: $expandedPlayerSettings, preferredDefaultVolume: $preferredDefaultVolume, preferredDefaultSpeed: $preferredDefaultSpeed, speedOptions: $speedOptions, sleepTimerSettings: $sleepTimerSettings, playbackReportInterval: $playbackReportInterval)';
}


}

/// @nodoc
abstract mixin class $NullablePlayerSettingsCopyWith<$Res>  {
  factory $NullablePlayerSettingsCopyWith(NullablePlayerSettings value, $Res Function(NullablePlayerSettings) _then) = _$NullablePlayerSettingsCopyWithImpl;
@useResult
$Res call({
 MinimizedPlayerSettings? miniPlayerSettings, ExpandedPlayerSettings? expandedPlayerSettings, double? preferredDefaultVolume, double? preferredDefaultSpeed, List<double>? speedOptions, SleepTimerSettings? sleepTimerSettings, Duration? playbackReportInterval
});


$MinimizedPlayerSettingsCopyWith<$Res>? get miniPlayerSettings;$ExpandedPlayerSettingsCopyWith<$Res>? get expandedPlayerSettings;$SleepTimerSettingsCopyWith<$Res>? get sleepTimerSettings;

}
/// @nodoc
class _$NullablePlayerSettingsCopyWithImpl<$Res>
    implements $NullablePlayerSettingsCopyWith<$Res> {
  _$NullablePlayerSettingsCopyWithImpl(this._self, this._then);

  final NullablePlayerSettings _self;
  final $Res Function(NullablePlayerSettings) _then;

/// Create a copy of NullablePlayerSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? miniPlayerSettings = freezed,Object? expandedPlayerSettings = freezed,Object? preferredDefaultVolume = freezed,Object? preferredDefaultSpeed = freezed,Object? speedOptions = freezed,Object? sleepTimerSettings = freezed,Object? playbackReportInterval = freezed,}) {
  return _then(_self.copyWith(
miniPlayerSettings: freezed == miniPlayerSettings ? _self.miniPlayerSettings : miniPlayerSettings // ignore: cast_nullable_to_non_nullable
as MinimizedPlayerSettings?,expandedPlayerSettings: freezed == expandedPlayerSettings ? _self.expandedPlayerSettings : expandedPlayerSettings // ignore: cast_nullable_to_non_nullable
as ExpandedPlayerSettings?,preferredDefaultVolume: freezed == preferredDefaultVolume ? _self.preferredDefaultVolume : preferredDefaultVolume // ignore: cast_nullable_to_non_nullable
as double?,preferredDefaultSpeed: freezed == preferredDefaultSpeed ? _self.preferredDefaultSpeed : preferredDefaultSpeed // ignore: cast_nullable_to_non_nullable
as double?,speedOptions: freezed == speedOptions ? _self.speedOptions : speedOptions // ignore: cast_nullable_to_non_nullable
as List<double>?,sleepTimerSettings: freezed == sleepTimerSettings ? _self.sleepTimerSettings : sleepTimerSettings // ignore: cast_nullable_to_non_nullable
as SleepTimerSettings?,playbackReportInterval: freezed == playbackReportInterval ? _self.playbackReportInterval : playbackReportInterval // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}
/// Create a copy of NullablePlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MinimizedPlayerSettingsCopyWith<$Res>? get miniPlayerSettings {
    if (_self.miniPlayerSettings == null) {
    return null;
  }

  return $MinimizedPlayerSettingsCopyWith<$Res>(_self.miniPlayerSettings!, (value) {
    return _then(_self.copyWith(miniPlayerSettings: value));
  });
}/// Create a copy of NullablePlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpandedPlayerSettingsCopyWith<$Res>? get expandedPlayerSettings {
    if (_self.expandedPlayerSettings == null) {
    return null;
  }

  return $ExpandedPlayerSettingsCopyWith<$Res>(_self.expandedPlayerSettings!, (value) {
    return _then(_self.copyWith(expandedPlayerSettings: value));
  });
}/// Create a copy of NullablePlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SleepTimerSettingsCopyWith<$Res>? get sleepTimerSettings {
    if (_self.sleepTimerSettings == null) {
    return null;
  }

  return $SleepTimerSettingsCopyWith<$Res>(_self.sleepTimerSettings!, (value) {
    return _then(_self.copyWith(sleepTimerSettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [NullablePlayerSettings].
extension NullablePlayerSettingsPatterns on NullablePlayerSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NullablePlayerSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NullablePlayerSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NullablePlayerSettings value)  $default,){
final _that = this;
switch (_that) {
case _NullablePlayerSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NullablePlayerSettings value)?  $default,){
final _that = this;
switch (_that) {
case _NullablePlayerSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MinimizedPlayerSettings? miniPlayerSettings,  ExpandedPlayerSettings? expandedPlayerSettings,  double? preferredDefaultVolume,  double? preferredDefaultSpeed,  List<double>? speedOptions,  SleepTimerSettings? sleepTimerSettings,  Duration? playbackReportInterval)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NullablePlayerSettings() when $default != null:
return $default(_that.miniPlayerSettings,_that.expandedPlayerSettings,_that.preferredDefaultVolume,_that.preferredDefaultSpeed,_that.speedOptions,_that.sleepTimerSettings,_that.playbackReportInterval);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MinimizedPlayerSettings? miniPlayerSettings,  ExpandedPlayerSettings? expandedPlayerSettings,  double? preferredDefaultVolume,  double? preferredDefaultSpeed,  List<double>? speedOptions,  SleepTimerSettings? sleepTimerSettings,  Duration? playbackReportInterval)  $default,) {final _that = this;
switch (_that) {
case _NullablePlayerSettings():
return $default(_that.miniPlayerSettings,_that.expandedPlayerSettings,_that.preferredDefaultVolume,_that.preferredDefaultSpeed,_that.speedOptions,_that.sleepTimerSettings,_that.playbackReportInterval);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MinimizedPlayerSettings? miniPlayerSettings,  ExpandedPlayerSettings? expandedPlayerSettings,  double? preferredDefaultVolume,  double? preferredDefaultSpeed,  List<double>? speedOptions,  SleepTimerSettings? sleepTimerSettings,  Duration? playbackReportInterval)?  $default,) {final _that = this;
switch (_that) {
case _NullablePlayerSettings() when $default != null:
return $default(_that.miniPlayerSettings,_that.expandedPlayerSettings,_that.preferredDefaultVolume,_that.preferredDefaultSpeed,_that.speedOptions,_that.sleepTimerSettings,_that.playbackReportInterval);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NullablePlayerSettings implements NullablePlayerSettings {
  const _NullablePlayerSettings({this.miniPlayerSettings, this.expandedPlayerSettings, this.preferredDefaultVolume, this.preferredDefaultSpeed, final  List<double>? speedOptions, this.sleepTimerSettings, this.playbackReportInterval}): _speedOptions = speedOptions;
  factory _NullablePlayerSettings.fromJson(Map<String, dynamic> json) => _$NullablePlayerSettingsFromJson(json);

@override final  MinimizedPlayerSettings? miniPlayerSettings;
@override final  ExpandedPlayerSettings? expandedPlayerSettings;
@override final  double? preferredDefaultVolume;
@override final  double? preferredDefaultSpeed;
 final  List<double>? _speedOptions;
@override List<double>? get speedOptions {
  final value = _speedOptions;
  if (value == null) return null;
  if (_speedOptions is EqualUnmodifiableListView) return _speedOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  SleepTimerSettings? sleepTimerSettings;
@override final  Duration? playbackReportInterval;

/// Create a copy of NullablePlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NullablePlayerSettingsCopyWith<_NullablePlayerSettings> get copyWith => __$NullablePlayerSettingsCopyWithImpl<_NullablePlayerSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NullablePlayerSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NullablePlayerSettings&&(identical(other.miniPlayerSettings, miniPlayerSettings) || other.miniPlayerSettings == miniPlayerSettings)&&(identical(other.expandedPlayerSettings, expandedPlayerSettings) || other.expandedPlayerSettings == expandedPlayerSettings)&&(identical(other.preferredDefaultVolume, preferredDefaultVolume) || other.preferredDefaultVolume == preferredDefaultVolume)&&(identical(other.preferredDefaultSpeed, preferredDefaultSpeed) || other.preferredDefaultSpeed == preferredDefaultSpeed)&&const DeepCollectionEquality().equals(other._speedOptions, _speedOptions)&&(identical(other.sleepTimerSettings, sleepTimerSettings) || other.sleepTimerSettings == sleepTimerSettings)&&(identical(other.playbackReportInterval, playbackReportInterval) || other.playbackReportInterval == playbackReportInterval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,miniPlayerSettings,expandedPlayerSettings,preferredDefaultVolume,preferredDefaultSpeed,const DeepCollectionEquality().hash(_speedOptions),sleepTimerSettings,playbackReportInterval);

@override
String toString() {
  return 'NullablePlayerSettings(miniPlayerSettings: $miniPlayerSettings, expandedPlayerSettings: $expandedPlayerSettings, preferredDefaultVolume: $preferredDefaultVolume, preferredDefaultSpeed: $preferredDefaultSpeed, speedOptions: $speedOptions, sleepTimerSettings: $sleepTimerSettings, playbackReportInterval: $playbackReportInterval)';
}


}

/// @nodoc
abstract mixin class _$NullablePlayerSettingsCopyWith<$Res> implements $NullablePlayerSettingsCopyWith<$Res> {
  factory _$NullablePlayerSettingsCopyWith(_NullablePlayerSettings value, $Res Function(_NullablePlayerSettings) _then) = __$NullablePlayerSettingsCopyWithImpl;
@override @useResult
$Res call({
 MinimizedPlayerSettings? miniPlayerSettings, ExpandedPlayerSettings? expandedPlayerSettings, double? preferredDefaultVolume, double? preferredDefaultSpeed, List<double>? speedOptions, SleepTimerSettings? sleepTimerSettings, Duration? playbackReportInterval
});


@override $MinimizedPlayerSettingsCopyWith<$Res>? get miniPlayerSettings;@override $ExpandedPlayerSettingsCopyWith<$Res>? get expandedPlayerSettings;@override $SleepTimerSettingsCopyWith<$Res>? get sleepTimerSettings;

}
/// @nodoc
class __$NullablePlayerSettingsCopyWithImpl<$Res>
    implements _$NullablePlayerSettingsCopyWith<$Res> {
  __$NullablePlayerSettingsCopyWithImpl(this._self, this._then);

  final _NullablePlayerSettings _self;
  final $Res Function(_NullablePlayerSettings) _then;

/// Create a copy of NullablePlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? miniPlayerSettings = freezed,Object? expandedPlayerSettings = freezed,Object? preferredDefaultVolume = freezed,Object? preferredDefaultSpeed = freezed,Object? speedOptions = freezed,Object? sleepTimerSettings = freezed,Object? playbackReportInterval = freezed,}) {
  return _then(_NullablePlayerSettings(
miniPlayerSettings: freezed == miniPlayerSettings ? _self.miniPlayerSettings : miniPlayerSettings // ignore: cast_nullable_to_non_nullable
as MinimizedPlayerSettings?,expandedPlayerSettings: freezed == expandedPlayerSettings ? _self.expandedPlayerSettings : expandedPlayerSettings // ignore: cast_nullable_to_non_nullable
as ExpandedPlayerSettings?,preferredDefaultVolume: freezed == preferredDefaultVolume ? _self.preferredDefaultVolume : preferredDefaultVolume // ignore: cast_nullable_to_non_nullable
as double?,preferredDefaultSpeed: freezed == preferredDefaultSpeed ? _self.preferredDefaultSpeed : preferredDefaultSpeed // ignore: cast_nullable_to_non_nullable
as double?,speedOptions: freezed == speedOptions ? _self._speedOptions : speedOptions // ignore: cast_nullable_to_non_nullable
as List<double>?,sleepTimerSettings: freezed == sleepTimerSettings ? _self.sleepTimerSettings : sleepTimerSettings // ignore: cast_nullable_to_non_nullable
as SleepTimerSettings?,playbackReportInterval: freezed == playbackReportInterval ? _self.playbackReportInterval : playbackReportInterval // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}

/// Create a copy of NullablePlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MinimizedPlayerSettingsCopyWith<$Res>? get miniPlayerSettings {
    if (_self.miniPlayerSettings == null) {
    return null;
  }

  return $MinimizedPlayerSettingsCopyWith<$Res>(_self.miniPlayerSettings!, (value) {
    return _then(_self.copyWith(miniPlayerSettings: value));
  });
}/// Create a copy of NullablePlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpandedPlayerSettingsCopyWith<$Res>? get expandedPlayerSettings {
    if (_self.expandedPlayerSettings == null) {
    return null;
  }

  return $ExpandedPlayerSettingsCopyWith<$Res>(_self.expandedPlayerSettings!, (value) {
    return _then(_self.copyWith(expandedPlayerSettings: value));
  });
}/// Create a copy of NullablePlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SleepTimerSettingsCopyWith<$Res>? get sleepTimerSettings {
    if (_self.sleepTimerSettings == null) {
    return null;
  }

  return $SleepTimerSettingsCopyWith<$Res>(_self.sleepTimerSettings!, (value) {
    return _then(_self.copyWith(sleepTimerSettings: value));
  });
}
}

// dart format on
