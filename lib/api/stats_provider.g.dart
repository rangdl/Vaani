// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ownStats)
final ownStatsProvider = OwnStatsProvider._();

final class OwnStatsProvider
    extends
        $FunctionalProvider<
          AsyncValue<GetUserStatsResponse?>,
          GetUserStatsResponse?,
          FutureOr<GetUserStatsResponse?>
        >
    with
        $FutureModifier<GetUserStatsResponse?>,
        $FutureProvider<GetUserStatsResponse?> {
  OwnStatsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ownStatsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ownStatsHash();

  @$internal
  @override
  $FutureProviderElement<GetUserStatsResponse?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GetUserStatsResponse?> create(Ref ref) {
    return ownStats(ref);
  }
}

String _$ownStatsHash() => r'000959347d382d8501e54ea7095d1d8be2d2a6f4';

@ProviderFor(libraryStats)
final libraryStatsProvider = LibraryStatsProvider._();

final class LibraryStatsProvider
    extends
        $FunctionalProvider<
          AsyncValue<GetLibrarysStatsResponse?>,
          GetLibrarysStatsResponse?,
          FutureOr<GetLibrarysStatsResponse?>
        >
    with
        $FutureModifier<GetLibrarysStatsResponse?>,
        $FutureProvider<GetLibrarysStatsResponse?> {
  LibraryStatsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'libraryStatsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$libraryStatsHash();

  @$internal
  @override
  $FutureProviderElement<GetLibrarysStatsResponse?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GetLibrarysStatsResponse?> create(Ref ref) {
    return libraryStats(ref);
  }
}

String _$libraryStatsHash() => r'fd75c7eb0b61a88b89a200fbf95fcf121ba5a4ab';
