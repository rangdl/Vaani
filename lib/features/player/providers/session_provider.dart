import 'package:audio_service/audio_service.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_media_kit/just_audio_media_kit.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart' as core;
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/api/library_item_provider.dart';
import 'package:vaani/features/downloads/providers/download_manager.dart';
import 'package:vaani/features/per_book_settings/providers/book_settings_provider.dart';
import 'package:vaani/features/player/core/audiobook_player_session.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/settings/app_settings_provider.dart';
import 'package:vaani/shared/extensions/obfuscation.dart';

part 'session_provider.g.dart';

class SessionPlayer {
  late final AbsAudioHandler _audioService;
  core.PlaybackSessionExpanded? _session;
  Ref ref;
  SessionPlayer(this.ref);
  void setAudioService(AbsAudioHandler audioPlayer) {
    _audioService = audioPlayer;
  }

  Future<void> load(String id, String? episodeId) async {
    ref.read(sessionLoadingProvider(id).notifier).setLoading();
    final api = ref.read(authenticatedApiProvider);
    final playBack = await api.items.play(
      libraryItemId: id,
      parameters: core.PlayItemReqParams(
        deviceInfo: core.DeviceInfoReqParams(
          clientVersion: appVersion,
          manufacturer: deviceManufacturer,
          model: deviceModel,
          sdkVersion: deviceSdkVersion,
          clientName: appName,
          deviceName: deviceName,
        ),
        forceDirectPlay: false,
        forceTranscode: false,
        supportedMimeTypes: [
          "audio/flac",
          "audio/mpeg",
          "audio/mp4",
          "audio/ogg",
          "audio/aac",
          "audio/webm",
        ],
      ),
      responseErrorHandler: _responseErrorHandler,
    ) as core.PlaybackSessionExpanded;

    final downloadManager = ref.read(simpleDownloadManagerProvider);
    final libItem =
        await ref.read(libraryItemProvider(playBack.libraryItemId).future);
    final downloadedUris = await downloadManager.getDownloadedFilesUri(libItem);

    var bookPlayerSettings =
        ref.read(bookSettingsProvider(playBack.libraryItemId)).playerSettings;
    var appPlayerSettings = ref.read(appSettingsProvider).playerSettings;

    var configurePlayerForEveryBook =
        appPlayerSettings.configurePlayerForEveryBook;

    await Future.wait([
      _audioService.setSourceAudiobook(
        playBack,
        baseUrl: api.baseUrl,
        token: api.token!,
        downloadedUris: downloadedUris,
      ),
      // set the volume
      _audioService.setVolume(
        configurePlayerForEveryBook
            ? bookPlayerSettings.preferredDefaultVolume ??
                appPlayerSettings.preferredDefaultVolume
            : appPlayerSettings.preferredDefaultVolume,
      ),
      // set the speed
      _audioService.setSpeed(
        configurePlayerForEveryBook
            ? bookPlayerSettings.preferredDefaultSpeed ??
                appPlayerSettings.preferredDefaultSpeed
            : appPlayerSettings.preferredDefaultSpeed,
      ),
    ]);
    _session = playBack;
    ref.read(sessionLoadingProvider(id).notifier).setLoaded();
    ref.notifyListeners();
  }

  AbsAudioHandler get audioService => _audioService;
  core.PlaybackSession? get session => _session;

  void _responseErrorHandler(http.Response response, [error]) {
    if (response.statusCode != 200) {
      appLogger.severe('Error with api: ${response.obfuscate()}, $error');
      throw PlaybackSyncError(
        'Error syncing position: ${response.body}, $error',
      );
    }
  }
}

@Riverpod(keepAlive: true)
class Player extends _$Player {
  @override
  AbsAudioHandler build() {
    final audioService = ref.watch(sessionProvider).audioService;
    // audioService.positionStream.listen((position){

    // });
    return audioService;
  }

  Future<void> togglePlayPause() => state.togglePlayPause();
  Future<void> play() => state.play();
  Future<void> pause() => state.pause();
  Future<void> seekInBook(Duration globalPosition) =>
      state.seekInBook(globalPosition);
}

@Riverpod(keepAlive: true)
SessionPlayer session(Ref ref) {
  return SessionPlayer(ref);
}

@Riverpod(keepAlive: true)
class SessionLoading extends _$SessionLoading {
  @override
  bool build(String itemId) {
    return false;
  }

  setLoading() {
    state = true;
  }

  setLoaded() {
    state = false;
  }
}

@Riverpod(keepAlive: true)
class PlayState extends _$PlayState {
  @override
  PlayerState build() {
    return PlayerState(false, ProcessingState.idle);
  }

  void setState(PlayerState playerState) {
    state = playerState;
  }
}

@riverpod
core.BookChapter? currentChapter(Ref ref) {
  return ref.watch(playerProvider.select((v) => v.currentChapter));
}

@Riverpod(keepAlive: true)
Future<AbsAudioHandler> audioHandlerInit(Ref ref) async {
  // JustAudioMediaKit.ensureInitialized(windows: false);
  JustAudioMediaKit.ensureInitialized();
  final audioService = await AudioService.init(
    builder: () => AbsAudioHandler(ref),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.vaani.rang.channel.audio',
      androidNotificationChannelName: 'ABSPlayback',
      androidNotificationChannelDescription:
          'Needed to control audio from lock screen',
      androidNotificationOngoing: false,
      androidStopForegroundOnPause: false,
      androidNotificationIcon: 'drawable/ic_stat_logo',
      preloadArtwork: true,
    ),
  );
  ref.read(sessionProvider).setAudioService(audioService);
  return audioService;
}

// @Riverpod(keepAlive: true)
// class PlaybackReporter extends _$PlaybackReporter {
//   @override
//   Future<core.PlaybackReporter> build() async {
//     final playerSettings = ref.watch(appSettingsProvider).playerSettings;
//     final player = ref.watch(playerProvider);
//     final session = ref.watch(sessionProvider.select((v) => v.session));
//     final api = ref.watch(authenticatedApiProvider);

//     final reporter = core.PlaybackReporter(
//       player.player,
//       api,
//       reportingInterval: playerSettings.playbackReportInterval,
//       markCompleteWhenTimeLeft: playerSettings.markCompleteWhenTimeLeft,
//       minimumPositionForReporting: playerSettings.minimumPositionForReporting,
//       session: session,
//     );
//     ref.onDispose(reporter.dispose);
//     return reporter;
//   }
// }

class PlaybackSyncError implements Exception {
  String message;

  PlaybackSyncError([this.message = 'Error syncing playback']);

  @override
  String toString() {
    return 'PlaybackSyncError: $message';
  }
}
