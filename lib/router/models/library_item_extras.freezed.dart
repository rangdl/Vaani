// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_item_extras.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LibraryItemExtras {

 BookMinified? get book; String get heroTagSuffix;
/// Create a copy of LibraryItemExtras
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryItemExtrasCopyWith<LibraryItemExtras> get copyWith => _$LibraryItemExtrasCopyWithImpl<LibraryItemExtras>(this as LibraryItemExtras, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryItemExtras&&(identical(other.book, book) || other.book == book)&&(identical(other.heroTagSuffix, heroTagSuffix) || other.heroTagSuffix == heroTagSuffix));
}


@override
int get hashCode => Object.hash(runtimeType,book,heroTagSuffix);

@override
String toString() {
  return 'LibraryItemExtras(book: $book, heroTagSuffix: $heroTagSuffix)';
}


}

/// @nodoc
abstract mixin class $LibraryItemExtrasCopyWith<$Res>  {
  factory $LibraryItemExtrasCopyWith(LibraryItemExtras value, $Res Function(LibraryItemExtras) _then) = _$LibraryItemExtrasCopyWithImpl;
@useResult
$Res call({
 BookMinified? book, String heroTagSuffix
});




}
/// @nodoc
class _$LibraryItemExtrasCopyWithImpl<$Res>
    implements $LibraryItemExtrasCopyWith<$Res> {
  _$LibraryItemExtrasCopyWithImpl(this._self, this._then);

  final LibraryItemExtras _self;
  final $Res Function(LibraryItemExtras) _then;

/// Create a copy of LibraryItemExtras
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = freezed,Object? heroTagSuffix = null,}) {
  return _then(_self.copyWith(
book: freezed == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as BookMinified?,heroTagSuffix: null == heroTagSuffix ? _self.heroTagSuffix : heroTagSuffix // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LibraryItemExtras].
extension LibraryItemExtrasPatterns on LibraryItemExtras {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryItemExtras value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryItemExtras() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryItemExtras value)  $default,){
final _that = this;
switch (_that) {
case _LibraryItemExtras():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryItemExtras value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryItemExtras() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookMinified? book,  String heroTagSuffix)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryItemExtras() when $default != null:
return $default(_that.book,_that.heroTagSuffix);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookMinified? book,  String heroTagSuffix)  $default,) {final _that = this;
switch (_that) {
case _LibraryItemExtras():
return $default(_that.book,_that.heroTagSuffix);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookMinified? book,  String heroTagSuffix)?  $default,) {final _that = this;
switch (_that) {
case _LibraryItemExtras() when $default != null:
return $default(_that.book,_that.heroTagSuffix);case _:
  return null;

}
}

}

/// @nodoc


class _LibraryItemExtras implements LibraryItemExtras {
  const _LibraryItemExtras({this.book, this.heroTagSuffix = ''});
  

@override final  BookMinified? book;
@override@JsonKey() final  String heroTagSuffix;

/// Create a copy of LibraryItemExtras
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryItemExtrasCopyWith<_LibraryItemExtras> get copyWith => __$LibraryItemExtrasCopyWithImpl<_LibraryItemExtras>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryItemExtras&&(identical(other.book, book) || other.book == book)&&(identical(other.heroTagSuffix, heroTagSuffix) || other.heroTagSuffix == heroTagSuffix));
}


@override
int get hashCode => Object.hash(runtimeType,book,heroTagSuffix);

@override
String toString() {
  return 'LibraryItemExtras(book: $book, heroTagSuffix: $heroTagSuffix)';
}


}

/// @nodoc
abstract mixin class _$LibraryItemExtrasCopyWith<$Res> implements $LibraryItemExtrasCopyWith<$Res> {
  factory _$LibraryItemExtrasCopyWith(_LibraryItemExtras value, $Res Function(_LibraryItemExtras) _then) = __$LibraryItemExtrasCopyWithImpl;
@override @useResult
$Res call({
 BookMinified? book, String heroTagSuffix
});




}
/// @nodoc
class __$LibraryItemExtrasCopyWithImpl<$Res>
    implements _$LibraryItemExtrasCopyWith<$Res> {
  __$LibraryItemExtrasCopyWithImpl(this._self, this._then);

  final _LibraryItemExtras _self;
  final $Res Function(_LibraryItemExtras) _then;

/// Create a copy of LibraryItemExtras
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = freezed,Object? heroTagSuffix = null,}) {
  return _then(_LibraryItemExtras(
book: freezed == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as BookMinified?,heroTagSuffix: null == heroTagSuffix ? _self.heroTagSuffix : heroTagSuffix // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
