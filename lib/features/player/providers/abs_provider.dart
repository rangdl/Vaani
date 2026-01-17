import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart' as audio;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart' as shelfsdk;
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/api/library_item_provider.dart';
import 'package:vaani/db/available_boxes.dart';
import 'package:vaani/features/downloads/providers/download_manager.dart';
import 'package:vaani/features/per_book_settings/providers/book_settings_provider.dart';
import 'package:vaani/features/player/core/abs_audio_player.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';

part 'abs_provider.g.dart';

final _playlistBox = HiveBoxes.playlistBox;

// 播放器激活状态
@riverpod
bool playerActive(Ref ref) {
  return ref.watch(currentBookProvider) != null;
}

@Riverpod(keepAlive: true)
audio.AudioPlayer simpleAudioPlayer(Ref ref) {
  final player = audio.AudioPlayer();
  ref.onDispose(player.dispose);
  return player;
}

final offset = Duration(milliseconds: 10);

@Riverpod(keepAlive: true)
class AbsPlayer extends _$AbsPlayer {
  @override
  AbsAudioPlayer build() {
    final audioPlayer = ref.watch(simpleAudioPlayerProvider);
    return AbsAudioPlayer(audioPlayer, ref);
  }

  Future<void> load(
    shelfsdk.BookExpanded book, {
    Duration? initialPosition,
    bool play = true,
    bool force = false,
  }) async {
    if (!force &&
        (state.book == book ||
            state.book?.libraryItemId == book.libraryItemId)) {
      state.playOrPause();
      return;
    }
    final api = ref.read(authenticatedApiProvider);
    final downloadManager = ref.read(simpleDownloadManagerProvider);
    final libItem = await ref.read(
      libraryItemProvider(book.libraryItemId).future,
    );
    final downloadedUris = await downloadManager.getDownloadedFilesUri(libItem);

    final bookSettings = ref.read(bookSettingsProvider(book.libraryItemId));
    var bookPlayerSettings = bookSettings.playerSettings;
    var appPlayerSettings = ref.read(appSettingsProvider).playerSettings;

    var configurePlayerForEveryBook =
        appPlayerSettings.configurePlayerForEveryBook;

    await state.load(
      book,
      baseUrl: api.baseUrl,
      token: api.token!,
      initialPosition: initialPosition,
      downloadedUris: downloadedUris,
      start: bookSettings.playerSettings.skipChapterStart,
      end: bookSettings.playerSettings.skipChapterEnd,
      force: force,
    );
    // set the volume
    await state.setVolume(
      configurePlayerForEveryBook
          ? bookPlayerSettings.preferredDefaultVolume ??
                appPlayerSettings.preferredDefaultVolume
          : appPlayerSettings.preferredDefaultVolume,
    );
    // set the speed
    await state.setSpeed(
      configurePlayerForEveryBook
          ? bookPlayerSettings.preferredDefaultSpeed ??
                appPlayerSettings.preferredDefaultSpeed
          : appPlayerSettings.preferredDefaultSpeed,
    );
    if (play) await state.play();
  }
}

@riverpod
class PlayerState extends _$PlayerState {
  @override
  audio.PlayerState build() {
    final player = ref.read(absPlayerProvider);
    player.playerStateStream.listen((playerState) {
      if (playerState != state) {
        state = playerState;
      }
    });
    return player.playerState;
  }

  bool isLoading(String itemId) {
    final book = ref.read(currentBookProvider);
    return book?.libraryItemId == itemId &&
        !state.playing &&
        state.processingState == audio.ProcessingState.loading;
  }

  bool isPlaying() {
    return state.playing;
  }
}

@riverpod
class CurrentTime extends _$CurrentTime {
  @override
  Future<shelfsdk.MediaProgress?> build(String libraryItemId) async {
    final me = await ref.watch(meProvider.future);
    final userProgress = me.mediaProgress?.firstWhereOrNull(
      (element) => element.libraryItemId == libraryItemId,
    );
    return userProgress;
  }
}

@Riverpod(keepAlive: true)
class CurrentBook extends _$CurrentBook {
  @override
  shelfsdk.BookExpanded? build() {
    // listenSelf((previous, next) {
    //   if (previous == null && next == null) {
    //     final activeLibraryItemId = _playlistBox.getAt(0);
    //     if (activeLibraryItemId != null) {
    //       update(activeLibraryItemId, play: false);
    //     }
    //   }
    // });
    // if (_playlistBox.values.isNotEmpty) {
    //   final activeLibraryItemId = _playlistBox.getAt(0);
    //   if (activeLibraryItemId != null) {
    //     Future.microtask(() => update(activeLibraryItemId, play: false));
    //   }
    // }
    return null;
  }

  Future<String?> init() async {
    if (_playlistBox.values.isNotEmpty) {
      final activeLibraryItemId = _playlistBox.getAt(0);
      if (activeLibraryItemId != null) {
        // await ref.watch(libraryItemProvider(activeLibraryItemId).future);
        await update(activeLibraryItemId, play: false);
        return activeLibraryItemId;
      }
    }
    return null;
  }

  Future<void> update(
    String libraryItemId, {
    bool play = true,
    bool force = false,
    Duration? currentTime,
  }) async {
    if (!force && (state?.libraryItemId == libraryItemId)) {
      ref.read(absPlayerProvider).playOrPause();
      return;
    }
    final book = await ref.read(libraryItemProvider(libraryItemId).future);
    state = book.media.asBookExpanded;
    final mediaProgress = await ref.read(
      currentTimeProvider(libraryItemId).future,
    );
    await ref
        .read(absPlayerProvider.notifier)
        .load(
          state!,
          initialPosition: currentTime ?? mediaProgress?.currentTime,
          play: play,
          force: force,
        );
    if (play) {
      _playlistBox.clear();
      _playlistBox.add(libraryItemId);
    }
  }
}

@riverpod
class CurrentChapter extends _$CurrentChapter {
  @override
  shelfsdk.BookChapter? build() {
    final player = ref.read(absPlayerProvider);
    player.chapterStream.listen((chapter) {
      if (chapter != state) {
        state = chapter;
      }
    });
    return player.currentChapter;
  }
}

/// 进度条显示
// 进度条总时长
@riverpod
Duration total(Ref ref) {
  final currentBook = ref.watch(currentBookProvider);
  final currentChapter = ref.watch(currentChapterProvider);
  final playerSettings = ref.watch(
    appSettingsProvider.select((v) => v.playerSettings),
  );
  final showChapterProgress =
      playerSettings.expandedPlayerSettings.showChapterProgress;
  return showChapterProgress
      ? ((currentChapter?.end ?? Duration.zero) -
            (currentChapter?.start ?? Duration.zero))
      : currentBook?.duration ?? Duration.zero;
}

// 进度条当前时长
@riverpod
Stream<Duration> progress(Ref ref) {
  final player = ref.read(absPlayerProvider);
  final playerSettings = ref.watch(
    appSettingsProvider.select((v) => v.playerSettings),
  );
  final showChapterProgress =
      playerSettings.expandedPlayerSettings.showChapterProgress;
  return player.positionStream.map((position) {
    return showChapterProgress
        ? player.getPositionInChapter(position)
        : player.getPositionInBook(position);
  });
}

// 进度条已加载时长
@riverpod
Stream<Duration> progressBuffered(Ref ref) {
  final player = ref.read(absPlayerProvider);
  final playerSettings = ref.watch(
    appSettingsProvider.select((v) => v.playerSettings),
  );
  final showChapterProgress =
      playerSettings.expandedPlayerSettings.showChapterProgress;
  return player.bufferedPositionStream.map((position) {
    return showChapterProgress
        ? player.getPositionInChapter(position)
        : player.getPositionInBook(position);
  });
}
