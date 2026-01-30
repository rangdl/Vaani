import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/api/library_provider.dart';

part 'stats_provider.g.dart';

@riverpod
Future<GetUserStatsResponse?> ownStats(Ref ref) async {
  final authenticatedApi = ref.watch(authenticatedApiProvider);
  final response = await authenticatedApi.me.getStats();
  return response;
}

@riverpod
Future<GetLibrarysStatsResponse?> libraryStats(Ref ref) async {
  final authenticatedApi = ref.watch(authenticatedApiProvider);
  final currentLibrary = await ref.watch(currentLibraryProvider.future);
  if (currentLibrary == null) {
    return null;
  }
  final result = await authenticatedApi.libraries.getStats(
    libraryId: currentLibrary.id,
  );
  return result;
}
