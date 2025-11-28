// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playBackSessionHash() => r'1bc00653e0041e839d8569192b6bc90d96b4ca4f';

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

/// See also [playBackSession].
@ProviderFor(playBackSession)
const playBackSessionProvider = PlayBackSessionFamily();

/// See also [playBackSession].
class PlayBackSessionFamily
    extends Family<AsyncValue<shelfsdk.PlaybackSessionExpanded?>> {
  /// See also [playBackSession].
  const PlayBackSessionFamily();

  /// See also [playBackSession].
  PlayBackSessionProvider call(
    String libraryItemId,
  ) {
    return PlayBackSessionProvider(
      libraryItemId,
    );
  }

  @override
  PlayBackSessionProvider getProviderOverride(
    covariant PlayBackSessionProvider provider,
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
  String? get name => r'playBackSessionProvider';
}

/// See also [playBackSession].
class PlayBackSessionProvider
    extends AutoDisposeFutureProvider<shelfsdk.PlaybackSessionExpanded?> {
  /// See also [playBackSession].
  PlayBackSessionProvider(
    String libraryItemId,
  ) : this._internal(
          (ref) => playBackSession(
            ref as PlayBackSessionRef,
            libraryItemId,
          ),
          from: playBackSessionProvider,
          name: r'playBackSessionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playBackSessionHash,
          dependencies: PlayBackSessionFamily._dependencies,
          allTransitiveDependencies:
              PlayBackSessionFamily._allTransitiveDependencies,
          libraryItemId: libraryItemId,
        );

  PlayBackSessionProvider._internal(
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
    FutureOr<shelfsdk.PlaybackSessionExpanded?> Function(
            PlayBackSessionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayBackSessionProvider._internal(
        (ref) => create(ref as PlayBackSessionRef),
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
  AutoDisposeFutureProviderElement<shelfsdk.PlaybackSessionExpanded?>
      createElement() {
    return _PlayBackSessionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayBackSessionProvider &&
        other.libraryItemId == libraryItemId;
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
mixin PlayBackSessionRef
    on AutoDisposeFutureProviderRef<shelfsdk.PlaybackSessionExpanded?> {
  /// The parameter `libraryItemId` of this provider.
  String get libraryItemId;
}

class _PlayBackSessionProviderElement
    extends AutoDisposeFutureProviderElement<shelfsdk.PlaybackSessionExpanded?>
    with PlayBackSessionRef {
  _PlayBackSessionProviderElement(super.provider);

  @override
  String get libraryItemId => (origin as PlayBackSessionProvider).libraryItemId;
}

String _$libraryItemHash() => r'8032b2d3ca6a8a2a6217cd32f11cd4b35919f49e';

abstract class _$LibraryItem
    extends BuildlessStreamNotifier<shelfsdk.LibraryItemExpanded> {
  late final String id;

  Stream<shelfsdk.LibraryItemExpanded> build(
    String id,
  );
}

/// provides the library item for the given id
///
/// Copied from [LibraryItem].
@ProviderFor(LibraryItem)
const libraryItemProvider = LibraryItemFamily();

/// provides the library item for the given id
///
/// Copied from [LibraryItem].
class LibraryItemFamily
    extends Family<AsyncValue<shelfsdk.LibraryItemExpanded>> {
  /// provides the library item for the given id
  ///
  /// Copied from [LibraryItem].
  const LibraryItemFamily();

  /// provides the library item for the given id
  ///
  /// Copied from [LibraryItem].
  LibraryItemProvider call(
    String id,
  ) {
    return LibraryItemProvider(
      id,
    );
  }

  @override
  LibraryItemProvider getProviderOverride(
    covariant LibraryItemProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'libraryItemProvider';
}

/// provides the library item for the given id
///
/// Copied from [LibraryItem].
class LibraryItemProvider extends StreamNotifierProviderImpl<LibraryItem,
    shelfsdk.LibraryItemExpanded> {
  /// provides the library item for the given id
  ///
  /// Copied from [LibraryItem].
  LibraryItemProvider(
    String id,
  ) : this._internal(
          () => LibraryItem()..id = id,
          from: libraryItemProvider,
          name: r'libraryItemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$libraryItemHash,
          dependencies: LibraryItemFamily._dependencies,
          allTransitiveDependencies:
              LibraryItemFamily._allTransitiveDependencies,
          id: id,
        );

  LibraryItemProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Stream<shelfsdk.LibraryItemExpanded> runNotifierBuild(
    covariant LibraryItem notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(LibraryItem Function() create) {
    return ProviderOverride(
      origin: this,
      override: LibraryItemProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  StreamNotifierProviderElement<LibraryItem, shelfsdk.LibraryItemExpanded>
      createElement() {
    return _LibraryItemProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LibraryItemProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LibraryItemRef
    on StreamNotifierProviderRef<shelfsdk.LibraryItemExpanded> {
  /// The parameter `id` of this provider.
  String get id;
}

class _LibraryItemProviderElement extends StreamNotifierProviderElement<
    LibraryItem, shelfsdk.LibraryItemExpanded> with LibraryItemRef {
  _LibraryItemProviderElement(super.provider);

  @override
  String get id => (origin as LibraryItemProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
