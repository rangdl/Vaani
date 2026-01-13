// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The provider for the search result.

@ProviderFor(searchResult)
final searchResultProvider = SearchResultFamily._();

/// The provider for the search result.

final class SearchResultProvider
    extends
        $FunctionalProvider<
          AsyncValue<LibrarySearchResponse?>,
          LibrarySearchResponse?,
          FutureOr<LibrarySearchResponse?>
        >
    with
        $FutureModifier<LibrarySearchResponse?>,
        $FutureProvider<LibrarySearchResponse?> {
  /// The provider for the search result.
  SearchResultProvider._({
    required SearchResultFamily super.from,
    required (String, {int limit}) super.argument,
  }) : super(
         retry: null,
         name: r'searchResultProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchResultHash();

  @override
  String toString() {
    return r'searchResultProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<LibrarySearchResponse?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LibrarySearchResponse?> create(Ref ref) {
    final argument = this.argument as (String, {int limit});
    return searchResult(ref, argument.$1, limit: argument.limit);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchResultProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchResultHash() => r'33785de298ad0d53c9d21e8fec88ba2f22f1363f';

/// The provider for the search result.

final class SearchResultFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<LibrarySearchResponse?>,
          (String, {int limit})
        > {
  SearchResultFamily._()
    : super(
        retry: null,
        name: r'searchResultProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The provider for the search result.

  SearchResultProvider call(String query, {int limit = 25}) =>
      SearchResultProvider._(argument: (query, limit: limit), from: this);

  @override
  String toString() => r'searchResultProvider';
}
