// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ApiSettings)
final apiSettingsProvider = ApiSettingsProvider._();

final class ApiSettingsProvider
    extends $NotifierProvider<ApiSettings, model.ApiSettings> {
  ApiSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiSettingsHash();

  @$internal
  @override
  ApiSettings create() => ApiSettings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(model.ApiSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<model.ApiSettings>(value),
    );
  }
}

String _$apiSettingsHash() => r'02af850985338eade33d76fc9965808bed548290';

abstract class _$ApiSettings extends $Notifier<model.ApiSettings> {
  model.ApiSettings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<model.ApiSettings, model.ApiSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<model.ApiSettings, model.ApiSettings>,
              model.ApiSettings,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
