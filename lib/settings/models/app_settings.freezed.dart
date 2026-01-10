// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {

 ThemeSettings get themeSettings; PlayerSettings get playerSettings; SleepTimerSettings get sleepTimerSettings; DownloadSettings get downloadSettings; NotificationSettings get notificationSettings; ShakeDetectionSettings get shakeDetectionSettings; HomePageSettings get homePageSettings;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.themeSettings, themeSettings) || other.themeSettings == themeSettings)&&(identical(other.playerSettings, playerSettings) || other.playerSettings == playerSettings)&&(identical(other.sleepTimerSettings, sleepTimerSettings) || other.sleepTimerSettings == sleepTimerSettings)&&(identical(other.downloadSettings, downloadSettings) || other.downloadSettings == downloadSettings)&&(identical(other.notificationSettings, notificationSettings) || other.notificationSettings == notificationSettings)&&(identical(other.shakeDetectionSettings, shakeDetectionSettings) || other.shakeDetectionSettings == shakeDetectionSettings)&&(identical(other.homePageSettings, homePageSettings) || other.homePageSettings == homePageSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeSettings,playerSettings,sleepTimerSettings,downloadSettings,notificationSettings,shakeDetectionSettings,homePageSettings);

@override
String toString() {
  return 'AppSettings(themeSettings: $themeSettings, playerSettings: $playerSettings, sleepTimerSettings: $sleepTimerSettings, downloadSettings: $downloadSettings, notificationSettings: $notificationSettings, shakeDetectionSettings: $shakeDetectionSettings, homePageSettings: $homePageSettings)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 ThemeSettings themeSettings, PlayerSettings playerSettings, SleepTimerSettings sleepTimerSettings, DownloadSettings downloadSettings, NotificationSettings notificationSettings, ShakeDetectionSettings shakeDetectionSettings, HomePageSettings homePageSettings
});


$ThemeSettingsCopyWith<$Res> get themeSettings;$PlayerSettingsCopyWith<$Res> get playerSettings;$SleepTimerSettingsCopyWith<$Res> get sleepTimerSettings;$DownloadSettingsCopyWith<$Res> get downloadSettings;$NotificationSettingsCopyWith<$Res> get notificationSettings;$ShakeDetectionSettingsCopyWith<$Res> get shakeDetectionSettings;$HomePageSettingsCopyWith<$Res> get homePageSettings;

}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeSettings = null,Object? playerSettings = null,Object? sleepTimerSettings = null,Object? downloadSettings = null,Object? notificationSettings = null,Object? shakeDetectionSettings = null,Object? homePageSettings = null,}) {
  return _then(_self.copyWith(
themeSettings: null == themeSettings ? _self.themeSettings : themeSettings // ignore: cast_nullable_to_non_nullable
as ThemeSettings,playerSettings: null == playerSettings ? _self.playerSettings : playerSettings // ignore: cast_nullable_to_non_nullable
as PlayerSettings,sleepTimerSettings: null == sleepTimerSettings ? _self.sleepTimerSettings : sleepTimerSettings // ignore: cast_nullable_to_non_nullable
as SleepTimerSettings,downloadSettings: null == downloadSettings ? _self.downloadSettings : downloadSettings // ignore: cast_nullable_to_non_nullable
as DownloadSettings,notificationSettings: null == notificationSettings ? _self.notificationSettings : notificationSettings // ignore: cast_nullable_to_non_nullable
as NotificationSettings,shakeDetectionSettings: null == shakeDetectionSettings ? _self.shakeDetectionSettings : shakeDetectionSettings // ignore: cast_nullable_to_non_nullable
as ShakeDetectionSettings,homePageSettings: null == homePageSettings ? _self.homePageSettings : homePageSettings // ignore: cast_nullable_to_non_nullable
as HomePageSettings,
  ));
}
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemeSettingsCopyWith<$Res> get themeSettings {
  
  return $ThemeSettingsCopyWith<$Res>(_self.themeSettings, (value) {
    return _then(_self.copyWith(themeSettings: value));
  });
}/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSettingsCopyWith<$Res> get playerSettings {
  
  return $PlayerSettingsCopyWith<$Res>(_self.playerSettings, (value) {
    return _then(_self.copyWith(playerSettings: value));
  });
}/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SleepTimerSettingsCopyWith<$Res> get sleepTimerSettings {
  
  return $SleepTimerSettingsCopyWith<$Res>(_self.sleepTimerSettings, (value) {
    return _then(_self.copyWith(sleepTimerSettings: value));
  });
}/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DownloadSettingsCopyWith<$Res> get downloadSettings {
  
  return $DownloadSettingsCopyWith<$Res>(_self.downloadSettings, (value) {
    return _then(_self.copyWith(downloadSettings: value));
  });
}/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationSettingsCopyWith<$Res> get notificationSettings {
  
  return $NotificationSettingsCopyWith<$Res>(_self.notificationSettings, (value) {
    return _then(_self.copyWith(notificationSettings: value));
  });
}/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShakeDetectionSettingsCopyWith<$Res> get shakeDetectionSettings {
  
  return $ShakeDetectionSettingsCopyWith<$Res>(_self.shakeDetectionSettings, (value) {
    return _then(_self.copyWith(shakeDetectionSettings: value));
  });
}/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomePageSettingsCopyWith<$Res> get homePageSettings {
  
  return $HomePageSettingsCopyWith<$Res>(_self.homePageSettings, (value) {
    return _then(_self.copyWith(homePageSettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeSettings themeSettings,  PlayerSettings playerSettings,  SleepTimerSettings sleepTimerSettings,  DownloadSettings downloadSettings,  NotificationSettings notificationSettings,  ShakeDetectionSettings shakeDetectionSettings,  HomePageSettings homePageSettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.themeSettings,_that.playerSettings,_that.sleepTimerSettings,_that.downloadSettings,_that.notificationSettings,_that.shakeDetectionSettings,_that.homePageSettings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeSettings themeSettings,  PlayerSettings playerSettings,  SleepTimerSettings sleepTimerSettings,  DownloadSettings downloadSettings,  NotificationSettings notificationSettings,  ShakeDetectionSettings shakeDetectionSettings,  HomePageSettings homePageSettings)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.themeSettings,_that.playerSettings,_that.sleepTimerSettings,_that.downloadSettings,_that.notificationSettings,_that.shakeDetectionSettings,_that.homePageSettings);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeSettings themeSettings,  PlayerSettings playerSettings,  SleepTimerSettings sleepTimerSettings,  DownloadSettings downloadSettings,  NotificationSettings notificationSettings,  ShakeDetectionSettings shakeDetectionSettings,  HomePageSettings homePageSettings)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.themeSettings,_that.playerSettings,_that.sleepTimerSettings,_that.downloadSettings,_that.notificationSettings,_that.shakeDetectionSettings,_that.homePageSettings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings implements AppSettings {
  const _AppSettings({this.themeSettings = const ThemeSettings(), this.playerSettings = const PlayerSettings(), this.sleepTimerSettings = const SleepTimerSettings(), this.downloadSettings = const DownloadSettings(), this.notificationSettings = const NotificationSettings(), this.shakeDetectionSettings = const ShakeDetectionSettings(), this.homePageSettings = const HomePageSettings()});
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

@override@JsonKey() final  ThemeSettings themeSettings;
@override@JsonKey() final  PlayerSettings playerSettings;
@override@JsonKey() final  SleepTimerSettings sleepTimerSettings;
@override@JsonKey() final  DownloadSettings downloadSettings;
@override@JsonKey() final  NotificationSettings notificationSettings;
@override@JsonKey() final  ShakeDetectionSettings shakeDetectionSettings;
@override@JsonKey() final  HomePageSettings homePageSettings;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.themeSettings, themeSettings) || other.themeSettings == themeSettings)&&(identical(other.playerSettings, playerSettings) || other.playerSettings == playerSettings)&&(identical(other.sleepTimerSettings, sleepTimerSettings) || other.sleepTimerSettings == sleepTimerSettings)&&(identical(other.downloadSettings, downloadSettings) || other.downloadSettings == downloadSettings)&&(identical(other.notificationSettings, notificationSettings) || other.notificationSettings == notificationSettings)&&(identical(other.shakeDetectionSettings, shakeDetectionSettings) || other.shakeDetectionSettings == shakeDetectionSettings)&&(identical(other.homePageSettings, homePageSettings) || other.homePageSettings == homePageSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeSettings,playerSettings,sleepTimerSettings,downloadSettings,notificationSettings,shakeDetectionSettings,homePageSettings);

@override
String toString() {
  return 'AppSettings(themeSettings: $themeSettings, playerSettings: $playerSettings, sleepTimerSettings: $sleepTimerSettings, downloadSettings: $downloadSettings, notificationSettings: $notificationSettings, shakeDetectionSettings: $shakeDetectionSettings, homePageSettings: $homePageSettings)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 ThemeSettings themeSettings, PlayerSettings playerSettings, SleepTimerSettings sleepTimerSettings, DownloadSettings downloadSettings, NotificationSettings notificationSettings, ShakeDetectionSettings shakeDetectionSettings, HomePageSettings homePageSettings
});


@override $ThemeSettingsCopyWith<$Res> get themeSettings;@override $PlayerSettingsCopyWith<$Res> get playerSettings;@override $SleepTimerSettingsCopyWith<$Res> get sleepTimerSettings;@override $DownloadSettingsCopyWith<$Res> get downloadSettings;@override $NotificationSettingsCopyWith<$Res> get notificationSettings;@override $ShakeDetectionSettingsCopyWith<$Res> get shakeDetectionSettings;@override $HomePageSettingsCopyWith<$Res> get homePageSettings;

}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeSettings = null,Object? playerSettings = null,Object? sleepTimerSettings = null,Object? downloadSettings = null,Object? notificationSettings = null,Object? shakeDetectionSettings = null,Object? homePageSettings = null,}) {
  return _then(_AppSettings(
themeSettings: null == themeSettings ? _self.themeSettings : themeSettings // ignore: cast_nullable_to_non_nullable
as ThemeSettings,playerSettings: null == playerSettings ? _self.playerSettings : playerSettings // ignore: cast_nullable_to_non_nullable
as PlayerSettings,sleepTimerSettings: null == sleepTimerSettings ? _self.sleepTimerSettings : sleepTimerSettings // ignore: cast_nullable_to_non_nullable
as SleepTimerSettings,downloadSettings: null == downloadSettings ? _self.downloadSettings : downloadSettings // ignore: cast_nullable_to_non_nullable
as DownloadSettings,notificationSettings: null == notificationSettings ? _self.notificationSettings : notificationSettings // ignore: cast_nullable_to_non_nullable
as NotificationSettings,shakeDetectionSettings: null == shakeDetectionSettings ? _self.shakeDetectionSettings : shakeDetectionSettings // ignore: cast_nullable_to_non_nullable
as ShakeDetectionSettings,homePageSettings: null == homePageSettings ? _self.homePageSettings : homePageSettings // ignore: cast_nullable_to_non_nullable
as HomePageSettings,
  ));
}

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemeSettingsCopyWith<$Res> get themeSettings {
  
  return $ThemeSettingsCopyWith<$Res>(_self.themeSettings, (value) {
    return _then(_self.copyWith(themeSettings: value));
  });
}/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSettingsCopyWith<$Res> get playerSettings {
  
  return $PlayerSettingsCopyWith<$Res>(_self.playerSettings, (value) {
    return _then(_self.copyWith(playerSettings: value));
  });
}/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SleepTimerSettingsCopyWith<$Res> get sleepTimerSettings {
  
  return $SleepTimerSettingsCopyWith<$Res>(_self.sleepTimerSettings, (value) {
    return _then(_self.copyWith(sleepTimerSettings: value));
  });
}/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DownloadSettingsCopyWith<$Res> get downloadSettings {
  
  return $DownloadSettingsCopyWith<$Res>(_self.downloadSettings, (value) {
    return _then(_self.copyWith(downloadSettings: value));
  });
}/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationSettingsCopyWith<$Res> get notificationSettings {
  
  return $NotificationSettingsCopyWith<$Res>(_self.notificationSettings, (value) {
    return _then(_self.copyWith(notificationSettings: value));
  });
}/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShakeDetectionSettingsCopyWith<$Res> get shakeDetectionSettings {
  
  return $ShakeDetectionSettingsCopyWith<$Res>(_self.shakeDetectionSettings, (value) {
    return _then(_self.copyWith(shakeDetectionSettings: value));
  });
}/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomePageSettingsCopyWith<$Res> get homePageSettings {
  
  return $HomePageSettingsCopyWith<$Res>(_self.homePageSettings, (value) {
    return _then(_self.copyWith(homePageSettings: value));
  });
}
}


/// @nodoc
mixin _$ThemeSettings {

 ThemeMode get themeMode; bool get highContrast; bool get useMaterialThemeFromSystem; String get customThemeColor; bool get useMaterialThemeOnItemPage; bool get useCurrentPlayerThemeThroughoutApp;
/// Create a copy of ThemeSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeSettingsCopyWith<ThemeSettings> get copyWith => _$ThemeSettingsCopyWithImpl<ThemeSettings>(this as ThemeSettings, _$identity);

  /// Serializes this ThemeSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeSettings&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.highContrast, highContrast) || other.highContrast == highContrast)&&(identical(other.useMaterialThemeFromSystem, useMaterialThemeFromSystem) || other.useMaterialThemeFromSystem == useMaterialThemeFromSystem)&&(identical(other.customThemeColor, customThemeColor) || other.customThemeColor == customThemeColor)&&(identical(other.useMaterialThemeOnItemPage, useMaterialThemeOnItemPage) || other.useMaterialThemeOnItemPage == useMaterialThemeOnItemPage)&&(identical(other.useCurrentPlayerThemeThroughoutApp, useCurrentPlayerThemeThroughoutApp) || other.useCurrentPlayerThemeThroughoutApp == useCurrentPlayerThemeThroughoutApp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode,highContrast,useMaterialThemeFromSystem,customThemeColor,useMaterialThemeOnItemPage,useCurrentPlayerThemeThroughoutApp);

@override
String toString() {
  return 'ThemeSettings(themeMode: $themeMode, highContrast: $highContrast, useMaterialThemeFromSystem: $useMaterialThemeFromSystem, customThemeColor: $customThemeColor, useMaterialThemeOnItemPage: $useMaterialThemeOnItemPage, useCurrentPlayerThemeThroughoutApp: $useCurrentPlayerThemeThroughoutApp)';
}


}

/// @nodoc
abstract mixin class $ThemeSettingsCopyWith<$Res>  {
  factory $ThemeSettingsCopyWith(ThemeSettings value, $Res Function(ThemeSettings) _then) = _$ThemeSettingsCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode, bool highContrast, bool useMaterialThemeFromSystem, String customThemeColor, bool useMaterialThemeOnItemPage, bool useCurrentPlayerThemeThroughoutApp
});




}
/// @nodoc
class _$ThemeSettingsCopyWithImpl<$Res>
    implements $ThemeSettingsCopyWith<$Res> {
  _$ThemeSettingsCopyWithImpl(this._self, this._then);

  final ThemeSettings _self;
  final $Res Function(ThemeSettings) _then;

/// Create a copy of ThemeSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? highContrast = null,Object? useMaterialThemeFromSystem = null,Object? customThemeColor = null,Object? useMaterialThemeOnItemPage = null,Object? useCurrentPlayerThemeThroughoutApp = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,highContrast: null == highContrast ? _self.highContrast : highContrast // ignore: cast_nullable_to_non_nullable
as bool,useMaterialThemeFromSystem: null == useMaterialThemeFromSystem ? _self.useMaterialThemeFromSystem : useMaterialThemeFromSystem // ignore: cast_nullable_to_non_nullable
as bool,customThemeColor: null == customThemeColor ? _self.customThemeColor : customThemeColor // ignore: cast_nullable_to_non_nullable
as String,useMaterialThemeOnItemPage: null == useMaterialThemeOnItemPage ? _self.useMaterialThemeOnItemPage : useMaterialThemeOnItemPage // ignore: cast_nullable_to_non_nullable
as bool,useCurrentPlayerThemeThroughoutApp: null == useCurrentPlayerThemeThroughoutApp ? _self.useCurrentPlayerThemeThroughoutApp : useCurrentPlayerThemeThroughoutApp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeSettings].
extension ThemeSettingsPatterns on ThemeSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeSettings value)  $default,){
final _that = this;
switch (_that) {
case _ThemeSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode themeMode,  bool highContrast,  bool useMaterialThemeFromSystem,  String customThemeColor,  bool useMaterialThemeOnItemPage,  bool useCurrentPlayerThemeThroughoutApp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeSettings() when $default != null:
return $default(_that.themeMode,_that.highContrast,_that.useMaterialThemeFromSystem,_that.customThemeColor,_that.useMaterialThemeOnItemPage,_that.useCurrentPlayerThemeThroughoutApp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode themeMode,  bool highContrast,  bool useMaterialThemeFromSystem,  String customThemeColor,  bool useMaterialThemeOnItemPage,  bool useCurrentPlayerThemeThroughoutApp)  $default,) {final _that = this;
switch (_that) {
case _ThemeSettings():
return $default(_that.themeMode,_that.highContrast,_that.useMaterialThemeFromSystem,_that.customThemeColor,_that.useMaterialThemeOnItemPage,_that.useCurrentPlayerThemeThroughoutApp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode themeMode,  bool highContrast,  bool useMaterialThemeFromSystem,  String customThemeColor,  bool useMaterialThemeOnItemPage,  bool useCurrentPlayerThemeThroughoutApp)?  $default,) {final _that = this;
switch (_that) {
case _ThemeSettings() when $default != null:
return $default(_that.themeMode,_that.highContrast,_that.useMaterialThemeFromSystem,_that.customThemeColor,_that.useMaterialThemeOnItemPage,_that.useCurrentPlayerThemeThroughoutApp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThemeSettings implements ThemeSettings {
  const _ThemeSettings({this.themeMode = ThemeMode.system, this.highContrast = false, this.useMaterialThemeFromSystem = false, this.customThemeColor = '#FF311B92', this.useMaterialThemeOnItemPage = true, this.useCurrentPlayerThemeThroughoutApp = true});
  factory _ThemeSettings.fromJson(Map<String, dynamic> json) => _$ThemeSettingsFromJson(json);

@override@JsonKey() final  ThemeMode themeMode;
@override@JsonKey() final  bool highContrast;
@override@JsonKey() final  bool useMaterialThemeFromSystem;
@override@JsonKey() final  String customThemeColor;
@override@JsonKey() final  bool useMaterialThemeOnItemPage;
@override@JsonKey() final  bool useCurrentPlayerThemeThroughoutApp;

/// Create a copy of ThemeSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeSettingsCopyWith<_ThemeSettings> get copyWith => __$ThemeSettingsCopyWithImpl<_ThemeSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThemeSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeSettings&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.highContrast, highContrast) || other.highContrast == highContrast)&&(identical(other.useMaterialThemeFromSystem, useMaterialThemeFromSystem) || other.useMaterialThemeFromSystem == useMaterialThemeFromSystem)&&(identical(other.customThemeColor, customThemeColor) || other.customThemeColor == customThemeColor)&&(identical(other.useMaterialThemeOnItemPage, useMaterialThemeOnItemPage) || other.useMaterialThemeOnItemPage == useMaterialThemeOnItemPage)&&(identical(other.useCurrentPlayerThemeThroughoutApp, useCurrentPlayerThemeThroughoutApp) || other.useCurrentPlayerThemeThroughoutApp == useCurrentPlayerThemeThroughoutApp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode,highContrast,useMaterialThemeFromSystem,customThemeColor,useMaterialThemeOnItemPage,useCurrentPlayerThemeThroughoutApp);

@override
String toString() {
  return 'ThemeSettings(themeMode: $themeMode, highContrast: $highContrast, useMaterialThemeFromSystem: $useMaterialThemeFromSystem, customThemeColor: $customThemeColor, useMaterialThemeOnItemPage: $useMaterialThemeOnItemPage, useCurrentPlayerThemeThroughoutApp: $useCurrentPlayerThemeThroughoutApp)';
}


}

/// @nodoc
abstract mixin class _$ThemeSettingsCopyWith<$Res> implements $ThemeSettingsCopyWith<$Res> {
  factory _$ThemeSettingsCopyWith(_ThemeSettings value, $Res Function(_ThemeSettings) _then) = __$ThemeSettingsCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode, bool highContrast, bool useMaterialThemeFromSystem, String customThemeColor, bool useMaterialThemeOnItemPage, bool useCurrentPlayerThemeThroughoutApp
});




}
/// @nodoc
class __$ThemeSettingsCopyWithImpl<$Res>
    implements _$ThemeSettingsCopyWith<$Res> {
  __$ThemeSettingsCopyWithImpl(this._self, this._then);

  final _ThemeSettings _self;
  final $Res Function(_ThemeSettings) _then;

/// Create a copy of ThemeSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? highContrast = null,Object? useMaterialThemeFromSystem = null,Object? customThemeColor = null,Object? useMaterialThemeOnItemPage = null,Object? useCurrentPlayerThemeThroughoutApp = null,}) {
  return _then(_ThemeSettings(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,highContrast: null == highContrast ? _self.highContrast : highContrast // ignore: cast_nullable_to_non_nullable
as bool,useMaterialThemeFromSystem: null == useMaterialThemeFromSystem ? _self.useMaterialThemeFromSystem : useMaterialThemeFromSystem // ignore: cast_nullable_to_non_nullable
as bool,customThemeColor: null == customThemeColor ? _self.customThemeColor : customThemeColor // ignore: cast_nullable_to_non_nullable
as String,useMaterialThemeOnItemPage: null == useMaterialThemeOnItemPage ? _self.useMaterialThemeOnItemPage : useMaterialThemeOnItemPage // ignore: cast_nullable_to_non_nullable
as bool,useCurrentPlayerThemeThroughoutApp: null == useCurrentPlayerThemeThroughoutApp ? _self.useCurrentPlayerThemeThroughoutApp : useCurrentPlayerThemeThroughoutApp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PlayerSettings {

 MinimizedPlayerSettings get miniPlayerSettings; ExpandedPlayerSettings get expandedPlayerSettings; double get preferredDefaultVolume; double get preferredDefaultSpeed; List<double> get speedOptions; double get speedIncrement; double get minSpeed; double get maxSpeed; Duration get minimumPositionForReporting; Duration get playbackReportInterval; Duration get markCompleteWhenTimeLeft; bool get configurePlayerForEveryBook;
/// Create a copy of PlayerSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerSettingsCopyWith<PlayerSettings> get copyWith => _$PlayerSettingsCopyWithImpl<PlayerSettings>(this as PlayerSettings, _$identity);

  /// Serializes this PlayerSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerSettings&&(identical(other.miniPlayerSettings, miniPlayerSettings) || other.miniPlayerSettings == miniPlayerSettings)&&(identical(other.expandedPlayerSettings, expandedPlayerSettings) || other.expandedPlayerSettings == expandedPlayerSettings)&&(identical(other.preferredDefaultVolume, preferredDefaultVolume) || other.preferredDefaultVolume == preferredDefaultVolume)&&(identical(other.preferredDefaultSpeed, preferredDefaultSpeed) || other.preferredDefaultSpeed == preferredDefaultSpeed)&&const DeepCollectionEquality().equals(other.speedOptions, speedOptions)&&(identical(other.speedIncrement, speedIncrement) || other.speedIncrement == speedIncrement)&&(identical(other.minSpeed, minSpeed) || other.minSpeed == minSpeed)&&(identical(other.maxSpeed, maxSpeed) || other.maxSpeed == maxSpeed)&&(identical(other.minimumPositionForReporting, minimumPositionForReporting) || other.minimumPositionForReporting == minimumPositionForReporting)&&(identical(other.playbackReportInterval, playbackReportInterval) || other.playbackReportInterval == playbackReportInterval)&&(identical(other.markCompleteWhenTimeLeft, markCompleteWhenTimeLeft) || other.markCompleteWhenTimeLeft == markCompleteWhenTimeLeft)&&(identical(other.configurePlayerForEveryBook, configurePlayerForEveryBook) || other.configurePlayerForEveryBook == configurePlayerForEveryBook));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,miniPlayerSettings,expandedPlayerSettings,preferredDefaultVolume,preferredDefaultSpeed,const DeepCollectionEquality().hash(speedOptions),speedIncrement,minSpeed,maxSpeed,minimumPositionForReporting,playbackReportInterval,markCompleteWhenTimeLeft,configurePlayerForEveryBook);

@override
String toString() {
  return 'PlayerSettings(miniPlayerSettings: $miniPlayerSettings, expandedPlayerSettings: $expandedPlayerSettings, preferredDefaultVolume: $preferredDefaultVolume, preferredDefaultSpeed: $preferredDefaultSpeed, speedOptions: $speedOptions, speedIncrement: $speedIncrement, minSpeed: $minSpeed, maxSpeed: $maxSpeed, minimumPositionForReporting: $minimumPositionForReporting, playbackReportInterval: $playbackReportInterval, markCompleteWhenTimeLeft: $markCompleteWhenTimeLeft, configurePlayerForEveryBook: $configurePlayerForEveryBook)';
}


}

/// @nodoc
abstract mixin class $PlayerSettingsCopyWith<$Res>  {
  factory $PlayerSettingsCopyWith(PlayerSettings value, $Res Function(PlayerSettings) _then) = _$PlayerSettingsCopyWithImpl;
@useResult
$Res call({
 MinimizedPlayerSettings miniPlayerSettings, ExpandedPlayerSettings expandedPlayerSettings, double preferredDefaultVolume, double preferredDefaultSpeed, List<double> speedOptions, double speedIncrement, double minSpeed, double maxSpeed, Duration minimumPositionForReporting, Duration playbackReportInterval, Duration markCompleteWhenTimeLeft, bool configurePlayerForEveryBook
});


$MinimizedPlayerSettingsCopyWith<$Res> get miniPlayerSettings;$ExpandedPlayerSettingsCopyWith<$Res> get expandedPlayerSettings;

}
/// @nodoc
class _$PlayerSettingsCopyWithImpl<$Res>
    implements $PlayerSettingsCopyWith<$Res> {
  _$PlayerSettingsCopyWithImpl(this._self, this._then);

  final PlayerSettings _self;
  final $Res Function(PlayerSettings) _then;

/// Create a copy of PlayerSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? miniPlayerSettings = null,Object? expandedPlayerSettings = null,Object? preferredDefaultVolume = null,Object? preferredDefaultSpeed = null,Object? speedOptions = null,Object? speedIncrement = null,Object? minSpeed = null,Object? maxSpeed = null,Object? minimumPositionForReporting = null,Object? playbackReportInterval = null,Object? markCompleteWhenTimeLeft = null,Object? configurePlayerForEveryBook = null,}) {
  return _then(_self.copyWith(
miniPlayerSettings: null == miniPlayerSettings ? _self.miniPlayerSettings : miniPlayerSettings // ignore: cast_nullable_to_non_nullable
as MinimizedPlayerSettings,expandedPlayerSettings: null == expandedPlayerSettings ? _self.expandedPlayerSettings : expandedPlayerSettings // ignore: cast_nullable_to_non_nullable
as ExpandedPlayerSettings,preferredDefaultVolume: null == preferredDefaultVolume ? _self.preferredDefaultVolume : preferredDefaultVolume // ignore: cast_nullable_to_non_nullable
as double,preferredDefaultSpeed: null == preferredDefaultSpeed ? _self.preferredDefaultSpeed : preferredDefaultSpeed // ignore: cast_nullable_to_non_nullable
as double,speedOptions: null == speedOptions ? _self.speedOptions : speedOptions // ignore: cast_nullable_to_non_nullable
as List<double>,speedIncrement: null == speedIncrement ? _self.speedIncrement : speedIncrement // ignore: cast_nullable_to_non_nullable
as double,minSpeed: null == minSpeed ? _self.minSpeed : minSpeed // ignore: cast_nullable_to_non_nullable
as double,maxSpeed: null == maxSpeed ? _self.maxSpeed : maxSpeed // ignore: cast_nullable_to_non_nullable
as double,minimumPositionForReporting: null == minimumPositionForReporting ? _self.minimumPositionForReporting : minimumPositionForReporting // ignore: cast_nullable_to_non_nullable
as Duration,playbackReportInterval: null == playbackReportInterval ? _self.playbackReportInterval : playbackReportInterval // ignore: cast_nullable_to_non_nullable
as Duration,markCompleteWhenTimeLeft: null == markCompleteWhenTimeLeft ? _self.markCompleteWhenTimeLeft : markCompleteWhenTimeLeft // ignore: cast_nullable_to_non_nullable
as Duration,configurePlayerForEveryBook: null == configurePlayerForEveryBook ? _self.configurePlayerForEveryBook : configurePlayerForEveryBook // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MinimizedPlayerSettingsCopyWith<$Res> get miniPlayerSettings {
  
  return $MinimizedPlayerSettingsCopyWith<$Res>(_self.miniPlayerSettings, (value) {
    return _then(_self.copyWith(miniPlayerSettings: value));
  });
}/// Create a copy of PlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpandedPlayerSettingsCopyWith<$Res> get expandedPlayerSettings {
  
  return $ExpandedPlayerSettingsCopyWith<$Res>(_self.expandedPlayerSettings, (value) {
    return _then(_self.copyWith(expandedPlayerSettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlayerSettings].
extension PlayerSettingsPatterns on PlayerSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerSettings value)  $default,){
final _that = this;
switch (_that) {
case _PlayerSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerSettings value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MinimizedPlayerSettings miniPlayerSettings,  ExpandedPlayerSettings expandedPlayerSettings,  double preferredDefaultVolume,  double preferredDefaultSpeed,  List<double> speedOptions,  double speedIncrement,  double minSpeed,  double maxSpeed,  Duration minimumPositionForReporting,  Duration playbackReportInterval,  Duration markCompleteWhenTimeLeft,  bool configurePlayerForEveryBook)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerSettings() when $default != null:
return $default(_that.miniPlayerSettings,_that.expandedPlayerSettings,_that.preferredDefaultVolume,_that.preferredDefaultSpeed,_that.speedOptions,_that.speedIncrement,_that.minSpeed,_that.maxSpeed,_that.minimumPositionForReporting,_that.playbackReportInterval,_that.markCompleteWhenTimeLeft,_that.configurePlayerForEveryBook);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MinimizedPlayerSettings miniPlayerSettings,  ExpandedPlayerSettings expandedPlayerSettings,  double preferredDefaultVolume,  double preferredDefaultSpeed,  List<double> speedOptions,  double speedIncrement,  double minSpeed,  double maxSpeed,  Duration minimumPositionForReporting,  Duration playbackReportInterval,  Duration markCompleteWhenTimeLeft,  bool configurePlayerForEveryBook)  $default,) {final _that = this;
switch (_that) {
case _PlayerSettings():
return $default(_that.miniPlayerSettings,_that.expandedPlayerSettings,_that.preferredDefaultVolume,_that.preferredDefaultSpeed,_that.speedOptions,_that.speedIncrement,_that.minSpeed,_that.maxSpeed,_that.minimumPositionForReporting,_that.playbackReportInterval,_that.markCompleteWhenTimeLeft,_that.configurePlayerForEveryBook);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MinimizedPlayerSettings miniPlayerSettings,  ExpandedPlayerSettings expandedPlayerSettings,  double preferredDefaultVolume,  double preferredDefaultSpeed,  List<double> speedOptions,  double speedIncrement,  double minSpeed,  double maxSpeed,  Duration minimumPositionForReporting,  Duration playbackReportInterval,  Duration markCompleteWhenTimeLeft,  bool configurePlayerForEveryBook)?  $default,) {final _that = this;
switch (_that) {
case _PlayerSettings() when $default != null:
return $default(_that.miniPlayerSettings,_that.expandedPlayerSettings,_that.preferredDefaultVolume,_that.preferredDefaultSpeed,_that.speedOptions,_that.speedIncrement,_that.minSpeed,_that.maxSpeed,_that.minimumPositionForReporting,_that.playbackReportInterval,_that.markCompleteWhenTimeLeft,_that.configurePlayerForEveryBook);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerSettings implements PlayerSettings {
  const _PlayerSettings({this.miniPlayerSettings = const MinimizedPlayerSettings(), this.expandedPlayerSettings = const ExpandedPlayerSettings(), this.preferredDefaultVolume = 1, this.preferredDefaultSpeed = 1, final  List<double> speedOptions = const [1, 1.25, 1.5, 1.75, 2], this.speedIncrement = 0.05, this.minSpeed = 0.1, this.maxSpeed = 4, this.minimumPositionForReporting = const Duration(seconds: 10), this.playbackReportInterval = const Duration(seconds: 10), this.markCompleteWhenTimeLeft = const Duration(seconds: 15), this.configurePlayerForEveryBook = true}): _speedOptions = speedOptions;
  factory _PlayerSettings.fromJson(Map<String, dynamic> json) => _$PlayerSettingsFromJson(json);

@override@JsonKey() final  MinimizedPlayerSettings miniPlayerSettings;
@override@JsonKey() final  ExpandedPlayerSettings expandedPlayerSettings;
@override@JsonKey() final  double preferredDefaultVolume;
@override@JsonKey() final  double preferredDefaultSpeed;
 final  List<double> _speedOptions;
@override@JsonKey() List<double> get speedOptions {
  if (_speedOptions is EqualUnmodifiableListView) return _speedOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_speedOptions);
}

@override@JsonKey() final  double speedIncrement;
@override@JsonKey() final  double minSpeed;
@override@JsonKey() final  double maxSpeed;
@override@JsonKey() final  Duration minimumPositionForReporting;
@override@JsonKey() final  Duration playbackReportInterval;
@override@JsonKey() final  Duration markCompleteWhenTimeLeft;
@override@JsonKey() final  bool configurePlayerForEveryBook;

/// Create a copy of PlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerSettingsCopyWith<_PlayerSettings> get copyWith => __$PlayerSettingsCopyWithImpl<_PlayerSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerSettings&&(identical(other.miniPlayerSettings, miniPlayerSettings) || other.miniPlayerSettings == miniPlayerSettings)&&(identical(other.expandedPlayerSettings, expandedPlayerSettings) || other.expandedPlayerSettings == expandedPlayerSettings)&&(identical(other.preferredDefaultVolume, preferredDefaultVolume) || other.preferredDefaultVolume == preferredDefaultVolume)&&(identical(other.preferredDefaultSpeed, preferredDefaultSpeed) || other.preferredDefaultSpeed == preferredDefaultSpeed)&&const DeepCollectionEquality().equals(other._speedOptions, _speedOptions)&&(identical(other.speedIncrement, speedIncrement) || other.speedIncrement == speedIncrement)&&(identical(other.minSpeed, minSpeed) || other.minSpeed == minSpeed)&&(identical(other.maxSpeed, maxSpeed) || other.maxSpeed == maxSpeed)&&(identical(other.minimumPositionForReporting, minimumPositionForReporting) || other.minimumPositionForReporting == minimumPositionForReporting)&&(identical(other.playbackReportInterval, playbackReportInterval) || other.playbackReportInterval == playbackReportInterval)&&(identical(other.markCompleteWhenTimeLeft, markCompleteWhenTimeLeft) || other.markCompleteWhenTimeLeft == markCompleteWhenTimeLeft)&&(identical(other.configurePlayerForEveryBook, configurePlayerForEveryBook) || other.configurePlayerForEveryBook == configurePlayerForEveryBook));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,miniPlayerSettings,expandedPlayerSettings,preferredDefaultVolume,preferredDefaultSpeed,const DeepCollectionEquality().hash(_speedOptions),speedIncrement,minSpeed,maxSpeed,minimumPositionForReporting,playbackReportInterval,markCompleteWhenTimeLeft,configurePlayerForEveryBook);

@override
String toString() {
  return 'PlayerSettings(miniPlayerSettings: $miniPlayerSettings, expandedPlayerSettings: $expandedPlayerSettings, preferredDefaultVolume: $preferredDefaultVolume, preferredDefaultSpeed: $preferredDefaultSpeed, speedOptions: $speedOptions, speedIncrement: $speedIncrement, minSpeed: $minSpeed, maxSpeed: $maxSpeed, minimumPositionForReporting: $minimumPositionForReporting, playbackReportInterval: $playbackReportInterval, markCompleteWhenTimeLeft: $markCompleteWhenTimeLeft, configurePlayerForEveryBook: $configurePlayerForEveryBook)';
}


}

/// @nodoc
abstract mixin class _$PlayerSettingsCopyWith<$Res> implements $PlayerSettingsCopyWith<$Res> {
  factory _$PlayerSettingsCopyWith(_PlayerSettings value, $Res Function(_PlayerSettings) _then) = __$PlayerSettingsCopyWithImpl;
@override @useResult
$Res call({
 MinimizedPlayerSettings miniPlayerSettings, ExpandedPlayerSettings expandedPlayerSettings, double preferredDefaultVolume, double preferredDefaultSpeed, List<double> speedOptions, double speedIncrement, double minSpeed, double maxSpeed, Duration minimumPositionForReporting, Duration playbackReportInterval, Duration markCompleteWhenTimeLeft, bool configurePlayerForEveryBook
});


@override $MinimizedPlayerSettingsCopyWith<$Res> get miniPlayerSettings;@override $ExpandedPlayerSettingsCopyWith<$Res> get expandedPlayerSettings;

}
/// @nodoc
class __$PlayerSettingsCopyWithImpl<$Res>
    implements _$PlayerSettingsCopyWith<$Res> {
  __$PlayerSettingsCopyWithImpl(this._self, this._then);

  final _PlayerSettings _self;
  final $Res Function(_PlayerSettings) _then;

/// Create a copy of PlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? miniPlayerSettings = null,Object? expandedPlayerSettings = null,Object? preferredDefaultVolume = null,Object? preferredDefaultSpeed = null,Object? speedOptions = null,Object? speedIncrement = null,Object? minSpeed = null,Object? maxSpeed = null,Object? minimumPositionForReporting = null,Object? playbackReportInterval = null,Object? markCompleteWhenTimeLeft = null,Object? configurePlayerForEveryBook = null,}) {
  return _then(_PlayerSettings(
miniPlayerSettings: null == miniPlayerSettings ? _self.miniPlayerSettings : miniPlayerSettings // ignore: cast_nullable_to_non_nullable
as MinimizedPlayerSettings,expandedPlayerSettings: null == expandedPlayerSettings ? _self.expandedPlayerSettings : expandedPlayerSettings // ignore: cast_nullable_to_non_nullable
as ExpandedPlayerSettings,preferredDefaultVolume: null == preferredDefaultVolume ? _self.preferredDefaultVolume : preferredDefaultVolume // ignore: cast_nullable_to_non_nullable
as double,preferredDefaultSpeed: null == preferredDefaultSpeed ? _self.preferredDefaultSpeed : preferredDefaultSpeed // ignore: cast_nullable_to_non_nullable
as double,speedOptions: null == speedOptions ? _self._speedOptions : speedOptions // ignore: cast_nullable_to_non_nullable
as List<double>,speedIncrement: null == speedIncrement ? _self.speedIncrement : speedIncrement // ignore: cast_nullable_to_non_nullable
as double,minSpeed: null == minSpeed ? _self.minSpeed : minSpeed // ignore: cast_nullable_to_non_nullable
as double,maxSpeed: null == maxSpeed ? _self.maxSpeed : maxSpeed // ignore: cast_nullable_to_non_nullable
as double,minimumPositionForReporting: null == minimumPositionForReporting ? _self.minimumPositionForReporting : minimumPositionForReporting // ignore: cast_nullable_to_non_nullable
as Duration,playbackReportInterval: null == playbackReportInterval ? _self.playbackReportInterval : playbackReportInterval // ignore: cast_nullable_to_non_nullable
as Duration,markCompleteWhenTimeLeft: null == markCompleteWhenTimeLeft ? _self.markCompleteWhenTimeLeft : markCompleteWhenTimeLeft // ignore: cast_nullable_to_non_nullable
as Duration,configurePlayerForEveryBook: null == configurePlayerForEveryBook ? _self.configurePlayerForEveryBook : configurePlayerForEveryBook // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MinimizedPlayerSettingsCopyWith<$Res> get miniPlayerSettings {
  
  return $MinimizedPlayerSettingsCopyWith<$Res>(_self.miniPlayerSettings, (value) {
    return _then(_self.copyWith(miniPlayerSettings: value));
  });
}/// Create a copy of PlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpandedPlayerSettingsCopyWith<$Res> get expandedPlayerSettings {
  
  return $ExpandedPlayerSettingsCopyWith<$Res>(_self.expandedPlayerSettings, (value) {
    return _then(_self.copyWith(expandedPlayerSettings: value));
  });
}
}


/// @nodoc
mixin _$ExpandedPlayerSettings {

 bool get showTotalProgress; bool get showChapterProgress;
/// Create a copy of ExpandedPlayerSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpandedPlayerSettingsCopyWith<ExpandedPlayerSettings> get copyWith => _$ExpandedPlayerSettingsCopyWithImpl<ExpandedPlayerSettings>(this as ExpandedPlayerSettings, _$identity);

  /// Serializes this ExpandedPlayerSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpandedPlayerSettings&&(identical(other.showTotalProgress, showTotalProgress) || other.showTotalProgress == showTotalProgress)&&(identical(other.showChapterProgress, showChapterProgress) || other.showChapterProgress == showChapterProgress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showTotalProgress,showChapterProgress);

@override
String toString() {
  return 'ExpandedPlayerSettings(showTotalProgress: $showTotalProgress, showChapterProgress: $showChapterProgress)';
}


}

/// @nodoc
abstract mixin class $ExpandedPlayerSettingsCopyWith<$Res>  {
  factory $ExpandedPlayerSettingsCopyWith(ExpandedPlayerSettings value, $Res Function(ExpandedPlayerSettings) _then) = _$ExpandedPlayerSettingsCopyWithImpl;
@useResult
$Res call({
 bool showTotalProgress, bool showChapterProgress
});




}
/// @nodoc
class _$ExpandedPlayerSettingsCopyWithImpl<$Res>
    implements $ExpandedPlayerSettingsCopyWith<$Res> {
  _$ExpandedPlayerSettingsCopyWithImpl(this._self, this._then);

  final ExpandedPlayerSettings _self;
  final $Res Function(ExpandedPlayerSettings) _then;

/// Create a copy of ExpandedPlayerSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showTotalProgress = null,Object? showChapterProgress = null,}) {
  return _then(_self.copyWith(
showTotalProgress: null == showTotalProgress ? _self.showTotalProgress : showTotalProgress // ignore: cast_nullable_to_non_nullable
as bool,showChapterProgress: null == showChapterProgress ? _self.showChapterProgress : showChapterProgress // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpandedPlayerSettings].
extension ExpandedPlayerSettingsPatterns on ExpandedPlayerSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpandedPlayerSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpandedPlayerSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpandedPlayerSettings value)  $default,){
final _that = this;
switch (_that) {
case _ExpandedPlayerSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpandedPlayerSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ExpandedPlayerSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showTotalProgress,  bool showChapterProgress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpandedPlayerSettings() when $default != null:
return $default(_that.showTotalProgress,_that.showChapterProgress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showTotalProgress,  bool showChapterProgress)  $default,) {final _that = this;
switch (_that) {
case _ExpandedPlayerSettings():
return $default(_that.showTotalProgress,_that.showChapterProgress);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showTotalProgress,  bool showChapterProgress)?  $default,) {final _that = this;
switch (_that) {
case _ExpandedPlayerSettings() when $default != null:
return $default(_that.showTotalProgress,_that.showChapterProgress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpandedPlayerSettings implements ExpandedPlayerSettings {
  const _ExpandedPlayerSettings({this.showTotalProgress = false, this.showChapterProgress = true});
  factory _ExpandedPlayerSettings.fromJson(Map<String, dynamic> json) => _$ExpandedPlayerSettingsFromJson(json);

@override@JsonKey() final  bool showTotalProgress;
@override@JsonKey() final  bool showChapterProgress;

/// Create a copy of ExpandedPlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpandedPlayerSettingsCopyWith<_ExpandedPlayerSettings> get copyWith => __$ExpandedPlayerSettingsCopyWithImpl<_ExpandedPlayerSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpandedPlayerSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpandedPlayerSettings&&(identical(other.showTotalProgress, showTotalProgress) || other.showTotalProgress == showTotalProgress)&&(identical(other.showChapterProgress, showChapterProgress) || other.showChapterProgress == showChapterProgress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showTotalProgress,showChapterProgress);

@override
String toString() {
  return 'ExpandedPlayerSettings(showTotalProgress: $showTotalProgress, showChapterProgress: $showChapterProgress)';
}


}

/// @nodoc
abstract mixin class _$ExpandedPlayerSettingsCopyWith<$Res> implements $ExpandedPlayerSettingsCopyWith<$Res> {
  factory _$ExpandedPlayerSettingsCopyWith(_ExpandedPlayerSettings value, $Res Function(_ExpandedPlayerSettings) _then) = __$ExpandedPlayerSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool showTotalProgress, bool showChapterProgress
});




}
/// @nodoc
class __$ExpandedPlayerSettingsCopyWithImpl<$Res>
    implements _$ExpandedPlayerSettingsCopyWith<$Res> {
  __$ExpandedPlayerSettingsCopyWithImpl(this._self, this._then);

  final _ExpandedPlayerSettings _self;
  final $Res Function(_ExpandedPlayerSettings) _then;

/// Create a copy of ExpandedPlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showTotalProgress = null,Object? showChapterProgress = null,}) {
  return _then(_ExpandedPlayerSettings(
showTotalProgress: null == showTotalProgress ? _self.showTotalProgress : showTotalProgress // ignore: cast_nullable_to_non_nullable
as bool,showChapterProgress: null == showChapterProgress ? _self.showChapterProgress : showChapterProgress // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MinimizedPlayerSettings {

 bool get useChapterInfo;
/// Create a copy of MinimizedPlayerSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MinimizedPlayerSettingsCopyWith<MinimizedPlayerSettings> get copyWith => _$MinimizedPlayerSettingsCopyWithImpl<MinimizedPlayerSettings>(this as MinimizedPlayerSettings, _$identity);

  /// Serializes this MinimizedPlayerSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MinimizedPlayerSettings&&(identical(other.useChapterInfo, useChapterInfo) || other.useChapterInfo == useChapterInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,useChapterInfo);

@override
String toString() {
  return 'MinimizedPlayerSettings(useChapterInfo: $useChapterInfo)';
}


}

/// @nodoc
abstract mixin class $MinimizedPlayerSettingsCopyWith<$Res>  {
  factory $MinimizedPlayerSettingsCopyWith(MinimizedPlayerSettings value, $Res Function(MinimizedPlayerSettings) _then) = _$MinimizedPlayerSettingsCopyWithImpl;
@useResult
$Res call({
 bool useChapterInfo
});




}
/// @nodoc
class _$MinimizedPlayerSettingsCopyWithImpl<$Res>
    implements $MinimizedPlayerSettingsCopyWith<$Res> {
  _$MinimizedPlayerSettingsCopyWithImpl(this._self, this._then);

  final MinimizedPlayerSettings _self;
  final $Res Function(MinimizedPlayerSettings) _then;

/// Create a copy of MinimizedPlayerSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? useChapterInfo = null,}) {
  return _then(_self.copyWith(
useChapterInfo: null == useChapterInfo ? _self.useChapterInfo : useChapterInfo // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MinimizedPlayerSettings].
extension MinimizedPlayerSettingsPatterns on MinimizedPlayerSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MinimizedPlayerSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MinimizedPlayerSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MinimizedPlayerSettings value)  $default,){
final _that = this;
switch (_that) {
case _MinimizedPlayerSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MinimizedPlayerSettings value)?  $default,){
final _that = this;
switch (_that) {
case _MinimizedPlayerSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool useChapterInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MinimizedPlayerSettings() when $default != null:
return $default(_that.useChapterInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool useChapterInfo)  $default,) {final _that = this;
switch (_that) {
case _MinimizedPlayerSettings():
return $default(_that.useChapterInfo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool useChapterInfo)?  $default,) {final _that = this;
switch (_that) {
case _MinimizedPlayerSettings() when $default != null:
return $default(_that.useChapterInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MinimizedPlayerSettings implements MinimizedPlayerSettings {
  const _MinimizedPlayerSettings({this.useChapterInfo = false});
  factory _MinimizedPlayerSettings.fromJson(Map<String, dynamic> json) => _$MinimizedPlayerSettingsFromJson(json);

@override@JsonKey() final  bool useChapterInfo;

/// Create a copy of MinimizedPlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MinimizedPlayerSettingsCopyWith<_MinimizedPlayerSettings> get copyWith => __$MinimizedPlayerSettingsCopyWithImpl<_MinimizedPlayerSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MinimizedPlayerSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MinimizedPlayerSettings&&(identical(other.useChapterInfo, useChapterInfo) || other.useChapterInfo == useChapterInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,useChapterInfo);

@override
String toString() {
  return 'MinimizedPlayerSettings(useChapterInfo: $useChapterInfo)';
}


}

/// @nodoc
abstract mixin class _$MinimizedPlayerSettingsCopyWith<$Res> implements $MinimizedPlayerSettingsCopyWith<$Res> {
  factory _$MinimizedPlayerSettingsCopyWith(_MinimizedPlayerSettings value, $Res Function(_MinimizedPlayerSettings) _then) = __$MinimizedPlayerSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool useChapterInfo
});




}
/// @nodoc
class __$MinimizedPlayerSettingsCopyWithImpl<$Res>
    implements _$MinimizedPlayerSettingsCopyWith<$Res> {
  __$MinimizedPlayerSettingsCopyWithImpl(this._self, this._then);

  final _MinimizedPlayerSettings _self;
  final $Res Function(_MinimizedPlayerSettings) _then;

/// Create a copy of MinimizedPlayerSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? useChapterInfo = null,}) {
  return _then(_MinimizedPlayerSettings(
useChapterInfo: null == useChapterInfo ? _self.useChapterInfo : useChapterInfo // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SleepTimerSettings {

 Duration get defaultDuration; List<Duration> get presetDurations; Duration get maxDuration; bool get fadeOutAudio; Duration get fadeOutDuration;/// if true, the player will automatically rewind the audio when the sleep timer is stopped
 bool get autoRewindWhenStopped;/// the key is the duration in minutes
 Map<int, Duration> get autoRewindDurations;/// auto turn on timer settings
 bool get autoTurnOnTimer;/// always auto turn on timer settings or during specific times
 bool get alwaysAutoTurnOnTimer;/// auto timer settings, only used if [alwaysAutoTurnOnTimer] is false
///
/// duration is the time from 00:00
 Duration get autoTurnOnTime; Duration get autoTurnOffTime;
/// Create a copy of SleepTimerSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SleepTimerSettingsCopyWith<SleepTimerSettings> get copyWith => _$SleepTimerSettingsCopyWithImpl<SleepTimerSettings>(this as SleepTimerSettings, _$identity);

  /// Serializes this SleepTimerSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SleepTimerSettings&&(identical(other.defaultDuration, defaultDuration) || other.defaultDuration == defaultDuration)&&const DeepCollectionEquality().equals(other.presetDurations, presetDurations)&&(identical(other.maxDuration, maxDuration) || other.maxDuration == maxDuration)&&(identical(other.fadeOutAudio, fadeOutAudio) || other.fadeOutAudio == fadeOutAudio)&&(identical(other.fadeOutDuration, fadeOutDuration) || other.fadeOutDuration == fadeOutDuration)&&(identical(other.autoRewindWhenStopped, autoRewindWhenStopped) || other.autoRewindWhenStopped == autoRewindWhenStopped)&&const DeepCollectionEquality().equals(other.autoRewindDurations, autoRewindDurations)&&(identical(other.autoTurnOnTimer, autoTurnOnTimer) || other.autoTurnOnTimer == autoTurnOnTimer)&&(identical(other.alwaysAutoTurnOnTimer, alwaysAutoTurnOnTimer) || other.alwaysAutoTurnOnTimer == alwaysAutoTurnOnTimer)&&(identical(other.autoTurnOnTime, autoTurnOnTime) || other.autoTurnOnTime == autoTurnOnTime)&&(identical(other.autoTurnOffTime, autoTurnOffTime) || other.autoTurnOffTime == autoTurnOffTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,defaultDuration,const DeepCollectionEquality().hash(presetDurations),maxDuration,fadeOutAudio,fadeOutDuration,autoRewindWhenStopped,const DeepCollectionEquality().hash(autoRewindDurations),autoTurnOnTimer,alwaysAutoTurnOnTimer,autoTurnOnTime,autoTurnOffTime);

@override
String toString() {
  return 'SleepTimerSettings(defaultDuration: $defaultDuration, presetDurations: $presetDurations, maxDuration: $maxDuration, fadeOutAudio: $fadeOutAudio, fadeOutDuration: $fadeOutDuration, autoRewindWhenStopped: $autoRewindWhenStopped, autoRewindDurations: $autoRewindDurations, autoTurnOnTimer: $autoTurnOnTimer, alwaysAutoTurnOnTimer: $alwaysAutoTurnOnTimer, autoTurnOnTime: $autoTurnOnTime, autoTurnOffTime: $autoTurnOffTime)';
}


}

/// @nodoc
abstract mixin class $SleepTimerSettingsCopyWith<$Res>  {
  factory $SleepTimerSettingsCopyWith(SleepTimerSettings value, $Res Function(SleepTimerSettings) _then) = _$SleepTimerSettingsCopyWithImpl;
@useResult
$Res call({
 Duration defaultDuration, List<Duration> presetDurations, Duration maxDuration, bool fadeOutAudio, Duration fadeOutDuration, bool autoRewindWhenStopped, Map<int, Duration> autoRewindDurations, bool autoTurnOnTimer, bool alwaysAutoTurnOnTimer, Duration autoTurnOnTime, Duration autoTurnOffTime
});




}
/// @nodoc
class _$SleepTimerSettingsCopyWithImpl<$Res>
    implements $SleepTimerSettingsCopyWith<$Res> {
  _$SleepTimerSettingsCopyWithImpl(this._self, this._then);

  final SleepTimerSettings _self;
  final $Res Function(SleepTimerSettings) _then;

/// Create a copy of SleepTimerSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? defaultDuration = null,Object? presetDurations = null,Object? maxDuration = null,Object? fadeOutAudio = null,Object? fadeOutDuration = null,Object? autoRewindWhenStopped = null,Object? autoRewindDurations = null,Object? autoTurnOnTimer = null,Object? alwaysAutoTurnOnTimer = null,Object? autoTurnOnTime = null,Object? autoTurnOffTime = null,}) {
  return _then(_self.copyWith(
defaultDuration: null == defaultDuration ? _self.defaultDuration : defaultDuration // ignore: cast_nullable_to_non_nullable
as Duration,presetDurations: null == presetDurations ? _self.presetDurations : presetDurations // ignore: cast_nullable_to_non_nullable
as List<Duration>,maxDuration: null == maxDuration ? _self.maxDuration : maxDuration // ignore: cast_nullable_to_non_nullable
as Duration,fadeOutAudio: null == fadeOutAudio ? _self.fadeOutAudio : fadeOutAudio // ignore: cast_nullable_to_non_nullable
as bool,fadeOutDuration: null == fadeOutDuration ? _self.fadeOutDuration : fadeOutDuration // ignore: cast_nullable_to_non_nullable
as Duration,autoRewindWhenStopped: null == autoRewindWhenStopped ? _self.autoRewindWhenStopped : autoRewindWhenStopped // ignore: cast_nullable_to_non_nullable
as bool,autoRewindDurations: null == autoRewindDurations ? _self.autoRewindDurations : autoRewindDurations // ignore: cast_nullable_to_non_nullable
as Map<int, Duration>,autoTurnOnTimer: null == autoTurnOnTimer ? _self.autoTurnOnTimer : autoTurnOnTimer // ignore: cast_nullable_to_non_nullable
as bool,alwaysAutoTurnOnTimer: null == alwaysAutoTurnOnTimer ? _self.alwaysAutoTurnOnTimer : alwaysAutoTurnOnTimer // ignore: cast_nullable_to_non_nullable
as bool,autoTurnOnTime: null == autoTurnOnTime ? _self.autoTurnOnTime : autoTurnOnTime // ignore: cast_nullable_to_non_nullable
as Duration,autoTurnOffTime: null == autoTurnOffTime ? _self.autoTurnOffTime : autoTurnOffTime // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [SleepTimerSettings].
extension SleepTimerSettingsPatterns on SleepTimerSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SleepTimerSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SleepTimerSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SleepTimerSettings value)  $default,){
final _that = this;
switch (_that) {
case _SleepTimerSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SleepTimerSettings value)?  $default,){
final _that = this;
switch (_that) {
case _SleepTimerSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Duration defaultDuration,  List<Duration> presetDurations,  Duration maxDuration,  bool fadeOutAudio,  Duration fadeOutDuration,  bool autoRewindWhenStopped,  Map<int, Duration> autoRewindDurations,  bool autoTurnOnTimer,  bool alwaysAutoTurnOnTimer,  Duration autoTurnOnTime,  Duration autoTurnOffTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SleepTimerSettings() when $default != null:
return $default(_that.defaultDuration,_that.presetDurations,_that.maxDuration,_that.fadeOutAudio,_that.fadeOutDuration,_that.autoRewindWhenStopped,_that.autoRewindDurations,_that.autoTurnOnTimer,_that.alwaysAutoTurnOnTimer,_that.autoTurnOnTime,_that.autoTurnOffTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Duration defaultDuration,  List<Duration> presetDurations,  Duration maxDuration,  bool fadeOutAudio,  Duration fadeOutDuration,  bool autoRewindWhenStopped,  Map<int, Duration> autoRewindDurations,  bool autoTurnOnTimer,  bool alwaysAutoTurnOnTimer,  Duration autoTurnOnTime,  Duration autoTurnOffTime)  $default,) {final _that = this;
switch (_that) {
case _SleepTimerSettings():
return $default(_that.defaultDuration,_that.presetDurations,_that.maxDuration,_that.fadeOutAudio,_that.fadeOutDuration,_that.autoRewindWhenStopped,_that.autoRewindDurations,_that.autoTurnOnTimer,_that.alwaysAutoTurnOnTimer,_that.autoTurnOnTime,_that.autoTurnOffTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Duration defaultDuration,  List<Duration> presetDurations,  Duration maxDuration,  bool fadeOutAudio,  Duration fadeOutDuration,  bool autoRewindWhenStopped,  Map<int, Duration> autoRewindDurations,  bool autoTurnOnTimer,  bool alwaysAutoTurnOnTimer,  Duration autoTurnOnTime,  Duration autoTurnOffTime)?  $default,) {final _that = this;
switch (_that) {
case _SleepTimerSettings() when $default != null:
return $default(_that.defaultDuration,_that.presetDurations,_that.maxDuration,_that.fadeOutAudio,_that.fadeOutDuration,_that.autoRewindWhenStopped,_that.autoRewindDurations,_that.autoTurnOnTimer,_that.alwaysAutoTurnOnTimer,_that.autoTurnOnTime,_that.autoTurnOffTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SleepTimerSettings implements SleepTimerSettings {
  const _SleepTimerSettings({this.defaultDuration = const Duration(minutes: 15), final  List<Duration> presetDurations = const [Duration(minutes: 5), Duration(minutes: 10), Duration(minutes: 15), Duration(minutes: 20), Duration(minutes: 30)], this.maxDuration = const Duration(minutes: 100), this.fadeOutAudio = false, this.fadeOutDuration = const Duration(seconds: 20), this.autoRewindWhenStopped = false, final  Map<int, Duration> autoRewindDurations = const {5 : Duration(seconds: 10), 15 : Duration(seconds: 30), 45 : Duration(seconds: 45), 60 : Duration(minutes: 1), 120 : Duration(minutes: 2)}, this.autoTurnOnTimer = false, this.alwaysAutoTurnOnTimer = false, this.autoTurnOnTime = const Duration(hours: 22, minutes: 0), this.autoTurnOffTime = const Duration(hours: 6, minutes: 0)}): _presetDurations = presetDurations,_autoRewindDurations = autoRewindDurations;
  factory _SleepTimerSettings.fromJson(Map<String, dynamic> json) => _$SleepTimerSettingsFromJson(json);

@override@JsonKey() final  Duration defaultDuration;
 final  List<Duration> _presetDurations;
@override@JsonKey() List<Duration> get presetDurations {
  if (_presetDurations is EqualUnmodifiableListView) return _presetDurations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_presetDurations);
}

@override@JsonKey() final  Duration maxDuration;
@override@JsonKey() final  bool fadeOutAudio;
@override@JsonKey() final  Duration fadeOutDuration;
/// if true, the player will automatically rewind the audio when the sleep timer is stopped
@override@JsonKey() final  bool autoRewindWhenStopped;
/// the key is the duration in minutes
 final  Map<int, Duration> _autoRewindDurations;
/// the key is the duration in minutes
@override@JsonKey() Map<int, Duration> get autoRewindDurations {
  if (_autoRewindDurations is EqualUnmodifiableMapView) return _autoRewindDurations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_autoRewindDurations);
}

/// auto turn on timer settings
@override@JsonKey() final  bool autoTurnOnTimer;
/// always auto turn on timer settings or during specific times
@override@JsonKey() final  bool alwaysAutoTurnOnTimer;
/// auto timer settings, only used if [alwaysAutoTurnOnTimer] is false
///
/// duration is the time from 00:00
@override@JsonKey() final  Duration autoTurnOnTime;
@override@JsonKey() final  Duration autoTurnOffTime;

/// Create a copy of SleepTimerSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SleepTimerSettingsCopyWith<_SleepTimerSettings> get copyWith => __$SleepTimerSettingsCopyWithImpl<_SleepTimerSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SleepTimerSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SleepTimerSettings&&(identical(other.defaultDuration, defaultDuration) || other.defaultDuration == defaultDuration)&&const DeepCollectionEquality().equals(other._presetDurations, _presetDurations)&&(identical(other.maxDuration, maxDuration) || other.maxDuration == maxDuration)&&(identical(other.fadeOutAudio, fadeOutAudio) || other.fadeOutAudio == fadeOutAudio)&&(identical(other.fadeOutDuration, fadeOutDuration) || other.fadeOutDuration == fadeOutDuration)&&(identical(other.autoRewindWhenStopped, autoRewindWhenStopped) || other.autoRewindWhenStopped == autoRewindWhenStopped)&&const DeepCollectionEquality().equals(other._autoRewindDurations, _autoRewindDurations)&&(identical(other.autoTurnOnTimer, autoTurnOnTimer) || other.autoTurnOnTimer == autoTurnOnTimer)&&(identical(other.alwaysAutoTurnOnTimer, alwaysAutoTurnOnTimer) || other.alwaysAutoTurnOnTimer == alwaysAutoTurnOnTimer)&&(identical(other.autoTurnOnTime, autoTurnOnTime) || other.autoTurnOnTime == autoTurnOnTime)&&(identical(other.autoTurnOffTime, autoTurnOffTime) || other.autoTurnOffTime == autoTurnOffTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,defaultDuration,const DeepCollectionEquality().hash(_presetDurations),maxDuration,fadeOutAudio,fadeOutDuration,autoRewindWhenStopped,const DeepCollectionEquality().hash(_autoRewindDurations),autoTurnOnTimer,alwaysAutoTurnOnTimer,autoTurnOnTime,autoTurnOffTime);

@override
String toString() {
  return 'SleepTimerSettings(defaultDuration: $defaultDuration, presetDurations: $presetDurations, maxDuration: $maxDuration, fadeOutAudio: $fadeOutAudio, fadeOutDuration: $fadeOutDuration, autoRewindWhenStopped: $autoRewindWhenStopped, autoRewindDurations: $autoRewindDurations, autoTurnOnTimer: $autoTurnOnTimer, alwaysAutoTurnOnTimer: $alwaysAutoTurnOnTimer, autoTurnOnTime: $autoTurnOnTime, autoTurnOffTime: $autoTurnOffTime)';
}


}

/// @nodoc
abstract mixin class _$SleepTimerSettingsCopyWith<$Res> implements $SleepTimerSettingsCopyWith<$Res> {
  factory _$SleepTimerSettingsCopyWith(_SleepTimerSettings value, $Res Function(_SleepTimerSettings) _then) = __$SleepTimerSettingsCopyWithImpl;
@override @useResult
$Res call({
 Duration defaultDuration, List<Duration> presetDurations, Duration maxDuration, bool fadeOutAudio, Duration fadeOutDuration, bool autoRewindWhenStopped, Map<int, Duration> autoRewindDurations, bool autoTurnOnTimer, bool alwaysAutoTurnOnTimer, Duration autoTurnOnTime, Duration autoTurnOffTime
});




}
/// @nodoc
class __$SleepTimerSettingsCopyWithImpl<$Res>
    implements _$SleepTimerSettingsCopyWith<$Res> {
  __$SleepTimerSettingsCopyWithImpl(this._self, this._then);

  final _SleepTimerSettings _self;
  final $Res Function(_SleepTimerSettings) _then;

/// Create a copy of SleepTimerSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? defaultDuration = null,Object? presetDurations = null,Object? maxDuration = null,Object? fadeOutAudio = null,Object? fadeOutDuration = null,Object? autoRewindWhenStopped = null,Object? autoRewindDurations = null,Object? autoTurnOnTimer = null,Object? alwaysAutoTurnOnTimer = null,Object? autoTurnOnTime = null,Object? autoTurnOffTime = null,}) {
  return _then(_SleepTimerSettings(
defaultDuration: null == defaultDuration ? _self.defaultDuration : defaultDuration // ignore: cast_nullable_to_non_nullable
as Duration,presetDurations: null == presetDurations ? _self._presetDurations : presetDurations // ignore: cast_nullable_to_non_nullable
as List<Duration>,maxDuration: null == maxDuration ? _self.maxDuration : maxDuration // ignore: cast_nullable_to_non_nullable
as Duration,fadeOutAudio: null == fadeOutAudio ? _self.fadeOutAudio : fadeOutAudio // ignore: cast_nullable_to_non_nullable
as bool,fadeOutDuration: null == fadeOutDuration ? _self.fadeOutDuration : fadeOutDuration // ignore: cast_nullable_to_non_nullable
as Duration,autoRewindWhenStopped: null == autoRewindWhenStopped ? _self.autoRewindWhenStopped : autoRewindWhenStopped // ignore: cast_nullable_to_non_nullable
as bool,autoRewindDurations: null == autoRewindDurations ? _self._autoRewindDurations : autoRewindDurations // ignore: cast_nullable_to_non_nullable
as Map<int, Duration>,autoTurnOnTimer: null == autoTurnOnTimer ? _self.autoTurnOnTimer : autoTurnOnTimer // ignore: cast_nullable_to_non_nullable
as bool,alwaysAutoTurnOnTimer: null == alwaysAutoTurnOnTimer ? _self.alwaysAutoTurnOnTimer : alwaysAutoTurnOnTimer // ignore: cast_nullable_to_non_nullable
as bool,autoTurnOnTime: null == autoTurnOnTime ? _self.autoTurnOnTime : autoTurnOnTime // ignore: cast_nullable_to_non_nullable
as Duration,autoTurnOffTime: null == autoTurnOffTime ? _self.autoTurnOffTime : autoTurnOffTime // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}


/// @nodoc
mixin _$DownloadSettings {

 bool get requiresWiFi; int get retries; bool get allowPause; int get maxConcurrent; int get maxConcurrentByHost; int get maxConcurrentByGroup;
/// Create a copy of DownloadSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadSettingsCopyWith<DownloadSettings> get copyWith => _$DownloadSettingsCopyWithImpl<DownloadSettings>(this as DownloadSettings, _$identity);

  /// Serializes this DownloadSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadSettings&&(identical(other.requiresWiFi, requiresWiFi) || other.requiresWiFi == requiresWiFi)&&(identical(other.retries, retries) || other.retries == retries)&&(identical(other.allowPause, allowPause) || other.allowPause == allowPause)&&(identical(other.maxConcurrent, maxConcurrent) || other.maxConcurrent == maxConcurrent)&&(identical(other.maxConcurrentByHost, maxConcurrentByHost) || other.maxConcurrentByHost == maxConcurrentByHost)&&(identical(other.maxConcurrentByGroup, maxConcurrentByGroup) || other.maxConcurrentByGroup == maxConcurrentByGroup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requiresWiFi,retries,allowPause,maxConcurrent,maxConcurrentByHost,maxConcurrentByGroup);

@override
String toString() {
  return 'DownloadSettings(requiresWiFi: $requiresWiFi, retries: $retries, allowPause: $allowPause, maxConcurrent: $maxConcurrent, maxConcurrentByHost: $maxConcurrentByHost, maxConcurrentByGroup: $maxConcurrentByGroup)';
}


}

/// @nodoc
abstract mixin class $DownloadSettingsCopyWith<$Res>  {
  factory $DownloadSettingsCopyWith(DownloadSettings value, $Res Function(DownloadSettings) _then) = _$DownloadSettingsCopyWithImpl;
@useResult
$Res call({
 bool requiresWiFi, int retries, bool allowPause, int maxConcurrent, int maxConcurrentByHost, int maxConcurrentByGroup
});




}
/// @nodoc
class _$DownloadSettingsCopyWithImpl<$Res>
    implements $DownloadSettingsCopyWith<$Res> {
  _$DownloadSettingsCopyWithImpl(this._self, this._then);

  final DownloadSettings _self;
  final $Res Function(DownloadSettings) _then;

/// Create a copy of DownloadSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requiresWiFi = null,Object? retries = null,Object? allowPause = null,Object? maxConcurrent = null,Object? maxConcurrentByHost = null,Object? maxConcurrentByGroup = null,}) {
  return _then(_self.copyWith(
requiresWiFi: null == requiresWiFi ? _self.requiresWiFi : requiresWiFi // ignore: cast_nullable_to_non_nullable
as bool,retries: null == retries ? _self.retries : retries // ignore: cast_nullable_to_non_nullable
as int,allowPause: null == allowPause ? _self.allowPause : allowPause // ignore: cast_nullable_to_non_nullable
as bool,maxConcurrent: null == maxConcurrent ? _self.maxConcurrent : maxConcurrent // ignore: cast_nullable_to_non_nullable
as int,maxConcurrentByHost: null == maxConcurrentByHost ? _self.maxConcurrentByHost : maxConcurrentByHost // ignore: cast_nullable_to_non_nullable
as int,maxConcurrentByGroup: null == maxConcurrentByGroup ? _self.maxConcurrentByGroup : maxConcurrentByGroup // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DownloadSettings].
extension DownloadSettingsPatterns on DownloadSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloadSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloadSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloadSettings value)  $default,){
final _that = this;
switch (_that) {
case _DownloadSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloadSettings value)?  $default,){
final _that = this;
switch (_that) {
case _DownloadSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool requiresWiFi,  int retries,  bool allowPause,  int maxConcurrent,  int maxConcurrentByHost,  int maxConcurrentByGroup)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadSettings() when $default != null:
return $default(_that.requiresWiFi,_that.retries,_that.allowPause,_that.maxConcurrent,_that.maxConcurrentByHost,_that.maxConcurrentByGroup);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool requiresWiFi,  int retries,  bool allowPause,  int maxConcurrent,  int maxConcurrentByHost,  int maxConcurrentByGroup)  $default,) {final _that = this;
switch (_that) {
case _DownloadSettings():
return $default(_that.requiresWiFi,_that.retries,_that.allowPause,_that.maxConcurrent,_that.maxConcurrentByHost,_that.maxConcurrentByGroup);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool requiresWiFi,  int retries,  bool allowPause,  int maxConcurrent,  int maxConcurrentByHost,  int maxConcurrentByGroup)?  $default,) {final _that = this;
switch (_that) {
case _DownloadSettings() when $default != null:
return $default(_that.requiresWiFi,_that.retries,_that.allowPause,_that.maxConcurrent,_that.maxConcurrentByHost,_that.maxConcurrentByGroup);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DownloadSettings implements DownloadSettings {
  const _DownloadSettings({this.requiresWiFi = true, this.retries = 3, this.allowPause = true, this.maxConcurrent = 3, this.maxConcurrentByHost = 3, this.maxConcurrentByGroup = 3});
  factory _DownloadSettings.fromJson(Map<String, dynamic> json) => _$DownloadSettingsFromJson(json);

@override@JsonKey() final  bool requiresWiFi;
@override@JsonKey() final  int retries;
@override@JsonKey() final  bool allowPause;
@override@JsonKey() final  int maxConcurrent;
@override@JsonKey() final  int maxConcurrentByHost;
@override@JsonKey() final  int maxConcurrentByGroup;

/// Create a copy of DownloadSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadSettingsCopyWith<_DownloadSettings> get copyWith => __$DownloadSettingsCopyWithImpl<_DownloadSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DownloadSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadSettings&&(identical(other.requiresWiFi, requiresWiFi) || other.requiresWiFi == requiresWiFi)&&(identical(other.retries, retries) || other.retries == retries)&&(identical(other.allowPause, allowPause) || other.allowPause == allowPause)&&(identical(other.maxConcurrent, maxConcurrent) || other.maxConcurrent == maxConcurrent)&&(identical(other.maxConcurrentByHost, maxConcurrentByHost) || other.maxConcurrentByHost == maxConcurrentByHost)&&(identical(other.maxConcurrentByGroup, maxConcurrentByGroup) || other.maxConcurrentByGroup == maxConcurrentByGroup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requiresWiFi,retries,allowPause,maxConcurrent,maxConcurrentByHost,maxConcurrentByGroup);

@override
String toString() {
  return 'DownloadSettings(requiresWiFi: $requiresWiFi, retries: $retries, allowPause: $allowPause, maxConcurrent: $maxConcurrent, maxConcurrentByHost: $maxConcurrentByHost, maxConcurrentByGroup: $maxConcurrentByGroup)';
}


}

/// @nodoc
abstract mixin class _$DownloadSettingsCopyWith<$Res> implements $DownloadSettingsCopyWith<$Res> {
  factory _$DownloadSettingsCopyWith(_DownloadSettings value, $Res Function(_DownloadSettings) _then) = __$DownloadSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool requiresWiFi, int retries, bool allowPause, int maxConcurrent, int maxConcurrentByHost, int maxConcurrentByGroup
});




}
/// @nodoc
class __$DownloadSettingsCopyWithImpl<$Res>
    implements _$DownloadSettingsCopyWith<$Res> {
  __$DownloadSettingsCopyWithImpl(this._self, this._then);

  final _DownloadSettings _self;
  final $Res Function(_DownloadSettings) _then;

/// Create a copy of DownloadSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requiresWiFi = null,Object? retries = null,Object? allowPause = null,Object? maxConcurrent = null,Object? maxConcurrentByHost = null,Object? maxConcurrentByGroup = null,}) {
  return _then(_DownloadSettings(
requiresWiFi: null == requiresWiFi ? _self.requiresWiFi : requiresWiFi // ignore: cast_nullable_to_non_nullable
as bool,retries: null == retries ? _self.retries : retries // ignore: cast_nullable_to_non_nullable
as int,allowPause: null == allowPause ? _self.allowPause : allowPause // ignore: cast_nullable_to_non_nullable
as bool,maxConcurrent: null == maxConcurrent ? _self.maxConcurrent : maxConcurrent // ignore: cast_nullable_to_non_nullable
as int,maxConcurrentByHost: null == maxConcurrentByHost ? _self.maxConcurrentByHost : maxConcurrentByHost // ignore: cast_nullable_to_non_nullable
as int,maxConcurrentByGroup: null == maxConcurrentByGroup ? _self.maxConcurrentByGroup : maxConcurrentByGroup // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$NotificationSettings {

 Duration get fastForwardInterval; Duration get rewindInterval; bool get progressBarIsChapterProgress; String get primaryTitle; String get secondaryTitle; List<NotificationMediaControl> get mediaControls;
/// Create a copy of NotificationSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationSettingsCopyWith<NotificationSettings> get copyWith => _$NotificationSettingsCopyWithImpl<NotificationSettings>(this as NotificationSettings, _$identity);

  /// Serializes this NotificationSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationSettings&&(identical(other.fastForwardInterval, fastForwardInterval) || other.fastForwardInterval == fastForwardInterval)&&(identical(other.rewindInterval, rewindInterval) || other.rewindInterval == rewindInterval)&&(identical(other.progressBarIsChapterProgress, progressBarIsChapterProgress) || other.progressBarIsChapterProgress == progressBarIsChapterProgress)&&(identical(other.primaryTitle, primaryTitle) || other.primaryTitle == primaryTitle)&&(identical(other.secondaryTitle, secondaryTitle) || other.secondaryTitle == secondaryTitle)&&const DeepCollectionEquality().equals(other.mediaControls, mediaControls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fastForwardInterval,rewindInterval,progressBarIsChapterProgress,primaryTitle,secondaryTitle,const DeepCollectionEquality().hash(mediaControls));

@override
String toString() {
  return 'NotificationSettings(fastForwardInterval: $fastForwardInterval, rewindInterval: $rewindInterval, progressBarIsChapterProgress: $progressBarIsChapterProgress, primaryTitle: $primaryTitle, secondaryTitle: $secondaryTitle, mediaControls: $mediaControls)';
}


}

/// @nodoc
abstract mixin class $NotificationSettingsCopyWith<$Res>  {
  factory $NotificationSettingsCopyWith(NotificationSettings value, $Res Function(NotificationSettings) _then) = _$NotificationSettingsCopyWithImpl;
@useResult
$Res call({
 Duration fastForwardInterval, Duration rewindInterval, bool progressBarIsChapterProgress, String primaryTitle, String secondaryTitle, List<NotificationMediaControl> mediaControls
});




}
/// @nodoc
class _$NotificationSettingsCopyWithImpl<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._self, this._then);

  final NotificationSettings _self;
  final $Res Function(NotificationSettings) _then;

/// Create a copy of NotificationSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fastForwardInterval = null,Object? rewindInterval = null,Object? progressBarIsChapterProgress = null,Object? primaryTitle = null,Object? secondaryTitle = null,Object? mediaControls = null,}) {
  return _then(_self.copyWith(
fastForwardInterval: null == fastForwardInterval ? _self.fastForwardInterval : fastForwardInterval // ignore: cast_nullable_to_non_nullable
as Duration,rewindInterval: null == rewindInterval ? _self.rewindInterval : rewindInterval // ignore: cast_nullable_to_non_nullable
as Duration,progressBarIsChapterProgress: null == progressBarIsChapterProgress ? _self.progressBarIsChapterProgress : progressBarIsChapterProgress // ignore: cast_nullable_to_non_nullable
as bool,primaryTitle: null == primaryTitle ? _self.primaryTitle : primaryTitle // ignore: cast_nullable_to_non_nullable
as String,secondaryTitle: null == secondaryTitle ? _self.secondaryTitle : secondaryTitle // ignore: cast_nullable_to_non_nullable
as String,mediaControls: null == mediaControls ? _self.mediaControls : mediaControls // ignore: cast_nullable_to_non_nullable
as List<NotificationMediaControl>,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationSettings].
extension NotificationSettingsPatterns on NotificationSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationSettings value)  $default,){
final _that = this;
switch (_that) {
case _NotificationSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationSettings value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Duration fastForwardInterval,  Duration rewindInterval,  bool progressBarIsChapterProgress,  String primaryTitle,  String secondaryTitle,  List<NotificationMediaControl> mediaControls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationSettings() when $default != null:
return $default(_that.fastForwardInterval,_that.rewindInterval,_that.progressBarIsChapterProgress,_that.primaryTitle,_that.secondaryTitle,_that.mediaControls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Duration fastForwardInterval,  Duration rewindInterval,  bool progressBarIsChapterProgress,  String primaryTitle,  String secondaryTitle,  List<NotificationMediaControl> mediaControls)  $default,) {final _that = this;
switch (_that) {
case _NotificationSettings():
return $default(_that.fastForwardInterval,_that.rewindInterval,_that.progressBarIsChapterProgress,_that.primaryTitle,_that.secondaryTitle,_that.mediaControls);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Duration fastForwardInterval,  Duration rewindInterval,  bool progressBarIsChapterProgress,  String primaryTitle,  String secondaryTitle,  List<NotificationMediaControl> mediaControls)?  $default,) {final _that = this;
switch (_that) {
case _NotificationSettings() when $default != null:
return $default(_that.fastForwardInterval,_that.rewindInterval,_that.progressBarIsChapterProgress,_that.primaryTitle,_that.secondaryTitle,_that.mediaControls);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationSettings implements NotificationSettings {
  const _NotificationSettings({this.fastForwardInterval = const Duration(seconds: 30), this.rewindInterval = const Duration(seconds: 10), this.progressBarIsChapterProgress = true, this.primaryTitle = '\$bookTitle', this.secondaryTitle = '\$author', final  List<NotificationMediaControl> mediaControls = const [NotificationMediaControl.rewind, NotificationMediaControl.fastForward, NotificationMediaControl.skipToPreviousChapter, NotificationMediaControl.skipToNextChapter]}): _mediaControls = mediaControls;
  factory _NotificationSettings.fromJson(Map<String, dynamic> json) => _$NotificationSettingsFromJson(json);

@override@JsonKey() final  Duration fastForwardInterval;
@override@JsonKey() final  Duration rewindInterval;
@override@JsonKey() final  bool progressBarIsChapterProgress;
@override@JsonKey() final  String primaryTitle;
@override@JsonKey() final  String secondaryTitle;
 final  List<NotificationMediaControl> _mediaControls;
@override@JsonKey() List<NotificationMediaControl> get mediaControls {
  if (_mediaControls is EqualUnmodifiableListView) return _mediaControls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaControls);
}


/// Create a copy of NotificationSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationSettingsCopyWith<_NotificationSettings> get copyWith => __$NotificationSettingsCopyWithImpl<_NotificationSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationSettings&&(identical(other.fastForwardInterval, fastForwardInterval) || other.fastForwardInterval == fastForwardInterval)&&(identical(other.rewindInterval, rewindInterval) || other.rewindInterval == rewindInterval)&&(identical(other.progressBarIsChapterProgress, progressBarIsChapterProgress) || other.progressBarIsChapterProgress == progressBarIsChapterProgress)&&(identical(other.primaryTitle, primaryTitle) || other.primaryTitle == primaryTitle)&&(identical(other.secondaryTitle, secondaryTitle) || other.secondaryTitle == secondaryTitle)&&const DeepCollectionEquality().equals(other._mediaControls, _mediaControls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fastForwardInterval,rewindInterval,progressBarIsChapterProgress,primaryTitle,secondaryTitle,const DeepCollectionEquality().hash(_mediaControls));

@override
String toString() {
  return 'NotificationSettings(fastForwardInterval: $fastForwardInterval, rewindInterval: $rewindInterval, progressBarIsChapterProgress: $progressBarIsChapterProgress, primaryTitle: $primaryTitle, secondaryTitle: $secondaryTitle, mediaControls: $mediaControls)';
}


}

/// @nodoc
abstract mixin class _$NotificationSettingsCopyWith<$Res> implements $NotificationSettingsCopyWith<$Res> {
  factory _$NotificationSettingsCopyWith(_NotificationSettings value, $Res Function(_NotificationSettings) _then) = __$NotificationSettingsCopyWithImpl;
@override @useResult
$Res call({
 Duration fastForwardInterval, Duration rewindInterval, bool progressBarIsChapterProgress, String primaryTitle, String secondaryTitle, List<NotificationMediaControl> mediaControls
});




}
/// @nodoc
class __$NotificationSettingsCopyWithImpl<$Res>
    implements _$NotificationSettingsCopyWith<$Res> {
  __$NotificationSettingsCopyWithImpl(this._self, this._then);

  final _NotificationSettings _self;
  final $Res Function(_NotificationSettings) _then;

/// Create a copy of NotificationSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fastForwardInterval = null,Object? rewindInterval = null,Object? progressBarIsChapterProgress = null,Object? primaryTitle = null,Object? secondaryTitle = null,Object? mediaControls = null,}) {
  return _then(_NotificationSettings(
fastForwardInterval: null == fastForwardInterval ? _self.fastForwardInterval : fastForwardInterval // ignore: cast_nullable_to_non_nullable
as Duration,rewindInterval: null == rewindInterval ? _self.rewindInterval : rewindInterval // ignore: cast_nullable_to_non_nullable
as Duration,progressBarIsChapterProgress: null == progressBarIsChapterProgress ? _self.progressBarIsChapterProgress : progressBarIsChapterProgress // ignore: cast_nullable_to_non_nullable
as bool,primaryTitle: null == primaryTitle ? _self.primaryTitle : primaryTitle // ignore: cast_nullable_to_non_nullable
as String,secondaryTitle: null == secondaryTitle ? _self.secondaryTitle : secondaryTitle // ignore: cast_nullable_to_non_nullable
as String,mediaControls: null == mediaControls ? _self._mediaControls : mediaControls // ignore: cast_nullable_to_non_nullable
as List<NotificationMediaControl>,
  ));
}


}


/// @nodoc
mixin _$ShakeDetectionSettings {

 bool get isEnabled; ShakeDirection get direction; double get threshold; ShakeAction get shakeAction; Set<ShakeDetectedFeedback> get feedback; double get beepVolume;/// the duration to wait before the shake detection is enabled again
 Duration get shakeTriggerCoolDown;/// the number of shakes required to trigger the action
 int get shakeTriggerCount;/// acceleration sampling interval
 Duration get samplingPeriod;
/// Create a copy of ShakeDetectionSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShakeDetectionSettingsCopyWith<ShakeDetectionSettings> get copyWith => _$ShakeDetectionSettingsCopyWithImpl<ShakeDetectionSettings>(this as ShakeDetectionSettings, _$identity);

  /// Serializes this ShakeDetectionSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShakeDetectionSettings&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.shakeAction, shakeAction) || other.shakeAction == shakeAction)&&const DeepCollectionEquality().equals(other.feedback, feedback)&&(identical(other.beepVolume, beepVolume) || other.beepVolume == beepVolume)&&(identical(other.shakeTriggerCoolDown, shakeTriggerCoolDown) || other.shakeTriggerCoolDown == shakeTriggerCoolDown)&&(identical(other.shakeTriggerCount, shakeTriggerCount) || other.shakeTriggerCount == shakeTriggerCount)&&(identical(other.samplingPeriod, samplingPeriod) || other.samplingPeriod == samplingPeriod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isEnabled,direction,threshold,shakeAction,const DeepCollectionEquality().hash(feedback),beepVolume,shakeTriggerCoolDown,shakeTriggerCount,samplingPeriod);

@override
String toString() {
  return 'ShakeDetectionSettings(isEnabled: $isEnabled, direction: $direction, threshold: $threshold, shakeAction: $shakeAction, feedback: $feedback, beepVolume: $beepVolume, shakeTriggerCoolDown: $shakeTriggerCoolDown, shakeTriggerCount: $shakeTriggerCount, samplingPeriod: $samplingPeriod)';
}


}

/// @nodoc
abstract mixin class $ShakeDetectionSettingsCopyWith<$Res>  {
  factory $ShakeDetectionSettingsCopyWith(ShakeDetectionSettings value, $Res Function(ShakeDetectionSettings) _then) = _$ShakeDetectionSettingsCopyWithImpl;
@useResult
$Res call({
 bool isEnabled, ShakeDirection direction, double threshold, ShakeAction shakeAction, Set<ShakeDetectedFeedback> feedback, double beepVolume, Duration shakeTriggerCoolDown, int shakeTriggerCount, Duration samplingPeriod
});




}
/// @nodoc
class _$ShakeDetectionSettingsCopyWithImpl<$Res>
    implements $ShakeDetectionSettingsCopyWith<$Res> {
  _$ShakeDetectionSettingsCopyWithImpl(this._self, this._then);

  final ShakeDetectionSettings _self;
  final $Res Function(ShakeDetectionSettings) _then;

/// Create a copy of ShakeDetectionSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isEnabled = null,Object? direction = null,Object? threshold = null,Object? shakeAction = null,Object? feedback = null,Object? beepVolume = null,Object? shakeTriggerCoolDown = null,Object? shakeTriggerCount = null,Object? samplingPeriod = null,}) {
  return _then(_self.copyWith(
isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as ShakeDirection,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,shakeAction: null == shakeAction ? _self.shakeAction : shakeAction // ignore: cast_nullable_to_non_nullable
as ShakeAction,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as Set<ShakeDetectedFeedback>,beepVolume: null == beepVolume ? _self.beepVolume : beepVolume // ignore: cast_nullable_to_non_nullable
as double,shakeTriggerCoolDown: null == shakeTriggerCoolDown ? _self.shakeTriggerCoolDown : shakeTriggerCoolDown // ignore: cast_nullable_to_non_nullable
as Duration,shakeTriggerCount: null == shakeTriggerCount ? _self.shakeTriggerCount : shakeTriggerCount // ignore: cast_nullable_to_non_nullable
as int,samplingPeriod: null == samplingPeriod ? _self.samplingPeriod : samplingPeriod // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [ShakeDetectionSettings].
extension ShakeDetectionSettingsPatterns on ShakeDetectionSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShakeDetectionSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShakeDetectionSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShakeDetectionSettings value)  $default,){
final _that = this;
switch (_that) {
case _ShakeDetectionSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShakeDetectionSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ShakeDetectionSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isEnabled,  ShakeDirection direction,  double threshold,  ShakeAction shakeAction,  Set<ShakeDetectedFeedback> feedback,  double beepVolume,  Duration shakeTriggerCoolDown,  int shakeTriggerCount,  Duration samplingPeriod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShakeDetectionSettings() when $default != null:
return $default(_that.isEnabled,_that.direction,_that.threshold,_that.shakeAction,_that.feedback,_that.beepVolume,_that.shakeTriggerCoolDown,_that.shakeTriggerCount,_that.samplingPeriod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isEnabled,  ShakeDirection direction,  double threshold,  ShakeAction shakeAction,  Set<ShakeDetectedFeedback> feedback,  double beepVolume,  Duration shakeTriggerCoolDown,  int shakeTriggerCount,  Duration samplingPeriod)  $default,) {final _that = this;
switch (_that) {
case _ShakeDetectionSettings():
return $default(_that.isEnabled,_that.direction,_that.threshold,_that.shakeAction,_that.feedback,_that.beepVolume,_that.shakeTriggerCoolDown,_that.shakeTriggerCount,_that.samplingPeriod);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isEnabled,  ShakeDirection direction,  double threshold,  ShakeAction shakeAction,  Set<ShakeDetectedFeedback> feedback,  double beepVolume,  Duration shakeTriggerCoolDown,  int shakeTriggerCount,  Duration samplingPeriod)?  $default,) {final _that = this;
switch (_that) {
case _ShakeDetectionSettings() when $default != null:
return $default(_that.isEnabled,_that.direction,_that.threshold,_that.shakeAction,_that.feedback,_that.beepVolume,_that.shakeTriggerCoolDown,_that.shakeTriggerCount,_that.samplingPeriod);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShakeDetectionSettings implements ShakeDetectionSettings {
  const _ShakeDetectionSettings({this.isEnabled = true, this.direction = ShakeDirection.horizontal, this.threshold = 5, this.shakeAction = ShakeAction.resetSleepTimer, final  Set<ShakeDetectedFeedback> feedback = const {ShakeDetectedFeedback.vibrate}, this.beepVolume = 0.5, this.shakeTriggerCoolDown = const Duration(seconds: 2), this.shakeTriggerCount = 2, this.samplingPeriod = const Duration(milliseconds: 100)}): _feedback = feedback;
  factory _ShakeDetectionSettings.fromJson(Map<String, dynamic> json) => _$ShakeDetectionSettingsFromJson(json);

@override@JsonKey() final  bool isEnabled;
@override@JsonKey() final  ShakeDirection direction;
@override@JsonKey() final  double threshold;
@override@JsonKey() final  ShakeAction shakeAction;
 final  Set<ShakeDetectedFeedback> _feedback;
@override@JsonKey() Set<ShakeDetectedFeedback> get feedback {
  if (_feedback is EqualUnmodifiableSetView) return _feedback;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_feedback);
}

@override@JsonKey() final  double beepVolume;
/// the duration to wait before the shake detection is enabled again
@override@JsonKey() final  Duration shakeTriggerCoolDown;
/// the number of shakes required to trigger the action
@override@JsonKey() final  int shakeTriggerCount;
/// acceleration sampling interval
@override@JsonKey() final  Duration samplingPeriod;

/// Create a copy of ShakeDetectionSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShakeDetectionSettingsCopyWith<_ShakeDetectionSettings> get copyWith => __$ShakeDetectionSettingsCopyWithImpl<_ShakeDetectionSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShakeDetectionSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShakeDetectionSettings&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.shakeAction, shakeAction) || other.shakeAction == shakeAction)&&const DeepCollectionEquality().equals(other._feedback, _feedback)&&(identical(other.beepVolume, beepVolume) || other.beepVolume == beepVolume)&&(identical(other.shakeTriggerCoolDown, shakeTriggerCoolDown) || other.shakeTriggerCoolDown == shakeTriggerCoolDown)&&(identical(other.shakeTriggerCount, shakeTriggerCount) || other.shakeTriggerCount == shakeTriggerCount)&&(identical(other.samplingPeriod, samplingPeriod) || other.samplingPeriod == samplingPeriod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isEnabled,direction,threshold,shakeAction,const DeepCollectionEquality().hash(_feedback),beepVolume,shakeTriggerCoolDown,shakeTriggerCount,samplingPeriod);

@override
String toString() {
  return 'ShakeDetectionSettings(isEnabled: $isEnabled, direction: $direction, threshold: $threshold, shakeAction: $shakeAction, feedback: $feedback, beepVolume: $beepVolume, shakeTriggerCoolDown: $shakeTriggerCoolDown, shakeTriggerCount: $shakeTriggerCount, samplingPeriod: $samplingPeriod)';
}


}

/// @nodoc
abstract mixin class _$ShakeDetectionSettingsCopyWith<$Res> implements $ShakeDetectionSettingsCopyWith<$Res> {
  factory _$ShakeDetectionSettingsCopyWith(_ShakeDetectionSettings value, $Res Function(_ShakeDetectionSettings) _then) = __$ShakeDetectionSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool isEnabled, ShakeDirection direction, double threshold, ShakeAction shakeAction, Set<ShakeDetectedFeedback> feedback, double beepVolume, Duration shakeTriggerCoolDown, int shakeTriggerCount, Duration samplingPeriod
});




}
/// @nodoc
class __$ShakeDetectionSettingsCopyWithImpl<$Res>
    implements _$ShakeDetectionSettingsCopyWith<$Res> {
  __$ShakeDetectionSettingsCopyWithImpl(this._self, this._then);

  final _ShakeDetectionSettings _self;
  final $Res Function(_ShakeDetectionSettings) _then;

/// Create a copy of ShakeDetectionSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isEnabled = null,Object? direction = null,Object? threshold = null,Object? shakeAction = null,Object? feedback = null,Object? beepVolume = null,Object? shakeTriggerCoolDown = null,Object? shakeTriggerCount = null,Object? samplingPeriod = null,}) {
  return _then(_ShakeDetectionSettings(
isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as ShakeDirection,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,shakeAction: null == shakeAction ? _self.shakeAction : shakeAction // ignore: cast_nullable_to_non_nullable
as ShakeAction,feedback: null == feedback ? _self._feedback : feedback // ignore: cast_nullable_to_non_nullable
as Set<ShakeDetectedFeedback>,beepVolume: null == beepVolume ? _self.beepVolume : beepVolume // ignore: cast_nullable_to_non_nullable
as double,shakeTriggerCoolDown: null == shakeTriggerCoolDown ? _self.shakeTriggerCoolDown : shakeTriggerCoolDown // ignore: cast_nullable_to_non_nullable
as Duration,shakeTriggerCount: null == shakeTriggerCount ? _self.shakeTriggerCount : shakeTriggerCount // ignore: cast_nullable_to_non_nullable
as int,samplingPeriod: null == samplingPeriod ? _self.samplingPeriod : samplingPeriod // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}


/// @nodoc
mixin _$HomePageSettings {

 bool get showPlayButtonOnContinueListeningShelf; bool get showPlayButtonOnContinueSeriesShelf; bool get showPlayButtonOnAllRemainingShelves; bool get showPlayButtonOnListenAgainShelf;
/// Create a copy of HomePageSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomePageSettingsCopyWith<HomePageSettings> get copyWith => _$HomePageSettingsCopyWithImpl<HomePageSettings>(this as HomePageSettings, _$identity);

  /// Serializes this HomePageSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePageSettings&&(identical(other.showPlayButtonOnContinueListeningShelf, showPlayButtonOnContinueListeningShelf) || other.showPlayButtonOnContinueListeningShelf == showPlayButtonOnContinueListeningShelf)&&(identical(other.showPlayButtonOnContinueSeriesShelf, showPlayButtonOnContinueSeriesShelf) || other.showPlayButtonOnContinueSeriesShelf == showPlayButtonOnContinueSeriesShelf)&&(identical(other.showPlayButtonOnAllRemainingShelves, showPlayButtonOnAllRemainingShelves) || other.showPlayButtonOnAllRemainingShelves == showPlayButtonOnAllRemainingShelves)&&(identical(other.showPlayButtonOnListenAgainShelf, showPlayButtonOnListenAgainShelf) || other.showPlayButtonOnListenAgainShelf == showPlayButtonOnListenAgainShelf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showPlayButtonOnContinueListeningShelf,showPlayButtonOnContinueSeriesShelf,showPlayButtonOnAllRemainingShelves,showPlayButtonOnListenAgainShelf);

@override
String toString() {
  return 'HomePageSettings(showPlayButtonOnContinueListeningShelf: $showPlayButtonOnContinueListeningShelf, showPlayButtonOnContinueSeriesShelf: $showPlayButtonOnContinueSeriesShelf, showPlayButtonOnAllRemainingShelves: $showPlayButtonOnAllRemainingShelves, showPlayButtonOnListenAgainShelf: $showPlayButtonOnListenAgainShelf)';
}


}

/// @nodoc
abstract mixin class $HomePageSettingsCopyWith<$Res>  {
  factory $HomePageSettingsCopyWith(HomePageSettings value, $Res Function(HomePageSettings) _then) = _$HomePageSettingsCopyWithImpl;
@useResult
$Res call({
 bool showPlayButtonOnContinueListeningShelf, bool showPlayButtonOnContinueSeriesShelf, bool showPlayButtonOnAllRemainingShelves, bool showPlayButtonOnListenAgainShelf
});




}
/// @nodoc
class _$HomePageSettingsCopyWithImpl<$Res>
    implements $HomePageSettingsCopyWith<$Res> {
  _$HomePageSettingsCopyWithImpl(this._self, this._then);

  final HomePageSettings _self;
  final $Res Function(HomePageSettings) _then;

/// Create a copy of HomePageSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showPlayButtonOnContinueListeningShelf = null,Object? showPlayButtonOnContinueSeriesShelf = null,Object? showPlayButtonOnAllRemainingShelves = null,Object? showPlayButtonOnListenAgainShelf = null,}) {
  return _then(_self.copyWith(
showPlayButtonOnContinueListeningShelf: null == showPlayButtonOnContinueListeningShelf ? _self.showPlayButtonOnContinueListeningShelf : showPlayButtonOnContinueListeningShelf // ignore: cast_nullable_to_non_nullable
as bool,showPlayButtonOnContinueSeriesShelf: null == showPlayButtonOnContinueSeriesShelf ? _self.showPlayButtonOnContinueSeriesShelf : showPlayButtonOnContinueSeriesShelf // ignore: cast_nullable_to_non_nullable
as bool,showPlayButtonOnAllRemainingShelves: null == showPlayButtonOnAllRemainingShelves ? _self.showPlayButtonOnAllRemainingShelves : showPlayButtonOnAllRemainingShelves // ignore: cast_nullable_to_non_nullable
as bool,showPlayButtonOnListenAgainShelf: null == showPlayButtonOnListenAgainShelf ? _self.showPlayButtonOnListenAgainShelf : showPlayButtonOnListenAgainShelf // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HomePageSettings].
extension HomePageSettingsPatterns on HomePageSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomePageSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomePageSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomePageSettings value)  $default,){
final _that = this;
switch (_that) {
case _HomePageSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomePageSettings value)?  $default,){
final _that = this;
switch (_that) {
case _HomePageSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showPlayButtonOnContinueListeningShelf,  bool showPlayButtonOnContinueSeriesShelf,  bool showPlayButtonOnAllRemainingShelves,  bool showPlayButtonOnListenAgainShelf)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomePageSettings() when $default != null:
return $default(_that.showPlayButtonOnContinueListeningShelf,_that.showPlayButtonOnContinueSeriesShelf,_that.showPlayButtonOnAllRemainingShelves,_that.showPlayButtonOnListenAgainShelf);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showPlayButtonOnContinueListeningShelf,  bool showPlayButtonOnContinueSeriesShelf,  bool showPlayButtonOnAllRemainingShelves,  bool showPlayButtonOnListenAgainShelf)  $default,) {final _that = this;
switch (_that) {
case _HomePageSettings():
return $default(_that.showPlayButtonOnContinueListeningShelf,_that.showPlayButtonOnContinueSeriesShelf,_that.showPlayButtonOnAllRemainingShelves,_that.showPlayButtonOnListenAgainShelf);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showPlayButtonOnContinueListeningShelf,  bool showPlayButtonOnContinueSeriesShelf,  bool showPlayButtonOnAllRemainingShelves,  bool showPlayButtonOnListenAgainShelf)?  $default,) {final _that = this;
switch (_that) {
case _HomePageSettings() when $default != null:
return $default(_that.showPlayButtonOnContinueListeningShelf,_that.showPlayButtonOnContinueSeriesShelf,_that.showPlayButtonOnAllRemainingShelves,_that.showPlayButtonOnListenAgainShelf);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomePageSettings implements HomePageSettings {
  const _HomePageSettings({this.showPlayButtonOnContinueListeningShelf = true, this.showPlayButtonOnContinueSeriesShelf = false, this.showPlayButtonOnAllRemainingShelves = false, this.showPlayButtonOnListenAgainShelf = false});
  factory _HomePageSettings.fromJson(Map<String, dynamic> json) => _$HomePageSettingsFromJson(json);

@override@JsonKey() final  bool showPlayButtonOnContinueListeningShelf;
@override@JsonKey() final  bool showPlayButtonOnContinueSeriesShelf;
@override@JsonKey() final  bool showPlayButtonOnAllRemainingShelves;
@override@JsonKey() final  bool showPlayButtonOnListenAgainShelf;

/// Create a copy of HomePageSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomePageSettingsCopyWith<_HomePageSettings> get copyWith => __$HomePageSettingsCopyWithImpl<_HomePageSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomePageSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomePageSettings&&(identical(other.showPlayButtonOnContinueListeningShelf, showPlayButtonOnContinueListeningShelf) || other.showPlayButtonOnContinueListeningShelf == showPlayButtonOnContinueListeningShelf)&&(identical(other.showPlayButtonOnContinueSeriesShelf, showPlayButtonOnContinueSeriesShelf) || other.showPlayButtonOnContinueSeriesShelf == showPlayButtonOnContinueSeriesShelf)&&(identical(other.showPlayButtonOnAllRemainingShelves, showPlayButtonOnAllRemainingShelves) || other.showPlayButtonOnAllRemainingShelves == showPlayButtonOnAllRemainingShelves)&&(identical(other.showPlayButtonOnListenAgainShelf, showPlayButtonOnListenAgainShelf) || other.showPlayButtonOnListenAgainShelf == showPlayButtonOnListenAgainShelf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showPlayButtonOnContinueListeningShelf,showPlayButtonOnContinueSeriesShelf,showPlayButtonOnAllRemainingShelves,showPlayButtonOnListenAgainShelf);

@override
String toString() {
  return 'HomePageSettings(showPlayButtonOnContinueListeningShelf: $showPlayButtonOnContinueListeningShelf, showPlayButtonOnContinueSeriesShelf: $showPlayButtonOnContinueSeriesShelf, showPlayButtonOnAllRemainingShelves: $showPlayButtonOnAllRemainingShelves, showPlayButtonOnListenAgainShelf: $showPlayButtonOnListenAgainShelf)';
}


}

/// @nodoc
abstract mixin class _$HomePageSettingsCopyWith<$Res> implements $HomePageSettingsCopyWith<$Res> {
  factory _$HomePageSettingsCopyWith(_HomePageSettings value, $Res Function(_HomePageSettings) _then) = __$HomePageSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool showPlayButtonOnContinueListeningShelf, bool showPlayButtonOnContinueSeriesShelf, bool showPlayButtonOnAllRemainingShelves, bool showPlayButtonOnListenAgainShelf
});




}
/// @nodoc
class __$HomePageSettingsCopyWithImpl<$Res>
    implements _$HomePageSettingsCopyWith<$Res> {
  __$HomePageSettingsCopyWithImpl(this._self, this._then);

  final _HomePageSettings _self;
  final $Res Function(_HomePageSettings) _then;

/// Create a copy of HomePageSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showPlayButtonOnContinueListeningShelf = null,Object? showPlayButtonOnContinueSeriesShelf = null,Object? showPlayButtonOnAllRemainingShelves = null,Object? showPlayButtonOnListenAgainShelf = null,}) {
  return _then(_HomePageSettings(
showPlayButtonOnContinueListeningShelf: null == showPlayButtonOnContinueListeningShelf ? _self.showPlayButtonOnContinueListeningShelf : showPlayButtonOnContinueListeningShelf // ignore: cast_nullable_to_non_nullable
as bool,showPlayButtonOnContinueSeriesShelf: null == showPlayButtonOnContinueSeriesShelf ? _self.showPlayButtonOnContinueSeriesShelf : showPlayButtonOnContinueSeriesShelf // ignore: cast_nullable_to_non_nullable
as bool,showPlayButtonOnAllRemainingShelves: null == showPlayButtonOnAllRemainingShelves ? _self.showPlayButtonOnAllRemainingShelves : showPlayButtonOnAllRemainingShelves // ignore: cast_nullable_to_non_nullable
as bool,showPlayButtonOnListenAgainShelf: null == showPlayButtonOnListenAgainShelf ? _self.showPlayButtonOnListenAgainShelf : showPlayButtonOnListenAgainShelf // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
