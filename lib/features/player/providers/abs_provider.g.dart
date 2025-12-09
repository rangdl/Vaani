// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$configurePlayerHash() => r'7e7003c815e7d240a67cd581931839cc60346707';

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
String _$isPlayerActiveHash() => r'71a24418ecf6c1a2d8160b0d0c8fc523d5679e76';

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
String _$positionChapterHash() => r'750b8e2f2c7217b59c3d77ed66dd20798f8787fa';

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
String _$audioPlayerHash() => r'e0efa20f340adf3312a76e5ca9e0c8ab0273a22a';

/// 音频播放器 riverpod状态
///
/// Copied from [AudioPlayer].
@ProviderFor(AudioPlayer)
final audioPlayerProvider =
    NotifierProvider<AudioPlayer, core.AbsAudioPlayer>.internal(
  AudioPlayer.new,
  name: r'audioPlayerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$audioPlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AudioPlayer = Notifier<core.AbsAudioPlayer>;
String _$playerStateHash() => r'7e238aea9306cdfb952b546c76d1e894888c586f';

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
String _$currentBookHash() => r'3684426dfde84e49dc2021e8444a2a3026082942';

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
String _$currentChapterHash() => r'28ac34fa83cbd6acf745e06b91b9ce36733fdbe5';

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
