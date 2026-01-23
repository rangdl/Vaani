// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shake_detector_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShakeDetector)
final shakeDetectorProvider = ShakeDetectorProvider._();

final class ShakeDetectorProvider
    extends $NotifierProvider<ShakeDetector, core.ShakeDetector?> {
  ShakeDetectorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shakeDetectorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shakeDetectorHash();

  @$internal
  @override
  ShakeDetector create() => ShakeDetector();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(core.ShakeDetector? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<core.ShakeDetector?>(value),
    );
  }
}

String _$shakeDetectorHash() => r'975311f84a3e6628d813fd53b20976507a62054d';

abstract class _$ShakeDetector extends $Notifier<core.ShakeDetector?> {
  core.ShakeDetector? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<core.ShakeDetector?, core.ShakeDetector?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<core.ShakeDetector?, core.ShakeDetector?>,
              core.ShakeDetector?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
