// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$absAudioHandlerInitHash() =>
    r'bb46f715e9d51bb6269d0d77e314665601a6bdb0';

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
String _$positionChapterHash() => r'b1d19345bceb2e54399e15fbb16a534f4be5ba43';

/// See also [positionChapter].
@ProviderFor(positionChapter)
final positionChapterProvider = AutoDisposeStreamProvider<Duration>.internal(
  positionChapter,
  name: r'positionChapterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$positionChapterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PositionChapterRef = AutoDisposeStreamProviderRef<Duration>;
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
String _$absStateHash() => r'6b4ca07c7998304a1522a07b23955c3e54a441e3';

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
