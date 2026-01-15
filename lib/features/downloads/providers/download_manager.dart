import 'package:background_downloader/background_downloader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/api/library_item_provider.dart';
import 'package:vaani/features/downloads/core/download_manager.dart' as core;
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/shared/extensions/item_files.dart';

part 'download_manager.g.dart';

final _logger = Logger('AudiobookDownloadManagerProvider');

@Riverpod(keepAlive: true)
class SimpleDownloadManager extends _$SimpleDownloadManager {
  @override
  core.AudiobookDownloadManager build() {
    final api = ref.watch(authenticatedApiProvider);
    final downloadSettings = ref.watch(appSettingsProvider).downloadSettings;

    final manager = core.AudiobookDownloadManager(
      baseUrl: api.baseUrl.toString(),
      token: api.token!,
      requiresWiFi: downloadSettings.requiresWiFi,
      retries: downloadSettings.retries,
      allowPause: downloadSettings.allowPause,
      path: downloadSettings.path,
    );
    core.tq.maxConcurrent = downloadSettings.maxConcurrent;
    core.tq.maxConcurrentByHost = downloadSettings.maxConcurrentByHost;
    core.tq.maxConcurrentByGroup = downloadSettings.maxConcurrentByGroup;

    ref.onDispose(() {
      _logger.info('disposing download manager');
      manager.dispose();
    });

    _logger.config('initialized download manager');
    return manager;
  }
}

@Riverpod(keepAlive: true)
class DownloadManager extends _$DownloadManager {
  @override
  core.AudiobookDownloadManager build() {
    final manager = ref.watch(simpleDownloadManagerProvider);
    manager.taskUpdateStream.listen((_) {
      ref.notifyListeners();
    });
    return manager;
  }

  Future<void> queueAudioBookDownload(LibraryItemExpanded item) async {
    _logger.fine('queueing download for ${item.id}');
    // final appSettings = ref.read(appSettingsProvider);

    await state.queueAudioBookDownload(item);
  }

  Future<void> deleteDownloadedItem(LibraryItemExpanded item) async {
    _logger.fine('deleting downloaded item ${item.id}');
    await state.deleteDownloadedItem(item);
    ref.notifyListeners();
  }
}

@riverpod
class IsItemDownloading extends _$IsItemDownloading {
  @override
  bool build(String id) {
    final manager = ref.watch(downloadManagerProvider);
    return manager.isItemDownloading(id);
  }
}

@riverpod
class ItemDownloadProgress extends _$ItemDownloadProgress {
  @override
  Future<double?> build(String id) async {
    final item = await ref.watch(libraryItemProvider(id).future);
    final manager = ref.read(downloadManagerProvider);
    manager.taskUpdateStream
        .map((taskUpdate) {
          if (taskUpdate is! TaskProgressUpdate) {
            return null;
          }
          if (taskUpdate.task.group == id) {
            return taskUpdate;
          }
        })
        .listen((task) async {
          if (task != null) {
            final totalSize = item.totalSize;
            // if total size is 0, return 0
            if (totalSize == 0) {
              state = const AsyncValue.data(0.0);
              return;
            }
            final downloadedFiles = await manager.getDownloadedFilesMetadata(
              item,
            );
            // calculate total size of downloaded files and total size of item, then divide
            // to get percentage
            final downloadedSize = downloadedFiles.fold<int>(
              0,
              (previousValue, element) => previousValue + element.metadata.size,
            );

            final inProgressFileSize = task.progress * task.expectedFileSize;
            final totalDownloadedSize = downloadedSize + inProgressFileSize;
            final progress = totalDownloadedSize / totalSize;
            // if current progress is more than calculated progress, do not update
            if (progress < (state.value ?? 0.0)) {
              return;
            }

            state = AsyncValue.data(progress.clamp(0.0, 1.0));
          }
        });
    return null;
  }
}

@riverpod
FutureOr<List<TaskRecord>> downloadHistory(Ref ref, {String? group}) async {
  return await FileDownloader().database.allRecords(group: group);
}

@riverpod
class IsItemDownloaded extends _$IsItemDownloaded {
  @override
  FutureOr<bool> build(LibraryItemExpanded item) {
    final manager = ref.watch(downloadManagerProvider);
    return manager.isItemDownloaded(item);
  }
}

// 返回文件下载状态
// -1 未开始
// 0 开始下载
// 0 - 1 正在下载
// 1 下载完成
@riverpod
class FileState extends _$FileState {
  @override
  (TaskStatus, double) build(LibraryItemExpanded item, AudioFile file) {
    final manager = ref.read(simpleDownloadManagerProvider);
    final success = manager.isFileDownloaded(
      manager.constructFilePath(item, file),
    );
    if (success) {
      return (TaskStatus.complete, 1);
    }
    manager.taskUpdateStream.listen((update) {
      if (update.task.taskId == file.ino) {
        switch (update) {
          case TaskStatusUpdate():
            print(
              'Status update for ${update.task} with status ${update.status}',
            );
            _update(update.status, state.$2);
          case TaskProgressUpdate():
            print(
              'Progress update for ${update.task} with progress ${update.progress}',
            );
            _update(state.$1, update.progress);
        }
      }
    });
    //
    return (TaskStatus.notFound, -2);
  }

  void _update(TaskStatus status, double value) {
    state = (status, value);
  }
}
