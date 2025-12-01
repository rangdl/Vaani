// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookSettings _$BookSettingsFromJson(Map<String, dynamic> json) {
  return _BookSettings.fromJson(json);
}

/// @nodoc
mixin _$BookSettings {
  String get bookId => throw _privateConstructorUsedError;
  NullablePlayerSettings get playerSettings =>
      throw _privateConstructorUsedError;
  BookProgress? get progress => throw _privateConstructorUsedError;

  /// Serializes this BookSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookSettingsCopyWith<BookSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookSettingsCopyWith<$Res> {
  factory $BookSettingsCopyWith(
          BookSettings value, $Res Function(BookSettings) then) =
      _$BookSettingsCopyWithImpl<$Res, BookSettings>;
  @useResult
  $Res call(
      {String bookId,
      NullablePlayerSettings playerSettings,
      BookProgress? progress});

  $NullablePlayerSettingsCopyWith<$Res> get playerSettings;
  $BookProgressCopyWith<$Res>? get progress;
}

/// @nodoc
class _$BookSettingsCopyWithImpl<$Res, $Val extends BookSettings>
    implements $BookSettingsCopyWith<$Res> {
  _$BookSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = null,
    Object? playerSettings = null,
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      playerSettings: null == playerSettings
          ? _value.playerSettings
          : playerSettings // ignore: cast_nullable_to_non_nullable
              as NullablePlayerSettings,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as BookProgress?,
    ) as $Val);
  }

  /// Create a copy of BookSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NullablePlayerSettingsCopyWith<$Res> get playerSettings {
    return $NullablePlayerSettingsCopyWith<$Res>(_value.playerSettings,
        (value) {
      return _then(_value.copyWith(playerSettings: value) as $Val);
    });
  }

  /// Create a copy of BookSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookProgressCopyWith<$Res>? get progress {
    if (_value.progress == null) {
      return null;
    }

    return $BookProgressCopyWith<$Res>(_value.progress!, (value) {
      return _then(_value.copyWith(progress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookSettingsImplCopyWith<$Res>
    implements $BookSettingsCopyWith<$Res> {
  factory _$$BookSettingsImplCopyWith(
          _$BookSettingsImpl value, $Res Function(_$BookSettingsImpl) then) =
      __$$BookSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bookId,
      NullablePlayerSettings playerSettings,
      BookProgress? progress});

  @override
  $NullablePlayerSettingsCopyWith<$Res> get playerSettings;
  @override
  $BookProgressCopyWith<$Res>? get progress;
}

/// @nodoc
class __$$BookSettingsImplCopyWithImpl<$Res>
    extends _$BookSettingsCopyWithImpl<$Res, _$BookSettingsImpl>
    implements _$$BookSettingsImplCopyWith<$Res> {
  __$$BookSettingsImplCopyWithImpl(
      _$BookSettingsImpl _value, $Res Function(_$BookSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = null,
    Object? playerSettings = null,
    Object? progress = freezed,
  }) {
    return _then(_$BookSettingsImpl(
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      playerSettings: null == playerSettings
          ? _value.playerSettings
          : playerSettings // ignore: cast_nullable_to_non_nullable
              as NullablePlayerSettings,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as BookProgress?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookSettingsImpl implements _BookSettings {
  const _$BookSettingsImpl(
      {required this.bookId,
      this.playerSettings = const NullablePlayerSettings(),
      this.progress});

  factory _$BookSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookSettingsImplFromJson(json);

  @override
  final String bookId;
  @override
  @JsonKey()
  final NullablePlayerSettings playerSettings;
  @override
  final BookProgress? progress;

  @override
  String toString() {
    return 'BookSettings(bookId: $bookId, playerSettings: $playerSettings, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookSettingsImpl &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.playerSettings, playerSettings) ||
                other.playerSettings == playerSettings) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, bookId, playerSettings, progress);

  /// Create a copy of BookSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookSettingsImplCopyWith<_$BookSettingsImpl> get copyWith =>
      __$$BookSettingsImplCopyWithImpl<_$BookSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookSettingsImplToJson(
      this,
    );
  }
}

abstract class _BookSettings implements BookSettings {
  const factory _BookSettings(
      {required final String bookId,
      final NullablePlayerSettings playerSettings,
      final BookProgress? progress}) = _$BookSettingsImpl;

  factory _BookSettings.fromJson(Map<String, dynamic> json) =
      _$BookSettingsImpl.fromJson;

  @override
  String get bookId;
  @override
  NullablePlayerSettings get playerSettings;
  @override
  BookProgress? get progress;

  /// Create a copy of BookSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookSettingsImplCopyWith<_$BookSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookProgress _$BookProgressFromJson(Map<String, dynamic> json) {
  return _BookProgress.fromJson(json);
}

/// @nodoc
mixin _$BookProgress {
  DateTime get lastUpdate => throw _privateConstructorUsedError;
  Duration get currentTime => throw _privateConstructorUsedError;

  /// Serializes this BookProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookProgressCopyWith<BookProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookProgressCopyWith<$Res> {
  factory $BookProgressCopyWith(
          BookProgress value, $Res Function(BookProgress) then) =
      _$BookProgressCopyWithImpl<$Res, BookProgress>;
  @useResult
  $Res call({DateTime lastUpdate, Duration currentTime});
}

/// @nodoc
class _$BookProgressCopyWithImpl<$Res, $Val extends BookProgress>
    implements $BookProgressCopyWith<$Res> {
  _$BookProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdate = null,
    Object? currentTime = null,
  }) {
    return _then(_value.copyWith(
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentTime: null == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookProgressImplCopyWith<$Res>
    implements $BookProgressCopyWith<$Res> {
  factory _$$BookProgressImplCopyWith(
          _$BookProgressImpl value, $Res Function(_$BookProgressImpl) then) =
      __$$BookProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime lastUpdate, Duration currentTime});
}

/// @nodoc
class __$$BookProgressImplCopyWithImpl<$Res>
    extends _$BookProgressCopyWithImpl<$Res, _$BookProgressImpl>
    implements _$$BookProgressImplCopyWith<$Res> {
  __$$BookProgressImplCopyWithImpl(
      _$BookProgressImpl _value, $Res Function(_$BookProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdate = null,
    Object? currentTime = null,
  }) {
    return _then(_$BookProgressImpl(
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentTime: null == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookProgressImpl implements _BookProgress {
  const _$BookProgressImpl(
      {required this.lastUpdate, this.currentTime = Duration.zero});

  factory _$BookProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookProgressImplFromJson(json);

  @override
  final DateTime lastUpdate;
  @override
  @JsonKey()
  final Duration currentTime;

  @override
  String toString() {
    return 'BookProgress(lastUpdate: $lastUpdate, currentTime: $currentTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookProgressImpl &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.currentTime, currentTime) ||
                other.currentTime == currentTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lastUpdate, currentTime);

  /// Create a copy of BookProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookProgressImplCopyWith<_$BookProgressImpl> get copyWith =>
      __$$BookProgressImplCopyWithImpl<_$BookProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookProgressImplToJson(
      this,
    );
  }
}

abstract class _BookProgress implements BookProgress {
  const factory _BookProgress(
      {required final DateTime lastUpdate,
      final Duration currentTime}) = _$BookProgressImpl;

  factory _BookProgress.fromJson(Map<String, dynamic> json) =
      _$BookProgressImpl.fromJson;

  @override
  DateTime get lastUpdate;
  @override
  Duration get currentTime;

  /// Create a copy of BookProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookProgressImplCopyWith<_$BookProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
