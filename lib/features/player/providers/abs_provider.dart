import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:media_kit/media_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart' as api;
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/api/library_item_provider.dart';
import 'package:vaani/features/downloads/providers/download_manager.dart';
import 'package:vaani/features/per_book_settings/providers/book_settings_provider.dart';
import 'package:vaani/features/player/core/abs_audio_handler.dart' as core;
import 'package:vaani/features/player/core/abs_audio_player.dart' as core;
import 'package:vaani/features/player/core/audiobook_player.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/shared/extensions/chapter.dart';

part 'abs_provider.g.dart';

final _logger = Logger('AbsPlayerProvider');

@Riverpod(keepAlive: true)
Future<core.AbsAudioHandler> absAudioHandlerInit(Ref ref) async {
  // for playing audio on windows, linux
  MediaKit.ensureInitialized();
  // for configuring how this app will interact with other audio apps
  final session = await AudioSession.instance;
  await session.configure(const AudioSessionConfiguration.speech());

  final audioService = await AudioService.init(
    builder: () => core.AbsAudioHandler(ref),
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

@Riverpod(keepAlive: true)
class AbsPlayer extends _$AbsPlayer {
  @override
  core.AbsAudioHandler build() {
    return ref.read(absAudioHandlerInitProvider).valueOrNull!;
  }
}

@Riverpod(keepAlive: true)
class AbsState extends _$AbsState {
  @override
  core.AbsPlayerState build() {
    return core.AbsPlayerState();
  }

  // 加载书籍
  Future<void> load(api.BookExpanded book, Duration? currentTime) async {
    final player = ref.read(absPlayerProvider);
    if (state.book == book || state.book?.libraryItemId == book.libraryItemId) {
      appLogger.info('Book was already set');
      player.playOrPause();
      return;
    }

    final appSettings = ref.read(appSettingsProvider);
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
    final trackToPlay = book.findTrackAtTime(currentTime ?? Duration.zero);
    final chapterToPlay = book.findChapterAtTime(currentTime ?? Duration.zero);
    final initialIndex = book.tracks.indexOf(trackToPlay);
    final initialPositionInTrack =
        currentTime != null ? currentTime - trackToPlay.startOffset : null;
    final album = appSettings.notificationSettings.primaryTitle
        .formatNotificationTitle(book);
    final artlist = appSettings.notificationSettings.secondaryTitle
        .formatNotificationTitle(book);

    final id = _getUri(trackToPlay, downloadedUris,
            baseUrl: api.baseUrl, token: api.token!)
        .toString();
    final item = MediaItem(
      id: id,
      title: chapterToPlay.title,
      album: album,
      artist: artlist,
      duration: chapterToPlay.duration,
      artUri: Uri.parse(
        '${api.baseUrl}/api/items/${book.libraryItemId}/cover?token=${api.token!}',
      ),
    );

    state = state.copyWith(
      book: book,
      currentChapter: chapterToPlay,
      currentIndex: initialIndex,
    );
    player.playMediaItem(item);
    await Future.wait([
      player.setMediaItem(item),
      // player.setVolume(
      //   configurePlayerForEveryBook
      //       ? bookPlayerSettings.preferredDefaultVolume ??
      //           appPlayerSettings.preferredDefaultVolume
      //       : appPlayerSettings.preferredDefaultVolume,
      // ),
      player.setSpeed(
        configurePlayerForEveryBook
            ? bookPlayerSettings.preferredDefaultSpeed ??
                appPlayerSettings.preferredDefaultSpeed
            : appPlayerSettings.preferredDefaultSpeed,
      ),
      player.play(),
    ]);

    // player.setSourceAudiobook(
    //   book,
    //   baseUrl: api.baseUrl,
    //   token: api.token!,
    //   initialPosition: currentTime,
    //   downloadedUris: downloadedUris,
    //   volume: configurePlayerForEveryBook
    //       ? bookPlayerSettings.preferredDefaultVolume ??
    //           appPlayerSettings.preferredDefaultVolume
    //       : appPlayerSettings.preferredDefaultVolume,
    //   speed: configurePlayerForEveryBook
    //       ? bookPlayerSettings.preferredDefaultSpeed ??
    //           appPlayerSettings.preferredDefaultSpeed
    //       : appPlayerSettings.preferredDefaultSpeed,
    // );
  }

  Future<void> next() async {}

  Future<void> previous() async {}
  void updataPlaying(bool playing) {
    state = state.copyWith(playing: playing);
  }

  Stream<Duration> get positionStreamInChapter {
    final player = ref.read(absPlayerProvider);

    return player.stream.position.distinct().map((position) {
      return position +
          (state.book?.tracks[state.currentIndex].startOffset ??
              Duration.zero) -
          (state.currentChapter?.start ?? Duration.zero);
    });
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

@riverpod
Stream<Duration> positionChapter(Ref ref) {
  return ref.watch(absStateProvider.notifier).positionStreamInChapter;
}
