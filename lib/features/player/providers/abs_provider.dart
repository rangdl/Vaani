import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart' as api;
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/api/library_item_provider.dart';
import 'package:vaani/db/available_boxes.dart';
import 'package:vaani/db/cache/cache_key.dart';
import 'package:vaani/features/downloads/providers/download_manager.dart';
import 'package:vaani/features/per_book_settings/providers/book_settings_provider.dart';
import 'package:vaani/features/player/core/abs_audio_handler.dart';
import 'package:vaani/features/player/core/abs_audio_player.dart' as core;
import 'package:vaani/features/player/core/abs_audio_player_platform.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/shared/extensions/box.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';

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
@Riverpod(keepAlive: true)
core.AbsAudioPlayer audioPlayer(Ref ref) {
  final player = AbsPlatformAudioPlayer();
  // final player = AbsMpvAudioPlayer();
  ref.onDispose(player.dispose);
  return player;
}

// 播放器激活状态
@riverpod
bool playerActive(Ref ref) {
  return false;
}

@Riverpod(keepAlive: true)
AudioPlayer simpleAudioPlayer(Ref ref) {
  final player = AudioPlayer();
  ref.onDispose(player.dispose);
  return player;
}

@Riverpod(keepAlive: true)
class AbsAudioPlayer extends _$AbsAudioPlayer {
  @override
  AudioPlayer build() {
    final audioPlayer = ref.watch(simpleAudioPlayerProvider);
    return audioPlayer;
  }

  Future<void> load(
    api.BookExpanded book, {
    Duration? initialPosition,
    bool play = true,
  }) async {
    final currentTrack = book.findTrackAtTime(initialPosition ?? Duration.zero);
    final indexTrack = book.tracks.indexOf(currentTrack);
    final positionInTrack = initialPosition != null
        ? initialPosition - currentTrack.startOffset
        : null;
    final api = ref.read(authenticatedApiProvider);

    final downloadManager = ref.read(simpleDownloadManagerProvider);
    print(downloadManager.basePath);

    final libItem =
        await ref.read(libraryItemProvider(book.libraryItemId).future);
    final downloadedUris = await downloadManager.getDownloadedFilesUri(libItem);

    final bookSettings = ref.read(bookSettingsProvider(book.libraryItemId));
    var bookPlayerSettings = bookSettings.playerSettings;
    final start = bookSettings.playerSettings.skipChapterStart;
    final end = bookSettings.playerSettings.skipChapterEnd;
    final appPlayerSettings = ref.read(appSettingsProvider).playerSettings;
    final configurePlayerForEveryBook =
        appPlayerSettings.configurePlayerForEveryBook;
    List<AudioSource> audioSources =
        start > Duration.zero || end > Duration.zero
            ? book.tracks
                .map(
                  (track) => ClippingAudioSource(
                    child: AudioSource.uri(
                      _getUri(
                        track,
                        downloadedUris,
                        baseUrl: api.baseUrl,
                        token: api.token!,
                      ),
                    ),
                    start: start,
                    end: end > Duration.zero ? null : track.duration - end,
                  ),
                )
                .toList()
            : book.tracks
                .map(
                  (track) => AudioSource.uri(
                    _getUri(
                      track,
                      downloadedUris,
                      baseUrl: api.baseUrl,
                      token: api.token!,
                    ),
                  ),
                )
                .toList();
    await state
        .setAudioSources(
      audioSources,
      preload: true,
      initialIndex: indexTrack,
      initialPosition: positionInTrack,
    )
        .catchError((error) {
      _logger.shout('Error in setting audio source: $error');
      return null;
    });
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

  Uri _getUri(
    api.AudioTrack track,
    List<Uri>? downloadedUris, {
    required Uri baseUrl,
    required String token,
  }) {
    // check if the track is in the downloadedUris
    final uri = downloadedUris?.firstWhereOrNull(
      (element) {
        return element.pathSegments.last == track.metadata?.filename;
      },
    );

    return uri ??
        Uri.parse('${baseUrl.toString()}${track.contentUrl}?token=$token');
  }
}

/// 音频播放器 riverpod状态
@Riverpod(keepAlive: true)
class AbsPlayer extends _$AbsPlayer {
  @override
  core.AbsAudioPlayer build() {
    final audioPlayer = ref.watch(audioPlayerProvider);
    return audioPlayer;
  }

  Future<void> load(
    api.BookExpanded book, {
    Duration? initialPosition,
    bool play = true,
  }) async {
    if (state.book == book || state.book?.libraryItemId == book.libraryItemId) {
      state.playOrPause();
      return;
    }
    final api = ref.read(authenticatedApiProvider);

    final downloadManager = ref.read(simpleDownloadManagerProvider);
    print(downloadManager.basePath);

    final libItem =
        await ref.read(libraryItemProvider(book.libraryItemId).future);
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
Future<Duration?> currentTime(Ref ref, String libraryItemId) async {
  final me = await ref.watch(meProvider.future);
  final userProgress = me.mediaProgress
      ?.firstWhereOrNull((element) => element.libraryItemId == libraryItemId);
  return userProgress?.currentTime;
}

@riverpod
class CurrentBook extends _$CurrentBook {
  @override
  api.BookExpanded? build() {
    listenSelf((previous, next) {
      if (previous == null && next == null) {
        final activeLibraryItemId = AvailableHiveBoxes.basicBox
            .getAs<String>(CacheKey.activeLibraryItemId);
        if (activeLibraryItemId != null) {
          update(activeLibraryItemId, play: false);
        }
      }
    });
    return null;
  }
  // @override
  // api.BookExpanded? build() {
  //   final player = ref.read(absPlayerProvider);
  //   player.bookStream.listen((book) {
  //     if (book != state) {
  //       state = book;
  //     }
  //   });
  //   return player.book;
  // }

  Future<void> update(String libraryItemId, {bool play = true}) async {
    if (state?.libraryItemId == libraryItemId) {
      ref.read(audioPlayerProvider).playOrPause();
      return;
    }
    final book = await ref.read(libraryItemProvider(libraryItemId).future);
    state = book.media.asBookExpanded;
    final currentTime =
        await ref.read(currentTimeProvider(libraryItemId).future);
    await ref
        .read(absPlayerProvider.notifier)
        .load(state!, initialPosition: currentTime, play: play);
    if (play) {
      AvailableHiveBoxes.basicBox.put(
        CacheKey.activeLibraryItemId,
        libraryItemId,
      );
    }
  }
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
