// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sessionHash() => r'ae97659a7772abaa3c97644f39af6b3f05c75faf';

/// See also [session].
@ProviderFor(session)
final sessionProvider = Provider<SessionPlayer>.internal(
  session,
  name: r'sessionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SessionRef = ProviderRef<SessionPlayer>;
String _$currentChapterHash() => r'a2f43d62f77ce48e6ca34c89700443f67dbd78fe';

/// See also [currentChapter].
@ProviderFor(currentChapter)
final currentChapterProvider = AutoDisposeProvider<core.BookChapter?>.internal(
  currentChapter,
  name: r'currentChapterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentChapterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentChapterRef = AutoDisposeProviderRef<core.BookChapter?>;
String _$audioHandlerInitHash() => r'64bc78439049068ec6de6e19af657d410bde9581';

/// See also [audioHandlerInit].
@ProviderFor(audioHandlerInit)
final audioHandlerInitProvider = FutureProvider<AbsAudioHandler>.internal(
  audioHandlerInit,
  name: r'audioHandlerInitProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$audioHandlerInitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AudioHandlerInitRef = FutureProviderRef<AbsAudioHandler>;
String _$playerHash() => r'41cc626fd4a3317ce7e1ffa3c5e03206a9819231';

/// See also [Player].
@ProviderFor(Player)
final playerProvider = NotifierProvider<Player, AbsAudioHandler>.internal(
  Player.new,
  name: r'playerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$playerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Player = Notifier<AbsAudioHandler>;
String _$sessionLoadingHash() => r'4688469dd8ac9f38063917ede032cfe1506a63a8';

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

abstract class _$SessionLoading extends BuildlessNotifier<bool> {
  late final String itemId;

  bool build(
    String itemId,
  );
}

/// See also [SessionLoading].
@ProviderFor(SessionLoading)
const sessionLoadingProvider = SessionLoadingFamily();

/// See also [SessionLoading].
class SessionLoadingFamily extends Family<bool> {
  /// See also [SessionLoading].
  const SessionLoadingFamily();

  /// See also [SessionLoading].
  SessionLoadingProvider call(
    String itemId,
  ) {
    return SessionLoadingProvider(
      itemId,
    );
  }

  @override
  SessionLoadingProvider getProviderOverride(
    covariant SessionLoadingProvider provider,
  ) {
    return call(
      provider.itemId,
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
  String? get name => r'sessionLoadingProvider';
}

/// See also [SessionLoading].
class SessionLoadingProvider
    extends NotifierProviderImpl<SessionLoading, bool> {
  /// See also [SessionLoading].
  SessionLoadingProvider(
    String itemId,
  ) : this._internal(
          () => SessionLoading()..itemId = itemId,
          from: sessionLoadingProvider,
          name: r'sessionLoadingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sessionLoadingHash,
          dependencies: SessionLoadingFamily._dependencies,
          allTransitiveDependencies:
              SessionLoadingFamily._allTransitiveDependencies,
          itemId: itemId,
        );

  SessionLoadingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.itemId,
  }) : super.internal();

  final String itemId;

  @override
  bool runNotifierBuild(
    covariant SessionLoading notifier,
  ) {
    return notifier.build(
      itemId,
    );
  }

  @override
  Override overrideWith(SessionLoading Function() create) {
    return ProviderOverride(
      origin: this,
      override: SessionLoadingProvider._internal(
        () => create()..itemId = itemId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        itemId: itemId,
      ),
    );
  }

  @override
  NotifierProviderElement<SessionLoading, bool> createElement() {
    return _SessionLoadingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionLoadingProvider && other.itemId == itemId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, itemId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SessionLoadingRef on NotifierProviderRef<bool> {
  /// The parameter `itemId` of this provider.
  String get itemId;
}

class _SessionLoadingProviderElement
    extends NotifierProviderElement<SessionLoading, bool>
    with SessionLoadingRef {
  _SessionLoadingProviderElement(super.provider);

  @override
  String get itemId => (origin as SessionLoadingProvider).itemId;
}

String _$playStateHash() => r'5256c4154c4254e406593035bc54d917a9a059bf';

/// See also [PlayState].
@ProviderFor(PlayState)
final playStateProvider = NotifierProvider<PlayState, PlayerState>.internal(
  PlayState.new,
  name: r'playStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$playStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlayState = Notifier<PlayerState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
