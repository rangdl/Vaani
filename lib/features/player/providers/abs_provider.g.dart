// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$absAudioHandlerInitHash() =>
    r'8815383b114e5e3da826afdea58bf0a884b1e3f2';

/// See also [absAudioHandlerInit].
@ProviderFor(absAudioHandlerInit)
final absAudioHandlerInitProvider =
    FutureProvider<core.AbsAudioHandler>.internal(
  absAudioHandlerInit,
  name: r'absAudioHandlerInitProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$absAudioHandlerInitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AbsAudioHandlerInitRef = FutureProviderRef<core.AbsAudioHandler>;
String _$absPlayerHash() => r'c313a2456bb221b83f3cd2142ae63d6463ef304b';

/// See also [AbsPlayer].
@ProviderFor(AbsPlayer)
final absPlayerProvider =
    NotifierProvider<AbsPlayer, core.AbsAudioHandler>.internal(
  AbsPlayer.new,
  name: r'absPlayerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$absPlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AbsPlayer = Notifier<core.AbsAudioHandler>;
String _$absStateHash() => r'fb11d9d970e0de2dfd722c1f0de2a3b9b10f2859';

/// See also [AbsState].
@ProviderFor(AbsState)
final absStateProvider =
    NotifierProvider<AbsState, core.AbsPlayerState>.internal(
  AbsState.new,
  name: r'absStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$absStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AbsState = Notifier<core.AbsPlayerState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
