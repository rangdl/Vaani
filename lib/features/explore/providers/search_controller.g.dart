// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The controller for the search bar.

@ProviderFor(GlobalSearchController)
final globalSearchControllerProvider = GlobalSearchControllerProvider._();

/// The controller for the search bar.
final class GlobalSearchControllerProvider
    extends $NotifierProvider<GlobalSearchController, Raw<SearchController>> {
  /// The controller for the search bar.
  GlobalSearchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'globalSearchControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$globalSearchControllerHash();

  @$internal
  @override
  GlobalSearchController create() => GlobalSearchController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<SearchController> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<SearchController>>(value),
    );
  }
}

String _$globalSearchControllerHash() =>
    r'd854ace6f2e00a10fc33aba63051375f82ad1b10';

/// The controller for the search bar.

abstract class _$GlobalSearchController
    extends $Notifier<Raw<SearchController>> {
  Raw<SearchController> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Raw<SearchController>, Raw<SearchController>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Raw<SearchController>, Raw<SearchController>>,
              Raw<SearchController>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
