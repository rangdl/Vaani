// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audiobook_player.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Simple because it doesn't rebuild when the player state changes
/// it only rebuilds when the token changes

@ProviderFor(SimpleAudiobookPlayer)
final simpleAudiobookPlayerProvider = SimpleAudiobookPlayerProvider._();

/// Simple because it doesn't rebuild when the player state changes
/// it only rebuilds when the token changes
final class SimpleAudiobookPlayerProvider
    extends $NotifierProvider<SimpleAudiobookPlayer, core.AudiobookPlayer> {
  /// Simple because it doesn't rebuild when the player state changes
  /// it only rebuilds when the token changes
  SimpleAudiobookPlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'simpleAudiobookPlayerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$simpleAudiobookPlayerHash();

  @$internal
  @override
  SimpleAudiobookPlayer create() => SimpleAudiobookPlayer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(core.AudiobookPlayer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<core.AudiobookPlayer>(value),
    );
  }
}

String _$simpleAudiobookPlayerHash() =>
    r'5e94bbff4314adceb5affa704fc4d079d4016afa';

/// Simple because it doesn't rebuild when the player state changes
/// it only rebuilds when the token changes

abstract class _$SimpleAudiobookPlayer extends $Notifier<core.AudiobookPlayer> {
  core.AudiobookPlayer build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<core.AudiobookPlayer, core.AudiobookPlayer>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<core.AudiobookPlayer, core.AudiobookPlayer>,
              core.AudiobookPlayer,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AudiobookPlayer)
final audiobookPlayerProvider = AudiobookPlayerProvider._();

final class AudiobookPlayerProvider
    extends $NotifierProvider<AudiobookPlayer, core.AudiobookPlayer> {
  AudiobookPlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audiobookPlayerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audiobookPlayerHash();

  @$internal
  @override
  AudiobookPlayer create() => AudiobookPlayer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(core.AudiobookPlayer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<core.AudiobookPlayer>(value),
    );
  }
}

String _$audiobookPlayerHash() => r'0f180308067486896fec6a65a6afb0e6686ac4a0';

abstract class _$AudiobookPlayer extends $Notifier<core.AudiobookPlayer> {
  core.AudiobookPlayer build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<core.AudiobookPlayer, core.AudiobookPlayer>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<core.AudiobookPlayer, core.AudiobookPlayer>,
              core.AudiobookPlayer,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
