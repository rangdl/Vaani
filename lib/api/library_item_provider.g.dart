// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// provides the library item for the given id

@ProviderFor(LibraryItem)
final libraryItemProvider = LibraryItemFamily._();

/// provides the library item for the given id
final class LibraryItemProvider
    extends $StreamNotifierProvider<LibraryItem, shelfsdk.LibraryItemExpanded> {
  /// provides the library item for the given id
  LibraryItemProvider._({
    required LibraryItemFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'libraryItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$libraryItemHash();

  @override
  String toString() {
    return r'libraryItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LibraryItem create() => LibraryItem();

  @override
  bool operator ==(Object other) {
    return other is LibraryItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$libraryItemHash() => r'3fea43a4e716c9883ed6e07448bb38bfceeb692e';

/// provides the library item for the given id

final class LibraryItemFamily extends $Family
    with
        $ClassFamilyOverride<
          LibraryItem,
          AsyncValue<shelfsdk.LibraryItemExpanded>,
          shelfsdk.LibraryItemExpanded,
          Stream<shelfsdk.LibraryItemExpanded>,
          String
        > {
  LibraryItemFamily._()
    : super(
        retry: null,
        name: r'libraryItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// provides the library item for the given id

  LibraryItemProvider call(String id) =>
      LibraryItemProvider._(argument: id, from: this);

  @override
  String toString() => r'libraryItemProvider';
}

/// provides the library item for the given id

abstract class _$LibraryItem
    extends $StreamNotifier<shelfsdk.LibraryItemExpanded> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  Stream<shelfsdk.LibraryItemExpanded> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<shelfsdk.LibraryItemExpanded>,
              shelfsdk.LibraryItemExpanded
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<shelfsdk.LibraryItemExpanded>,
                shelfsdk.LibraryItemExpanded
              >,
              AsyncValue<shelfsdk.LibraryItemExpanded>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
