// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_timer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SleepTimer)
final sleepTimerProvider = SleepTimerProvider._();

final class SleepTimerProvider
    extends $NotifierProvider<SleepTimer, core.SleepTimer?> {
  SleepTimerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sleepTimerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sleepTimerHash();

  @$internal
  @override
  SleepTimer create() => SleepTimer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(core.SleepTimer? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<core.SleepTimer?>(value),
    );
  }
}

String _$sleepTimerHash() => r'7cac4509d8bd40c4d418c295d5b37c66492e7de9';

abstract class _$SleepTimer extends $Notifier<core.SleepTimer?> {
  core.SleepTimer? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<core.SleepTimer?, core.SleepTimer?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<core.SleepTimer?, core.SleepTimer?>,
              core.SleepTimer?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
