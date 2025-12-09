import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart' as api;
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/features/player/core/abs_audio_handler.dart';
import 'package:vaani/features/player/core/abs_audio_player.dart' as core;
import 'package:vaani/features/player/core/abs_audio_player_platform.dart';

part 'abs_provider.g.dart';

final _logger = Logger('AbsPlayerProvider');

/// 音频播放器 配置
@Riverpod(keepAlive: true)
Future<AudioHandler> configurePlayer(Ref ref) async {
  final player = ref.read(audioPlayerProvider);
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

/// 音频播放器 riverpod状态
@Riverpod(keepAlive: true)
class AudioPlayer extends _$AudioPlayer {
  @override
  core.AbsAudioPlayer build() {
    // final player = AbsMpvAudioPlayer();
    final player = AbsPlatformAudioPlayer();
    ref.onDispose(player.dispose);
    return player;
  }

  Future<void> load(
    api.BookExpanded book, {
    Duration? initialPosition,
  }) async {
    if (state.book == book) {
      state.playOrPause();
      return;
    }
    final api = ref.read(authenticatedApiProvider);
    await state.load(
      book,
      baseUrl: api.baseUrl,
      token: api.token!,
      initialPosition: initialPosition,
    );
    await state.play();
  }
}

@riverpod
class PlayerState extends _$PlayerState {
  @override
  core.AbsPlayerState build() {
    final player = ref.read(audioPlayerProvider);
    player.playerStateStream.listen((playerState) {
      if (playerState != state) {
        state = playerState;
      }
    });
    return player.playerState;
  }

  bool isLoading(String itemId) {
    final player = ref.read(audioPlayerProvider);
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
    final player = ref.read(audioPlayerProvider);
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
  final player = ref.read(audioPlayerProvider);
  player.bookStream.listen((book) {
    ref.invalidateSelf();
  });
  return player.book != null;
}

@riverpod
class CurrentChapter extends _$CurrentChapter {
  @override
  api.BookChapter? build() {
    final player = ref.read(audioPlayerProvider);
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
  return ref.read(audioPlayerProvider).positionInChapterStream;
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
