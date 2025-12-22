// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_new.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playbackHash() => r'd4f270f9c46d6a52b186bc7271d584f28a5547f5';

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

/// See also [playback].
@ProviderFor(playback)
const playbackProvider = PlaybackFamily();

/// See also [playback].
class PlaybackFamily extends Family<AsyncValue<PlaybackSessionExpanded>> {
  /// See also [playback].
  const PlaybackFamily();

  /// See also [playback].
  PlaybackProvider call(
    String id,
  ) {
    return PlaybackProvider(
      id,
    );
  }

  @override
  PlaybackProvider getProviderOverride(
    covariant PlaybackProvider provider,
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
  String? get name => r'playbackProvider';
}

/// See also [playback].
class PlaybackProvider extends FutureProvider<PlaybackSessionExpanded> {
  /// See also [playback].
  PlaybackProvider(
    String id,
  ) : this._internal(
          (ref) => playback(
            ref as PlaybackRef,
            id,
          ),
          from: playbackProvider,
          name: r'playbackProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playbackHash,
          dependencies: PlaybackFamily._dependencies,
          allTransitiveDependencies: PlaybackFamily._allTransitiveDependencies,
          id: id,
        );

  PlaybackProvider._internal(
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
  Override overrideWith(
    FutureOr<PlaybackSessionExpanded> Function(PlaybackRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlaybackProvider._internal(
        (ref) => create(ref as PlaybackRef),
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
  FutureProviderElement<PlaybackSessionExpanded> createElement() {
    return _PlaybackProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaybackProvider && other.id == id;
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
mixin PlaybackRef on FutureProviderRef<PlaybackSessionExpanded> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PlaybackProviderElement
    extends FutureProviderElement<PlaybackSessionExpanded> with PlaybackRef {
  _PlaybackProviderElement(super.provider);

  @override
  String get id => (origin as PlaybackProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
