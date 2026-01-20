import 'dart:convert';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:vaani/globals.dart';

/// 自定义图片文件缓存
class CustomImageCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'libCachedImageData';

  static final CustomImageCacheManager _instance = CustomImageCacheManager._();

  factory CustomImageCacheManager() {
    return _instance;
  }

  CustomImageCacheManager._()
    : super(
        Config(
          '${appName}_image_cache',
          stalePeriod: const Duration(days: 365 * 10),
          repo: JsonCacheInfoRepository(),
          maxNrOfCacheObjects: 1000,
        ),
      );
}

/// 自定义json数据存储为文件
class CustomJsonCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'libCachedImageData';

  static final CustomJsonCacheManager _instance = CustomJsonCacheManager._();

  factory CustomJsonCacheManager() {
    return _instance;
  }

  CustomJsonCacheManager._()
    : super(
        Config(
          '${appName}_api_response_cache',
          stalePeriod: const Duration(days: 7),
          repo: JsonCacheInfoRepository(),
          maxNrOfCacheObjects: 1000,
        ),
      );

  Future<T?> get<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final cachedFile = await getFileFromCache(key);
    if (cachedFile != null) {
      return fromJson(jsonDecode(await cachedFile.file.readAsString()));
    }
    return null;
  }

  Future<List<T>?> getList<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final cachedFile = await getFileFromCache(key);
    if (cachedFile != null) {
      final resJson = jsonDecode(await cachedFile.file.readAsString()) as List;
      return [
        for (final item in resJson) fromJson(item as Map<String, dynamic>),
      ];
    }
    return null;
  }

  Future<T> put<T>(String key, T value) async {
    final json = _serialize(value);
    if (json != null) {
      await putFile(
        key,
        utf8.encode(jsonEncode(json)),
        fileExtension: 'json',
        key: key,
      );
    }
    return value;
  }

  Future<List<T>?> putList<T>(String key, List<T>? value) async {
    if (value != null) {
      await putFile(
        key,
        utf8.encode(jsonEncode(value)),
        fileExtension: 'json',
        key: key,
      );
    }
    return value;
  }

  Map<String, dynamic>? _serialize(dynamic value) {
    if (value != null && _hasToJsonMethod(value)) {
      try {
        return value?.toJson();
      } catch (_) {}
    }
    return null;
  }

  bool _hasToJsonMethod(dynamic object) {
    try {
      final toJsonFunc = object.toJson;
      return toJsonFunc != null && toJsonFunc is Function;
    } catch (_) {
      return false;
    }
  }

  Future<void> clean({String? prefix = ''}) async {
    final repo = config.repo;
    final allObjects = await repo.getAllObjects();
    var futures = <Future>[];
    for (final cacheObject in allObjects) {
      final key = cacheObject.key;
      if (key.startsWith('$prefix')) {
        futures.add(removeFile(key));
      }
    }
    await Future.wait(futures);
  }
}

final imageCacheManager = CustomImageCacheManager();

final apiResponseCacheManager = CustomJsonCacheManager();
