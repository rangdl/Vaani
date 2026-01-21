import 'dart:io';

import 'package:vaani/globals.dart';

extension DirectoryExtension on Directory {
  /// 清空目录（删除所有子目录和文件）
  Future<void> clear() async {
    if (!await exists()) {
      return;
    }

    final entities = await list(recursive: false).toList();

    for (var entity in entities) {
      try {
        if (entity is File) {
          await entity.delete();
        } else if (entity is Directory) {
          await entity.delete(recursive: true);
        }
      } catch (e) {
        appLogger.severe('删除失败 ${entity.path}: $e');
        // 可以选择继续或抛出异常
      }
    }
  }
}
