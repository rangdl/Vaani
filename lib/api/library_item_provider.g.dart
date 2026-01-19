// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// provides the library item for the given id
// @Riverpod(keepAlive: true)
// class LibraryItem extends _$LibraryItem {
//   @override
//   Future<shelfsdk.LibraryItemExpanded> build(String id) async {
//     final api = ref.watch(authenticatedApiProvider);
//     _logger.fine('LibraryItemProvider fetching library item: $id');
//     try {
//       final item = await api.items.get(
//         libraryItemId: id,
//         parameters: const shelfsdk.GetItemReqParams(
//           expanded: true,
//           include: [
//             shelfsdk.GetItemIncludeOption.progress,
//             shelfsdk.GetItemIncludeOption.rssFeed,
//             shelfsdk.GetItemIncludeOption.authors,
//             shelfsdk.GetItemIncludeOption.downloads,
//           ],
//         ),
//       );
//       return item!.asExpanded;
//     } catch (e) {
//       debugPrintStack(stackTrace: StackTrace.current, label: e.toString());
//       appLogger.severe('未查询到数据');
//       appLogger.severe(e.toString());
//     }
//     throw shelfsdk.RequestException("查询失败");
//   }
// }

@ProviderFor(LibraryItem)
final libraryItemProvider = LibraryItemFamily._();

/// provides the library item for the given id
// @Riverpod(keepAlive: true)
// class LibraryItem extends _$LibraryItem {
//   @override
//   Future<shelfsdk.LibraryItemExpanded> build(String id) async {
//     final api = ref.watch(authenticatedApiProvider);
//     _logger.fine('LibraryItemProvider fetching library item: $id');
//     try {
//       final item = await api.items.get(
//         libraryItemId: id,
//         parameters: const shelfsdk.GetItemReqParams(
//           expanded: true,
//           include: [
//             shelfsdk.GetItemIncludeOption.progress,
//             shelfsdk.GetItemIncludeOption.rssFeed,
//             shelfsdk.GetItemIncludeOption.authors,
//             shelfsdk.GetItemIncludeOption.downloads,
//           ],
//         ),
//       );
//       return item!.asExpanded;
//     } catch (e) {
//       debugPrintStack(stackTrace: StackTrace.current, label: e.toString());
//       appLogger.severe('未查询到数据');
//       appLogger.severe(e.toString());
//     }
//     throw shelfsdk.RequestException("查询失败");
//   }
// }
final class LibraryItemProvider
    extends $StreamNotifierProvider<LibraryItem, shelfsdk.LibraryItemExpanded> {
  /// provides the library item for the given id
  // @Riverpod(keepAlive: true)
  // class LibraryItem extends _$LibraryItem {
  //   @override
  //   Future<shelfsdk.LibraryItemExpanded> build(String id) async {
  //     final api = ref.watch(authenticatedApiProvider);
  //     _logger.fine('LibraryItemProvider fetching library item: $id');
  //     try {
  //       final item = await api.items.get(
  //         libraryItemId: id,
  //         parameters: const shelfsdk.GetItemReqParams(
  //           expanded: true,
  //           include: [
  //             shelfsdk.GetItemIncludeOption.progress,
  //             shelfsdk.GetItemIncludeOption.rssFeed,
  //             shelfsdk.GetItemIncludeOption.authors,
  //             shelfsdk.GetItemIncludeOption.downloads,
  //           ],
  //         ),
  //       );
  //       return item!.asExpanded;
  //     } catch (e) {
  //       debugPrintStack(stackTrace: StackTrace.current, label: e.toString());
  //       appLogger.severe('未查询到数据');
  //       appLogger.severe(e.toString());
  //     }
  //     throw shelfsdk.RequestException("查询失败");
  //   }
  // }
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

String _$libraryItemHash() => r'bdb40fe8506f3b8f78cb47c4af827899f79617b7';

/// provides the library item for the given id
// @Riverpod(keepAlive: true)
// class LibraryItem extends _$LibraryItem {
//   @override
//   Future<shelfsdk.LibraryItemExpanded> build(String id) async {
//     final api = ref.watch(authenticatedApiProvider);
//     _logger.fine('LibraryItemProvider fetching library item: $id');
//     try {
//       final item = await api.items.get(
//         libraryItemId: id,
//         parameters: const shelfsdk.GetItemReqParams(
//           expanded: true,
//           include: [
//             shelfsdk.GetItemIncludeOption.progress,
//             shelfsdk.GetItemIncludeOption.rssFeed,
//             shelfsdk.GetItemIncludeOption.authors,
//             shelfsdk.GetItemIncludeOption.downloads,
//           ],
//         ),
//       );
//       return item!.asExpanded;
//     } catch (e) {
//       debugPrintStack(stackTrace: StackTrace.current, label: e.toString());
//       appLogger.severe('未查询到数据');
//       appLogger.severe(e.toString());
//     }
//     throw shelfsdk.RequestException("查询失败");
//   }
// }

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
  // @Riverpod(keepAlive: true)
  // class LibraryItem extends _$LibraryItem {
  //   @override
  //   Future<shelfsdk.LibraryItemExpanded> build(String id) async {
  //     final api = ref.watch(authenticatedApiProvider);
  //     _logger.fine('LibraryItemProvider fetching library item: $id');
  //     try {
  //       final item = await api.items.get(
  //         libraryItemId: id,
  //         parameters: const shelfsdk.GetItemReqParams(
  //           expanded: true,
  //           include: [
  //             shelfsdk.GetItemIncludeOption.progress,
  //             shelfsdk.GetItemIncludeOption.rssFeed,
  //             shelfsdk.GetItemIncludeOption.authors,
  //             shelfsdk.GetItemIncludeOption.downloads,
  //           ],
  //         ),
  //       );
  //       return item!.asExpanded;
  //     } catch (e) {
  //       debugPrintStack(stackTrace: StackTrace.current, label: e.toString());
  //       appLogger.severe('未查询到数据');
  //       appLogger.severe(e.toString());
  //     }
  //     throw shelfsdk.RequestException("查询失败");
  //   }
  // }

  LibraryItemProvider call(String id) =>
      LibraryItemProvider._(argument: id, from: this);

  @override
  String toString() => r'libraryItemProvider';
}

/// provides the library item for the given id
// @Riverpod(keepAlive: true)
// class LibraryItem extends _$LibraryItem {
//   @override
//   Future<shelfsdk.LibraryItemExpanded> build(String id) async {
//     final api = ref.watch(authenticatedApiProvider);
//     _logger.fine('LibraryItemProvider fetching library item: $id');
//     try {
//       final item = await api.items.get(
//         libraryItemId: id,
//         parameters: const shelfsdk.GetItemReqParams(
//           expanded: true,
//           include: [
//             shelfsdk.GetItemIncludeOption.progress,
//             shelfsdk.GetItemIncludeOption.rssFeed,
//             shelfsdk.GetItemIncludeOption.authors,
//             shelfsdk.GetItemIncludeOption.downloads,
//           ],
//         ),
//       );
//       return item!.asExpanded;
//     } catch (e) {
//       debugPrintStack(stackTrace: StackTrace.current, label: e.toString());
//       appLogger.severe('未查询到数据');
//       appLogger.severe(e.toString());
//     }
//     throw shelfsdk.RequestException("查询失败");
//   }
// }

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
