import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart' as api;
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/api/library_item_provider.dart';
import 'package:vaani/features/downloads/providers/download_manager.dart';
import 'package:vaani/features/per_book_settings/providers/book_settings_provider.dart';
import 'package:vaani/features/player/core/abs_audio_handler.dart';
import 'package:vaani/features/player/core/abs_audio_player.dart' as core;
import 'package:vaani/features/player/core/abs_audio_player_platform.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';

part 'abs_provider.g.dart';

final _logger = Logger('AbsPlayerProvider');

/// 音频播放器 配置
@Riverpod(keepAlive: true)
Future<AudioHandler> configurePlayer(Ref ref) async {
  final player = ref.read(absPlayerProvider);
  // for playing audio on windows, linux

  // for configuring how this app will interact with other audio apps
  final session = await AudioSession.instance;
  await session.configure(const AudioSessionConfiguration.speech());

  final audioService = await AudioService.init(
    builder: () => AbsAudioHandler(player),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'dr.blank.vaani.channel.audio',
      androidNotificationChannelName: 'ABSPlayback',
      androidNotificationChannelDescription:
          'Needed to control audio from lock screen',
      androidNotificationOngoing: false,
      androidStopForegroundOnPause: false,
      androidNotificationIcon: 'drawable/ic_stat_logo',
      preloadArtwork: true,
      // fastForwardInterval: Duration(seconds: 20),
      // rewindInterval: Duration(seconds: 20),
    ),
  );

  _logger.finer('created simple player');
  return audioService;
}

// just_audio 播放器
// @Riverpod(keepAlive: true)
// AudioPlayer audioPlayer(Ref ref) {
//   // 跳转到播放列表指定条目指定位置
//   // prefetch-playlist=yes
//   JustAudioMediaKit.prefetchPlaylist = true;
//   // merge-files=yes
//   // cache=yes
//   // cache-pause-wait=60

//   JustAudioMediaKit.ensureInitialized();
//   return AudioPlayer();
// }

/// 音频播放器 riverpod状态
@Riverpod(keepAlive: true)
class AbsPlayer extends _$AbsPlayer {
  @override
  core.AbsAudioPlayer build() {
    // final audioPlayer = ref.watch(audioPlayerProvider);
    // final player = AbsMpvAudioPlayer();
    final player = AbsPlatformAudioPlayer();
    ref.onDispose(player.dispose);
    return player;
  }

  Future<void> load(
    api.BookExpanded book, {
    Duration? initialPosition,
  }) async {
    if (state.book == book || state.book?.libraryItemId == book.libraryItemId) {
      state.playOrPause();
      return;
    }
    final api = ref.read(authenticatedApiProvider);

    final downloadManager = ref.read(simpleDownloadManagerProvider);
    final libItem =
        await ref.read(libraryItemProvider(book.libraryItemId).future);
    final downloadedUris = await downloadManager.getDownloadedFilesUri(libItem);

    var bookPlayerSettings =
        ref.read(bookSettingsProvider(book.libraryItemId)).playerSettings;
    var appPlayerSettings = ref.read(appSettingsProvider).playerSettings;

    var configurePlayerForEveryBook =
        appPlayerSettings.configurePlayerForEveryBook;

    final bookSettings = ref.watch(bookSettingsProvider(book.libraryItemId));
    await state.load(
      book,
      baseUrl: api.baseUrl,
      token: api.token!,
      initialPosition: initialPosition,
      downloadedUris: downloadedUris,
      start: bookSettings.playerSettings.skipChapterStart,
      end: bookSettings.playerSettings.skipChapterEnd,
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
    await state.play();
  }
}

@riverpod
class PlayerState extends _$PlayerState {
  @override
  core.AbsPlayerState build() {
    final player = ref.read(absPlayerProvider);
    player.playerStateStream.listen((playerState) {
      if (playerState != state) {
        state = playerState;
      }
    });
    return player.playerState;
  }

  bool isLoading(String itemId) {
    final player = ref.read(absPlayerProvider);
    return player.book?.libraryItemId == itemId &&
        !state.playing &&
        state.processingState == core.AbsProcessingState.loading;
  }

  bool isPlaying() {
    return state.playing;
  }
}

@riverpod
class CurrentBook extends _$CurrentBook {
  @override
  api.BookExpanded? build() {
    final player = ref.read(absPlayerProvider);
    player.bookStream.listen((book) {
      if (book != state) {
        state = book;
      }
    });
    return player.book;
  }
}

@riverpod
bool isPlayerActive(Ref ref) {
  final player = ref.read(absPlayerProvider);
  player.bookStream.listen((book) {
    ref.invalidateSelf();
  });
  return player.book != null;
}

@riverpod
class CurrentChapter extends _$CurrentChapter {
  @override
  api.BookChapter? build() {
    final player = ref.read(absPlayerProvider);
    player.chapterStream.listen((chapter) {
      if (chapter != state) {
        state = chapter;
      }
    });
    return player.currentChapter;
  }
}

@riverpod
Stream<Duration> positionChapter(Ref ref) {
  return ref.read(absPlayerProvider).positionInChapterStream;
}

@riverpod
List<api.BookChapter> currentChapters(Ref ref) {
  final book = ref.watch(currentBookProvider);
  if (book == null) {
    return [];
  }
  final currentChapter = ref.watch(currentChapterProvider);
  if (currentChapter == null) {
    return [];
  }
  final index = book.chapters.indexOf(currentChapter);
  final total = book.chapters.length;
  final start = index - 3 >= 0 ? index - 3 : 0;
  final end = start + 20 <= total ? start + 20 : total;
  return book.chapters.sublist(start, end);
}
