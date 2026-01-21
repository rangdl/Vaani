import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:vaani/shared/extensions/directory.dart';

extension CacheManagerEx on CacheManager {
  Future<int> size() async {
    final baseDir = await getTemporaryDirectory();
    int totalSize = 0;
    final path = p.join(baseDir.path, config.cacheKey);
    final dir = Directory(path);
    if (await dir.exists()) {
      await for (var entity in dir.list(recursive: true)) {
        if (entity is File) {
          totalSize += await entity.length();
        }
      }
    }
    return totalSize;
  }

  Future<int> empty() async {
    final baseDir = await getTemporaryDirectory();
    int totalSize = 0;
    final path = p.join(baseDir.path, config.cacheKey);
    final dir = Directory(path);
    await dir.clear();
    return totalSize;
  }

  Future<void> clean({String? prefix}) async {
    if (prefix == null) {
      await emptyCache();
      await empty();
      return;
    }
    final repo = config.repo;
    final allObjects = await repo.getAllObjects();
    var futures = <Future>[];
    for (final cacheObject in allObjects) {
      final key = cacheObject.key;
      if (key.startsWith(prefix)) {
        futures.add(removeFile(key));
      }
    }
    await Future.wait(futures);
  }
}
