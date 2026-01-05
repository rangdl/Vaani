// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerActiveHash() => r'86831758035aa69d74f42ebde0a19bf7ef830910';

/// 音频播放器 配置
///
/// Copied from [playerActive].
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
String _$simpleAudioPlayerHash() => r'99d84a750cf605ad036603320925f0ba7253930b';

/// See also [simpleAudioPlayer].
@ProviderFor(simpleAudioPlayer)
final simpleAudioPlayerProvider = Provider<audio.AudioPlayer>.internal(
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
typedef SimpleAudioPlayerRef = ProviderRef<audio.AudioPlayer>;
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
String _$absPlayerHash() => r'370f576d3d3a2196d1a93f2046005c1a3298d994';

/// See also [AbsPlayer].
@ProviderFor(AbsPlayer)
final absPlayerProvider = NotifierProvider<AbsPlayer, AbsAudioPlayer>.internal(
  AbsPlayer.new,
  name: r'absPlayerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$absPlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AbsPlayer = Notifier<AbsAudioPlayer>;
String _$playerStateHash() => r'eb79bd816714f721da1c4226d4447de5dc55fc5c';

/// 音频播放器 riverpod状态
///
/// Copied from [PlayerState].
@ProviderFor(PlayerState)
final playerStateProvider =
    AutoDisposeNotifierProvider<PlayerState, audio.PlayerState>.internal(
  PlayerState.new,
  name: r'playerStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$playerStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlayerState = AutoDisposeNotifier<audio.PlayerState>;
String _$currentBookHash() => r'85de9041d356e214761b65bd1b7b74321d5a9221';

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
