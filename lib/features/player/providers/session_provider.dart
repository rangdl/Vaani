import 'package:audio_service/audio_service.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio_media_kit/just_audio_media_kit.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart' as core;
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/api/library_item_provider.dart';
import 'package:vaani/features/downloads/providers/download_manager.dart';
import 'package:vaani/features/per_book_settings/providers/book_settings_provider.dart';
import 'package:vaani/features/playback_reporting/core/playback_reporter_session.dart'
    as core;
import 'package:vaani/features/player/core/audiobook_player_session.dart';
import 'package:vaani/features/player/providers/player_status_provider.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/settings/app_settings_provider.dart';
import 'package:vaani/shared/extensions/obfuscation.dart';

part 'session_provider.g.dart';

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
  return audioService;
}

@Riverpod(keepAlive: true)
class Player extends _$Player {
  @override
  AbsAudioHandler build() {
    return ref.watch(audioHandlerInitProvider).requireValue;
  }
}

@Riverpod(keepAlive: true)
class Session extends _$Session {
  @override
  core.PlaybackSessionExpanded? build() {
    return null;
  }

  Future<void> load(String id, String? episodeId) async {
    final audioService = ref.read(playerProvider);
    await audioService.pause();
    ref.read(playerStatusProvider.notifier).setLoading(id);
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
    state = playBack;
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
      audioService.setSourceAudiobook(
        playBack,
        baseUrl: api.baseUrl,
        token: api.token!,
        downloadedUris: downloadedUris,
      ),
      // set the volume
      audioService.setVolume(
        configurePlayerForEveryBook
            ? bookPlayerSettings.preferredDefaultVolume ??
                appPlayerSettings.preferredDefaultVolume
            : appPlayerSettings.preferredDefaultVolume,
      ),
      // set the speed
      audioService.setSpeed(
        configurePlayerForEveryBook
            ? bookPlayerSettings.preferredDefaultSpeed ??
                appPlayerSettings.preferredDefaultSpeed
            : appPlayerSettings.preferredDefaultSpeed,
      ),
    ]);
  }

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
class CurrentChapter extends _$CurrentChapter {
  @override
  core.BookChapter? build() {
    final player = ref.watch(playerProvider);
    player.chapterStream.distinct().listen((chapter) {
      update(chapter);
    });
    return player.currentChapter;
  }

  void update(core.BookChapter? chapter) {
    if (state != chapter) {
      state = chapter;
    }
  }
}

@Riverpod(keepAlive: true)
class PlaybackReporter extends _$PlaybackReporter {
  @override
  Future<core.PlaybackReporter?> build() async {
    final session = ref.watch(sessionProvider);
    if (session == null) {
      return null;
    }
    final playerSettings = ref.watch(appSettingsProvider).playerSettings;
    final player = ref.watch(playerProvider);
    final api = ref.watch(authenticatedApiProvider);

    final reporter = core.PlaybackReporter(
      player,
      api,
      reportingInterval: playerSettings.playbackReportInterval,
      markCompleteWhenTimeLeft: playerSettings.markCompleteWhenTimeLeft,
      minimumPositionForReporting: playerSettings.minimumPositionForReporting,
      session: session,
    );
    ref.onDispose(reporter.dispose);
    return reporter;
  }
}

class PlaybackSyncError implements Exception {
  String message;

  PlaybackSyncError([this.message = 'Error syncing playback']);

  @override
  String toString() {
    return 'PlaybackSyncError: $message';
  }
}
