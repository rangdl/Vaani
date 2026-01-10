// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppSettings)
final appSettingsProvider = AppSettingsProvider._();

final class AppSettingsProvider
    extends $NotifierProvider<AppSettings, model.AppSettings> {
  AppSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appSettingsHash();

  @$internal
  @override
  AppSettings create() => AppSettings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(model.AppSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<model.AppSettings>(value),
    );
  }
}

String _$appSettingsHash() => r'744d7e0157eb3b089c4187b35b845fc78547a44e';

abstract class _$AppSettings extends $Notifier<model.AppSettings> {
  model.AppSettings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<model.AppSettings, model.AppSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<model.AppSettings, model.AppSettings>,
              model.AppSettings,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SleepTimerSettings)
final sleepTimerSettingsProvider = SleepTimerSettingsProvider._();

final class SleepTimerSettingsProvider
    extends $NotifierProvider<SleepTimerSettings, model.SleepTimerSettings> {
  SleepTimerSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sleepTimerSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sleepTimerSettingsHash();

  @$internal
  @override
  SleepTimerSettings create() => SleepTimerSettings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(model.SleepTimerSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<model.SleepTimerSettings>(value),
    );
  }
}

String _$sleepTimerSettingsHash() =>
    r'85bb3d3fb292b9a3a5b771d86e5fc57718519c69';

abstract class _$SleepTimerSettings
    extends $Notifier<model.SleepTimerSettings> {
  model.SleepTimerSettings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<model.SleepTimerSettings, model.SleepTimerSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<model.SleepTimerSettings, model.SleepTimerSettings>,
              model.SleepTimerSettings,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
