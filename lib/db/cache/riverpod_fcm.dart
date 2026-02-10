import 'dart:async';
import 'dart:convert';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:logging/logging.dart';
import 'package:riverpod/experimental/persist.dart';

final _logger = Logger('JsonStorage');

/// 使用flutter_cache_manager缓存api接口返回数据
/// 缓存过期由flutter_cache_manager自行管理
/// 此处只做读取和写入
final class JsonStorage extends Storage<String, String> {
  JsonStorage._(this._cacheManager);

  static Future<JsonStorage> open(CacheManager cacheManager) async {
    final instance = JsonStorage._(cacheManager);
    await instance.deleteOutOfDate();
    return instance;
  }

  final CacheManager _cacheManager;

  /// Closes the database.
  Future<void> close() async {}

  @override
  Future<void> deleteOutOfDate() async {}

  @override
  Future<void> delete(String key) async {
    await _cacheManager.removeFile(key);
  }

  @override
  Future<PersistedData<String>?> read(String key) async {
    final cachedFile = await _cacheManager.getFileFromCache(key);
    if (cachedFile == null) {
      _logger.fine('cache miss for $key');
      return null;
    }
    _logger.fine('cache hit for $key');
    return PersistedData(await cachedFile.file.readAsString());
  }

  @override
  Future<void> write(String key, String value, StorageOptions options) {
    _logger.fine('cache update for $key');
    return _cacheManager.putFile(
      key,
      utf8.encode(value),
      fileExtension: 'json',
      key: key,
      // maxAge: options.cacheTime.duration ?? Duration(days: 30),
    );
  }
}
