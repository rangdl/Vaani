import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:vaani/globals.dart';

class CustomCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'libCachedImageData';

  static final CustomCacheManager _instance = CustomCacheManager._();

  factory CustomCacheManager() {
    return _instance;
  }

  CustomCacheManager._()
    : super(
        Config(
          '${appName}_image_cache',
          stalePeriod: const Duration(days: 365 * 10),
          repo: JsonCacheInfoRepository(),
          maxNrOfCacheObjects: 1000,
        ),
      );
}

final imageCacheManager = CustomCacheManager();

final apiResponseCacheManager = CacheManager(
  Config(
    '${appName}_api_response_cache',
    stalePeriod: const Duration(days: 7),
    repo: JsonCacheInfoRepository(),
    maxNrOfCacheObjects: 1000,
  ),
);
