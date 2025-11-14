import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:vaani/globals.dart';

final imageCacheManager = CacheManager(
  Config(
    '${appName}_image_cache',
    stalePeriod: const Duration(days: 365 * 10),
    repo: JsonCacheInfoRepository(),
    maxNrOfCacheObjects: 1000,
  ),
);

final apiResponseCacheManager = CacheManager(
  Config(
    '${appName}_api_response_cache',
    stalePeriod: const Duration(days: 7),
    repo: JsonCacheInfoRepository(),
    maxNrOfCacheObjects: 1000,
  ),
);
