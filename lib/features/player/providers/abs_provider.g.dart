// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerActiveHash() => r'4d3e7181cf66bfdb46d5caaece56cde07f610cc4';

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
String _$totalHash() => r'2d01953862a875f6e66fe3af56868e819e33fcc8';

/// 进度条显示
///
/// Copied from [total].
@ProviderFor(total)
final totalProvider = AutoDisposeProvider<Duration>.internal(
  total,
  name: r'totalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$totalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TotalRef = AutoDisposeProviderRef<Duration>;
String _$progressHash() => r'7ed041be2d26a437becc9ab624322b47efbee06e';

/// See also [progress].
@ProviderFor(progress)
final progressProvider = AutoDisposeStreamProvider<Duration>.internal(
  progress,
  name: r'progressProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$progressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProgressRef = AutoDisposeStreamProviderRef<Duration>;
String _$progressBufferedHash() => r'20f886a5ad8bd4eb031eceb845201dc61dfd5fca';

/// See also [progressBuffered].
@ProviderFor(progressBuffered)
final progressBufferedProvider = AutoDisposeStreamProvider<Duration>.internal(
  progressBuffered,
  name: r'progressBufferedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$progressBufferedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProgressBufferedRef = AutoDisposeStreamProviderRef<Duration>;
String _$absPlayerHash() => r'c43c02b600326c2d47b900cb3977cd9fae201463';

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

/// See also [PlayerState].
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
String _$currentTimeHash() => r'e2cf66f5f04cd51f5ddafd64ace395ec3bf0ede2';

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

abstract class _$CurrentTime
    extends BuildlessAutoDisposeAsyncNotifier<shelfsdk.MediaProgress?> {
  late final String libraryItemId;

  FutureOr<shelfsdk.MediaProgress?> build(
    String libraryItemId,
  );
}

/// See also [CurrentTime].
@ProviderFor(CurrentTime)
const currentTimeProvider = CurrentTimeFamily();

/// See also [CurrentTime].
class CurrentTimeFamily extends Family<AsyncValue<shelfsdk.MediaProgress?>> {
  /// See also [CurrentTime].
  const CurrentTimeFamily();

  /// See also [CurrentTime].
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

/// See also [CurrentTime].
class CurrentTimeProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CurrentTime, shelfsdk.MediaProgress?> {
  /// See also [CurrentTime].
  CurrentTimeProvider(
    String libraryItemId,
  ) : this._internal(
          () => CurrentTime()..libraryItemId = libraryItemId,
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
  FutureOr<shelfsdk.MediaProgress?> runNotifierBuild(
    covariant CurrentTime notifier,
  ) {
    return notifier.build(
      libraryItemId,
    );
  }

  @override
  Override overrideWith(CurrentTime Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrentTimeProvider._internal(
        () => create()..libraryItemId = libraryItemId,
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
  AutoDisposeAsyncNotifierProviderElement<CurrentTime, shelfsdk.MediaProgress?>
      createElement() {
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
mixin CurrentTimeRef
    on AutoDisposeAsyncNotifierProviderRef<shelfsdk.MediaProgress?> {
  /// The parameter `libraryItemId` of this provider.
  String get libraryItemId;
}

class _CurrentTimeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CurrentTime,
        shelfsdk.MediaProgress?> with CurrentTimeRef {
  _CurrentTimeProviderElement(super.provider);

  @override
  String get libraryItemId => (origin as CurrentTimeProvider).libraryItemId;
}

String _$currentBookHash() => r'f13ba110d104be8bae48972d6fd266d461d30898';

/// See also [CurrentBook].
@ProviderFor(CurrentBook)
final currentBookProvider =
    AutoDisposeNotifierProvider<CurrentBook, shelfsdk.BookExpanded?>.internal(
  CurrentBook.new,
  name: r'currentBookProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentBookHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentBook = AutoDisposeNotifier<shelfsdk.BookExpanded?>;
String _$currentChapterHash() => r'e8d867067f383372afd758186f13950a6746ba85';

/// See also [CurrentChapter].
@ProviderFor(CurrentChapter)
final currentChapterProvider =
    AutoDisposeNotifierProvider<CurrentChapter, shelfsdk.BookChapter?>.internal(
  CurrentChapter.new,
  name: r'currentChapterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentChapterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentChapter = AutoDisposeNotifier<shelfsdk.BookChapter?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
