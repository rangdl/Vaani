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
String _$audioPlayerHash() => r'156f85effafdcd287db88e455e8f4f4d33c41a0e';

/// See also [audioPlayer].
@ProviderFor(audioPlayer)
final audioPlayerProvider = Provider<core.AbsAudioPlayer>.internal(
  audioPlayer,
  name: r'audioPlayerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$audioPlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AudioPlayerRef = ProviderRef<core.AbsAudioPlayer>;
String _$playerActiveHash() => r'86831758035aa69d74f42ebde0a19bf7ef830910';

/// See also [playerActive].
@ProviderFor(playerActive)
final playerActiveProvider = AutoDisposeProvider<bool>.internal(
  playerActive,
  name: r'playerActiveProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$playerActiveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PlayerActiveRef = AutoDisposeProviderRef<bool>;
String _$simpleAudioPlayerHash() => r'4da667e3b7047003edd594f8a76700afb963aceb';

/// See also [simpleAudioPlayer].
@ProviderFor(simpleAudioPlayer)
final simpleAudioPlayerProvider = Provider<AudioPlayer>.internal(
  simpleAudioPlayer,
  name: r'simpleAudioPlayerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simpleAudioPlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SimpleAudioPlayerRef = ProviderRef<AudioPlayer>;
String _$currentTimeHash() => r'3e7f99dbf48242a5fa0a4239a0f696535d0b4ac9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [currentTime].
@ProviderFor(currentTime)
const currentTimeProvider = CurrentTimeFamily();

/// See also [currentTime].
class CurrentTimeFamily extends Family<AsyncValue<Duration?>> {
  /// See also [currentTime].
  const CurrentTimeFamily();

  /// See also [currentTime].
  CurrentTimeProvider call(
    String libraryItemId,
  ) {
    return CurrentTimeProvider(
      libraryItemId,
    );
  }

  @override
  CurrentTimeProvider getProviderOverride(
    covariant CurrentTimeProvider provider,
  ) {
    return call(
      provider.libraryItemId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'currentTimeProvider';
}

/// See also [currentTime].
class CurrentTimeProvider extends AutoDisposeFutureProvider<Duration?> {
  /// See also [currentTime].
  CurrentTimeProvider(
    String libraryItemId,
  ) : this._internal(
          (ref) => currentTime(
            ref as CurrentTimeRef,
            libraryItemId,
          ),
          from: currentTimeProvider,
          name: r'currentTimeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentTimeHash,
          dependencies: CurrentTimeFamily._dependencies,
          allTransitiveDependencies:
              CurrentTimeFamily._allTransitiveDependencies,
          libraryItemId: libraryItemId,
        );

  CurrentTimeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.libraryItemId,
  }) : super.internal();

  final String libraryItemId;

  @override
  Override overrideWith(
    FutureOr<Duration?> Function(CurrentTimeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CurrentTimeProvider._internal(
        (ref) => create(ref as CurrentTimeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        libraryItemId: libraryItemId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Duration?> createElement() {
    return _CurrentTimeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentTimeProvider && other.libraryItemId == libraryItemId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, libraryItemId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CurrentTimeRef on AutoDisposeFutureProviderRef<Duration?> {
  /// The parameter `libraryItemId` of this provider.
  String get libraryItemId;
}

class _CurrentTimeProviderElement
    extends AutoDisposeFutureProviderElement<Duration?> with CurrentTimeRef {
  _CurrentTimeProviderElement(super.provider);

  @override
  String get libraryItemId => (origin as CurrentTimeProvider).libraryItemId;
}

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
String _$absAudioPlayerHash() => r'f595b5033eed9f4a4aa07c297c4a176955e6aab1';

/// See also [AbsAudioPlayer].
@ProviderFor(AbsAudioPlayer)
final absAudioPlayerProvider =
    NotifierProvider<AbsAudioPlayer, AudioPlayer>.internal(
  AbsAudioPlayer.new,
  name: r'absAudioPlayerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$absAudioPlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AbsAudioPlayer = Notifier<AudioPlayer>;
String _$absPlayerHash() => r'e682fea03793a0370cb143602980d5c1e37396c7';

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
String _$currentBookHash() => r'714d7701508b6186598e13bc38c57c3fe644ae90';

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
