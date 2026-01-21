// provider to provide the api instance

import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:http_cache_client/http_cache_client.dart';
// import 'package:http_cache_core/http_cache_core.dart';
// import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/db/cache/cache_key.dart';
import 'package:vaani/db/cache_manager.dart';
import 'package:vaani/features/settings/api_settings_provider.dart';
import 'package:vaani/features/settings/models/authenticated_user.dart';
import 'package:vaani/shared/extensions/cache_manager.dart';
import 'package:vaani/shared/extensions/obfuscation.dart';
import 'package:vaani/shared/utils/error_response.dart';

part 'api_provider.g.dart';

// // TODO: workaround for https://github.com/rrousselGit/riverpod/issues/3718
// typedef ResponseErrorHandler<T> = void Function(
//   T response, [
//   Object? error,
// ]);

final _logger = Logger('api_provider');

Uri makeBaseUrl(String address) {
  if (!address.startsWith('http') && !address.startsWith('https')) {
    address = 'https://$address';
  }
  if (!Uri.parse(address).isAbsolute) {
    throw ArgumentError.value(address, 'address', 'Invalid address');
  }
  return Uri.parse(address);
}

// Global options
// final options = CacheOptions(
//   // A default store is required for the client.
//   store: HiveCacheStore(appDocumentsDir.path, hiveBoxName: "http_cache"),

//   // All subsequent fields are optional to get a standard behaviour.

//   // Default.
//   policy: CachePolicy.request,
//   // 对于给定的状态代码，返回之前缓存的错误响应。
//   // Returns a previous cached response on error for given status codes.
//   // Defaults to `[]`.
//   hitCacheOnErrorCodes: const [500],
//   // 允许在网络错误（例如脱机使用）时返回缓存响应。
//   // Allows to return a cached response on network errors (e.g. offline usage).
//   // Defaults to `false`.
//   hitCacheOnNetworkFailure: true,
//   // Overrides any HTTP directive to delete entry past this duration.
//   // Useful only when origin server has no cache config or custom behaviour is desired.
//   // Defaults to `null`.
//   maxStale: const Duration(days: 7),
//   // Default. Allows 3 cache sets and ease cleanup.
//   priority: CachePriority.normal,
//   // Default. Body and headers encryption with your own algorithm.
//   cipher: null,
//   // Default. Key builder to retrieve requests.
//   keyBuilder: CacheOptions.defaultCacheKeyBuilder,
//   // Default. Allows to cache POST requests.
//   // Assigning a [keyBuilder] is strongly recommended when `true`.
//   allowPostMethod: false,
// );

/// get the api instance for the given base url
@riverpod
AudiobookshelfApi audiobookshelfApi(Ref ref, Uri? baseUrl) {
  // try to get the base url from app settings
  final apiSettings = ref.watch(apiSettingsProvider);
  baseUrl ??= apiSettings.activeServer?.serverUrl;
  return DioAudiobookshelfApi(baseUrl: makeBaseUrl(baseUrl.toString()));
}

/// get the api instance for the authenticated user
///
/// if the user is not authenticated throw an error
@Riverpod(keepAlive: true)
AudiobookshelfApi authenticatedApi(Ref ref) {
  final user = ref.watch(apiSettingsProvider.select((s) => s.activeUser));
  if (user == null) {
    _logger.severe('No active user can not provide authenticated api');
    throw StateError('No active user');
  }
  return DioAudiobookshelfApi(
    baseUrl: makeBaseUrl(user.server.serverUrl.toString()),
    token: user.authToken,
    // client: CacheClient(Client(), options: options),
  );
}

/// ping the server to check if it is reachable
@riverpod
FutureOr<bool> isServerAlive(Ref ref, String address) async {
  if (address.isEmpty) {
    return false;
  }

  try {
    return await DioAudiobookshelfApi(
          baseUrl: makeBaseUrl(address),
        ).server.ping() ??
        false;
  } catch (e) {
    return false;
  }
}

/// fetch status of server
@riverpod
FutureOr<ServerStatusResponse?> serverStatus(
  Ref ref,
  Uri baseUrl, [
  ResponseErrorHandler? responseErrorHandler,
]) async {
  _logger.fine('fetching server status: ${baseUrl.obfuscate()}');
  final api = ref.watch(audiobookshelfApiProvider(baseUrl));
  final res = await api.server.status(
    responseErrorHandler: responseErrorHandler,
  );
  _logger.fine('server status: $res');
  return res;
}

/// fetch the personalized view
@riverpod
class PersonalizedView extends _$PersonalizedView {
  @override
  Stream<List<Shelf>> build() async* {
    final api = ref.watch(authenticatedApiProvider);
    final apiSettings = ref.watch(apiSettingsProvider);
    final user = apiSettings.activeUser;
    if (user == null) {
      _logger.warning('no active user');
      yield [];
      return;
    }
    if (apiSettings.activeLibraryId == null) {
      // set it to default user library by logging in and getting the library id
      final login = await ref.read(loginProvider().future);
      if (login == null) {
        _logger.shout('failed to login, not building personalized view');
        yield [];
        return;
      }
      ref
          .read(apiSettingsProvider.notifier)
          .updateState(
            apiSettings.copyWith(activeLibraryId: login.userDefaultLibraryId),
          );
      yield [];
      return;
    }
    // try to find in cache
    final key = CacheKey.personalized(apiSettings.activeLibraryId! + user.id);
    final cachedItems = await apiResponseCacheManager.getList(
      key,
      Shelf.fromJson,
    );
    if (cachedItems != null) {
      _logger.fine('successfully read from cache key: $key');
      yield cachedItems;
    }

    // ! exaggerated delay
    // await Future.delayed(const Duration(seconds: 2));
    final res = await api.libraries.getPersonalized(
      libraryId: apiSettings.activeLibraryId!,
    );
    final result = await apiResponseCacheManager.putList(key, res);
    if (result != null) {
      yield result;
    }
  }

  // method to force refresh the view and ignore the cache
  Future<void> forceRefresh() async {
    // clear the cache
    // TODO: find a better way to clear the cache for only personalized view key
    // return apiResponseCacheManager.emptyCache();
    return apiResponseCacheManager.clean(prefix: CacheKey.personalized(''));
  }
}

/// fetch continue listening audiobooks
@riverpod
FutureOr<GetUserSessionsResponse> fetchContinueListening(Ref ref) async {
  final api = ref.watch(authenticatedApiProvider);
  final res = await api.me.getSessions();
  // debugPrint(
  //   'fetchContinueListening: ${res.sessions.map((e) => e.libraryItemId).toSet()}',
  // );
  return res!;
}

@riverpod
FutureOr<User> me(Ref ref) async {
  final api = ref.watch(authenticatedApiProvider);
  final errorResponseHandler = ErrorResponseHandler();
  final res = await api.me.getUser(
    responseErrorHandler: errorResponseHandler.storeError,
  );
  if (res == null) {
    _logger.severe(
      'me failed, got response: ${errorResponseHandler.response.obfuscate()}',
    );
    throw StateError('me failed');
  }
  return res;
}

@riverpod
FutureOr<LoginResponse?> login(Ref ref, {AuthenticatedUser? user}) async {
  if (user == null) {
    // try to get the user from settings
    final apiSettings = ref.watch(apiSettingsProvider);
    user = apiSettings.activeUser;
    if (user == null) {
      _logger.severe('no active user to login');
      return null;
    }
    _logger.fine('no user provided, using active user: ${user.obfuscate()}');
  }
  final api = ref.watch(audiobookshelfApiProvider(user.server.serverUrl));
  api.token = user.authToken;
  var errorResponseHandler = ErrorResponseHandler();
  _logger.fine('logging in with authenticated api');
  final res = await api.misc.authorize(
    responseErrorHandler: errorResponseHandler.storeError,
  );
  if (res == null) {
    _logger.severe(
      'login failed, got response: ${errorResponseHandler.response.obfuscate()}',
    );
    return null;
  }
  _logger.fine('login response: ${res.obfuscate()}');
  return res;
}
