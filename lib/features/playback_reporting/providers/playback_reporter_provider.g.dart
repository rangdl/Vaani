// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_reporter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlaybackReporter)
final playbackReporterProvider = PlaybackReporterProvider._();

final class PlaybackReporterProvider
    extends $AsyncNotifierProvider<PlaybackReporter, core.PlaybackReporter> {
  PlaybackReporterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playbackReporterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playbackReporterHash();

  @$internal
  @override
  PlaybackReporter create() => PlaybackReporter();
}

String _$playbackReporterHash() => r'0a3d3a7b10a020c9ee4b6465663e83b8f75b36c5';

abstract class _$PlaybackReporter
    extends $AsyncNotifier<core.PlaybackReporter> {
  FutureOr<core.PlaybackReporter> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<core.PlaybackReporter>, core.PlaybackReporter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<core.PlaybackReporter>,
                core.PlaybackReporter
              >,
              AsyncValue<core.PlaybackReporter>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
