// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Playlist)
final playlistProvider = PlaylistProvider._();

final class PlaylistProvider
    extends $NotifierProvider<Playlist, AudiobookPlaylist> {
  PlaylistProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistHash();

  @$internal
  @override
  Playlist create() => Playlist();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AudiobookPlaylist value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AudiobookPlaylist>(value),
    );
  }
}

String _$playlistHash() => r'bed4642e4c2de829e4d0630cb5bf92bffeeb1f60';

abstract class _$Playlist extends $Notifier<AudiobookPlaylist> {
  AudiobookPlaylist build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AudiobookPlaylist, AudiobookPlaylist>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AudiobookPlaylist, AudiobookPlaylist>,
              AudiobookPlaylist,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
