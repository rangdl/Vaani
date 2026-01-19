// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(library)
final libraryProvider = LibraryFamily._();

final class LibraryProvider
    extends
        $FunctionalProvider<AsyncValue<Library?>, Library?, FutureOr<Library?>>
    with $FutureModifier<Library?>, $FutureProvider<Library?> {
  LibraryProvider._({
    required LibraryFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'libraryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$libraryHash();

  @override
  String toString() {
    return r'libraryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Library?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Library?> create(Ref ref) {
    final argument = this.argument as String;
    return library(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LibraryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$libraryHash() => r'f8a34100acb58f02fa958c71a629577bf815710e';

final class LibraryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Library?>, String> {
  LibraryFamily._()
    : super(
        retry: null,
        name: r'libraryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LibraryProvider call(String id) =>
      LibraryProvider._(argument: id, from: this);

  @override
  String toString() => r'libraryProvider';
}

@ProviderFor(currentLibrary)
final currentLibraryProvider = CurrentLibraryProvider._();

final class CurrentLibraryProvider
    extends
        $FunctionalProvider<AsyncValue<Library?>, Library?, FutureOr<Library?>>
    with $FutureModifier<Library?>, $FutureProvider<Library?> {
  CurrentLibraryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentLibraryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentLibraryHash();

  @$internal
  @override
  $FutureProviderElement<Library?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Library?> create(Ref ref) {
    return currentLibrary(ref);
  }
}

String _$currentLibraryHash() => r'658498a531e04a01e2b3915a3319101285601118';

@ProviderFor(Libraries)
final librariesProvider = LibrariesProvider._();

final class LibrariesProvider
    extends $AsyncNotifierProvider<Libraries, List<Library>> {
  LibrariesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'librariesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$librariesHash();

  @$internal
  @override
  Libraries create() => Libraries();
}

String _$librariesHash() => r'95ebd4d1ac0cc2acf7617dc22895eff0ca30600f';

abstract class _$Libraries extends $AsyncNotifier<List<Library>> {
  FutureOr<List<Library>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Library>>, List<Library>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Library>>, List<Library>>,
              AsyncValue<List<Library>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(LibraryItems)
final libraryItemsProvider = LibraryItemsProvider._();

final class LibraryItemsProvider
    extends $NotifierProvider<LibraryItems, LibraryItemsState> {
  LibraryItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'libraryItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$libraryItemsHash();

  @$internal
  @override
  LibraryItems create() => LibraryItems();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LibraryItemsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LibraryItemsState>(value),
    );
  }
}

String _$libraryItemsHash() => r'de35b3757a93bba26843a42cf4b18803ca0e3b44';

abstract class _$LibraryItems extends $Notifier<LibraryItemsState> {
  LibraryItemsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<LibraryItemsState, LibraryItemsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LibraryItemsState, LibraryItemsState>,
              LibraryItemsState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
