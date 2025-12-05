import 'package:hooks_riverpod/hooks_riverpod.dart' show Ref;
import 'package:logging/logging.dart' show Logger;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart'
    show GetLibrarysItemsReqParams, Library, LibraryItemMinified, LibraryItem;
import 'package:vaani/api/api_provider.dart' show authenticatedApiProvider;
import 'package:vaani/features/settings/api_settings_provider.dart'
    show apiSettingsProvider;
import 'package:vaani/shared/extensions/model_conversions.dart';

part 'library_provider.g.dart';

final _logger = Logger('LibraryProvider');

@riverpod
Future<Library?> library(Ref ref, String id) async {
  final api = ref.watch(authenticatedApiProvider);
  final library = await api.libraries.get(libraryId: id);
  if (library == null) {
    _logger.warning('No library found through id: $id');
    //  try to get the library from the list of libraries
    final libraries = await ref.watch(librariesProvider.future);
    for (final lib in libraries) {
      if (lib.id == id) {
        return lib;
      }
    }
    _logger.warning('No library found in the list of libraries');
    return null;
  }
  _logger.fine('Fetched library: $library');
  return library.library;
}

@riverpod
Future<Library?> currentLibrary(Ref ref) async {
  final libraryId =
      ref.watch(apiSettingsProvider.select((s) => s.activeLibraryId));
  if (libraryId == null) {
    _logger.warning('No active library id found');
    return null;
  }
  return await ref.watch(libraryProvider(libraryId).future);
}

@riverpod
class Libraries extends _$Libraries {
  @override
  FutureOr<List<Library>> build() async {
    final api = ref.watch(authenticatedApiProvider);
    final libraries = await api.libraries.getAll();
    if (libraries == null) {
      _logger.warning('Failed to fetch libraries');
      return [];
    }
    _logger.fine('Fetched ${libraries.length} libraries');
    ref.keepAlive();
    return libraries;
  }
}

@riverpod
class LibraryItemsParams extends _$LibraryItemsParams {
  @override
  GetLibrarysItemsReqParams build() {
    return const GetLibrarysItemsReqParams(
      limit: 18,
      page: 0,
      minified: true,
    );
  }
}

// 查询库下所有项目
@riverpod
Future<List<LibraryItem>> currentLibraryItems(Ref ref) async {
  final api = ref.watch(authenticatedApiProvider);
  final libraryId =
      ref.watch(apiSettingsProvider.select((s) => s.activeLibraryId));
  if (libraryId == null) {
    _logger.warning('No active library id found');
    return [];
  }
  final items = await api.libraries.getItems(
    libraryId: libraryId,
    parameters: const GetLibrarysItemsReqParams(
      limit: 18,
      page: 0,
      minified: true,
    ),
  );
  if (items == null) {
    return [];
  }
  return items.results;
}
