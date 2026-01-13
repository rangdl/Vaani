// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_new.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playback)
final playbackProvider = PlaybackFamily._();

final class PlaybackProvider
    extends
        $FunctionalProvider<
          AsyncValue<PlaybackSessionExpanded>,
          PlaybackSessionExpanded,
          FutureOr<PlaybackSessionExpanded>
        >
    with
        $FutureModifier<PlaybackSessionExpanded>,
        $FutureProvider<PlaybackSessionExpanded> {
  PlaybackProvider._({
    required PlaybackFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'playbackProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playbackHash();

  @override
  String toString() {
    return r'playbackProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PlaybackSessionExpanded> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PlaybackSessionExpanded> create(Ref ref) {
    final argument = this.argument as String;
    return playback(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaybackProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playbackHash() => r'd4f270f9c46d6a52b186bc7271d584f28a5547f5';

final class PlaybackFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PlaybackSessionExpanded>, String> {
  PlaybackFamily._()
    : super(
        retry: null,
        name: r'playbackProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  PlaybackProvider call(String id) =>
      PlaybackProvider._(argument: id, from: this);

  @override
  String toString() => r'playbackProvider';
}
