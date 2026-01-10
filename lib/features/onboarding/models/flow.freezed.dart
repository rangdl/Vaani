// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Flow {

 Uri get serverUri; String get state; String get verifier; Cookie get cookie; bool get isFlowComplete; String? get authToken;
/// Create a copy of Flow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlowCopyWith<Flow> get copyWith => _$FlowCopyWithImpl<Flow>(this as Flow, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Flow&&(identical(other.serverUri, serverUri) || other.serverUri == serverUri)&&(identical(other.state, state) || other.state == state)&&(identical(other.verifier, verifier) || other.verifier == verifier)&&(identical(other.cookie, cookie) || other.cookie == cookie)&&(identical(other.isFlowComplete, isFlowComplete) || other.isFlowComplete == isFlowComplete)&&(identical(other.authToken, authToken) || other.authToken == authToken));
}


@override
int get hashCode => Object.hash(runtimeType,serverUri,state,verifier,cookie,isFlowComplete,authToken);

@override
String toString() {
  return 'Flow(serverUri: $serverUri, state: $state, verifier: $verifier, cookie: $cookie, isFlowComplete: $isFlowComplete, authToken: $authToken)';
}


}

/// @nodoc
abstract mixin class $FlowCopyWith<$Res>  {
  factory $FlowCopyWith(Flow value, $Res Function(Flow) _then) = _$FlowCopyWithImpl;
@useResult
$Res call({
 Uri serverUri, String state, String verifier, Cookie cookie, bool isFlowComplete, String? authToken
});




}
/// @nodoc
class _$FlowCopyWithImpl<$Res>
    implements $FlowCopyWith<$Res> {
  _$FlowCopyWithImpl(this._self, this._then);

  final Flow _self;
  final $Res Function(Flow) _then;

/// Create a copy of Flow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverUri = null,Object? state = null,Object? verifier = null,Object? cookie = null,Object? isFlowComplete = null,Object? authToken = freezed,}) {
  return _then(_self.copyWith(
serverUri: null == serverUri ? _self.serverUri : serverUri // ignore: cast_nullable_to_non_nullable
as Uri,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,verifier: null == verifier ? _self.verifier : verifier // ignore: cast_nullable_to_non_nullable
as String,cookie: null == cookie ? _self.cookie : cookie // ignore: cast_nullable_to_non_nullable
as Cookie,isFlowComplete: null == isFlowComplete ? _self.isFlowComplete : isFlowComplete // ignore: cast_nullable_to_non_nullable
as bool,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Flow].
extension FlowPatterns on Flow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Flow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Flow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Flow value)  $default,){
final _that = this;
switch (_that) {
case _Flow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Flow value)?  $default,){
final _that = this;
switch (_that) {
case _Flow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uri serverUri,  String state,  String verifier,  Cookie cookie,  bool isFlowComplete,  String? authToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Flow() when $default != null:
return $default(_that.serverUri,_that.state,_that.verifier,_that.cookie,_that.isFlowComplete,_that.authToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uri serverUri,  String state,  String verifier,  Cookie cookie,  bool isFlowComplete,  String? authToken)  $default,) {final _that = this;
switch (_that) {
case _Flow():
return $default(_that.serverUri,_that.state,_that.verifier,_that.cookie,_that.isFlowComplete,_that.authToken);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uri serverUri,  String state,  String verifier,  Cookie cookie,  bool isFlowComplete,  String? authToken)?  $default,) {final _that = this;
switch (_that) {
case _Flow() when $default != null:
return $default(_that.serverUri,_that.state,_that.verifier,_that.cookie,_that.isFlowComplete,_that.authToken);case _:
  return null;

}
}

}

/// @nodoc


class _Flow implements Flow {
  const _Flow({required this.serverUri, required this.state, required this.verifier, required this.cookie, this.isFlowComplete = false, this.authToken});
  

@override final  Uri serverUri;
@override final  String state;
@override final  String verifier;
@override final  Cookie cookie;
@override@JsonKey() final  bool isFlowComplete;
@override final  String? authToken;

/// Create a copy of Flow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlowCopyWith<_Flow> get copyWith => __$FlowCopyWithImpl<_Flow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Flow&&(identical(other.serverUri, serverUri) || other.serverUri == serverUri)&&(identical(other.state, state) || other.state == state)&&(identical(other.verifier, verifier) || other.verifier == verifier)&&(identical(other.cookie, cookie) || other.cookie == cookie)&&(identical(other.isFlowComplete, isFlowComplete) || other.isFlowComplete == isFlowComplete)&&(identical(other.authToken, authToken) || other.authToken == authToken));
}


@override
int get hashCode => Object.hash(runtimeType,serverUri,state,verifier,cookie,isFlowComplete,authToken);

@override
String toString() {
  return 'Flow(serverUri: $serverUri, state: $state, verifier: $verifier, cookie: $cookie, isFlowComplete: $isFlowComplete, authToken: $authToken)';
}


}

/// @nodoc
abstract mixin class _$FlowCopyWith<$Res> implements $FlowCopyWith<$Res> {
  factory _$FlowCopyWith(_Flow value, $Res Function(_Flow) _then) = __$FlowCopyWithImpl;
@override @useResult
$Res call({
 Uri serverUri, String state, String verifier, Cookie cookie, bool isFlowComplete, String? authToken
});




}
/// @nodoc
class __$FlowCopyWithImpl<$Res>
    implements _$FlowCopyWith<$Res> {
  __$FlowCopyWithImpl(this._self, this._then);

  final _Flow _self;
  final $Res Function(_Flow) _then;

/// Create a copy of Flow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverUri = null,Object? state = null,Object? verifier = null,Object? cookie = null,Object? isFlowComplete = null,Object? authToken = freezed,}) {
  return _then(_Flow(
serverUri: null == serverUri ? _self.serverUri : serverUri // ignore: cast_nullable_to_non_nullable
as Uri,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,verifier: null == verifier ? _self.verifier : verifier // ignore: cast_nullable_to_non_nullable
as String,cookie: null == cookie ? _self.cookie : cookie // ignore: cast_nullable_to_non_nullable
as Cookie,isFlowComplete: null == isFlowComplete ? _self.isFlowComplete : isFlowComplete // ignore: cast_nullable_to_non_nullable
as bool,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
