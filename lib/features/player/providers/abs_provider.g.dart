// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$configurePlayerHash() => r'7ac63b6c3a34c56f42be55bc7a4856dabaae1583';

/// 音频播放器 配置
///
/// Copied from [configurePlayer].
@ProviderFor(configurePlayer)
final configurePlayerProvider = FutureProvider<AudioHandler>.internal(
  configurePlayer,
  name: r'configurePlayerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configurePlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConfigurePlayerRef = FutureProviderRef<AudioHandler>;
String _$audioPlayerHash() => r'd9d6cea83d03e36fac43367b6a24fd9d3a53b2fa';

/// See also [audioPlayer].
@ProviderFor(audioPlayer)
final audioPlayerProvider = Provider<AudioPlayer>.internal(
  audioPlayer,
  name: r'audioPlayerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$audioPlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AudioPlayerRef = ProviderRef<AudioPlayer>;
String _$isPlayerActiveHash() => r'4fca4af53a17dbcd7c8a98ce115bc11fa39b4cf9';

/// See also [isPlayerActive].
@ProviderFor(isPlayerActive)
final isPlayerActiveProvider = AutoDisposeProvider<bool>.internal(
  isPlayerActive,
  name: r'isPlayerActiveProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isPlayerActiveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsPlayerActiveRef = AutoDisposeProviderRef<bool>;
String _$positionChapterHash() => r'ac6148e92363fad849713c07045503653dcaa7e8';

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
String _$currentChaptersHash() => r'2d694aaa17f7eed8f97859d83e5b61f22966c35a';

/// See also [currentChapters].
@ProviderFor(currentChapters)
final currentChaptersProvider =
    AutoDisposeProvider<List<api.BookChapter>>.internal(
  currentChapters,
  name: r'currentChaptersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentChaptersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentChaptersRef = AutoDisposeProviderRef<List<api.BookChapter>>;
String _$absPlayerHash() => r'2ec8952e1ec764b02239ff7c26144040e460976a';

/// 音频播放器 riverpod状态
///
/// Copied from [AbsPlayer].
@ProviderFor(AbsPlayer)
final absPlayerProvider =
    NotifierProvider<AbsPlayer, core.AbsAudioPlayer>.internal(
  AbsPlayer.new,
  name: r'absPlayerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$absPlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AbsPlayer = Notifier<core.AbsAudioPlayer>;
String _$playerStateHash() => r'f195d2d13bcee0f91b862e669ab3549667d8dd2d';

/// See also [PlayerState].
@ProviderFor(PlayerState)
final playerStateProvider =
    AutoDisposeNotifierProvider<PlayerState, core.AbsPlayerState>.internal(
  PlayerState.new,
  name: r'playerStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$playerStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlayerState = AutoDisposeNotifier<core.AbsPlayerState>;
String _$currentBookHash() => r'f511c6f16c17696e41c6384c5195646a419deae3';

/// See also [CurrentBook].
@ProviderFor(CurrentBook)
final currentBookProvider =
    AutoDisposeNotifierProvider<CurrentBook, api.BookExpanded?>.internal(
  CurrentBook.new,
  name: r'currentBookProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentBookHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentBook = AutoDisposeNotifier<api.BookExpanded?>;
String _$currentChapterHash() => r'aff83aed7d098099805ec7d72ea84fff3a298522';

/// See also [CurrentChapter].
@ProviderFor(CurrentChapter)
final currentChapterProvider =
    AutoDisposeNotifierProvider<CurrentChapter, api.BookChapter?>.internal(
  CurrentChapter.new,
  name: r'currentChapterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentChapterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentChapter = AutoDisposeNotifier<api.BookChapter?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
