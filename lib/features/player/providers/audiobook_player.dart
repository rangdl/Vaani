import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
// import 'package:just_audio_media_kit/just_audio_media_kit.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vaani/features/player/core/audiobook_player.dart';

part 'audiobook_player.g.dart';

@Riverpod(keepAlive: true)
Future<AbsAudioHandler> audioHandlerInit(Ref ref) async {
  // for playing audio on windows, linux
  // JustAudioMediaKit.ensureInitialized();

  // for configuring how this app will interact with other audio apps
  final session = await AudioSession.instance;
  await session.configure(const AudioSessionConfiguration.speech());

  final audioService = AudioService.init(
    builder: () => AbsAudioHandler(ref),
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
  return audioService;
}

@Riverpod(keepAlive: true)
class Player extends _$Player {
  @override
  AbsAudioHandler build() {
    return ref.watch(audioHandlerInitProvider).requireValue;
  }
}

// @Riverpod(keepAlive: true)
// class Session extends _$Session {
//   @override
//   core.PlaybackSessionExpanded? build() {
//     return null;
//   }

//   Future<void> load(String id, String? episodeId) async {
//     final audioService = ref.read(playerProvider);
//     await audioService.pause();
//     ref.read(playerStatusProvider.notifier).setLoading(id);
//     final api = ref.read(authenticatedApiProvider);
//     final playBack = await ref.watch(playBackSessionProvider(id).future);
//     if (playBack == null) {
//       return;
//     }
//     state = playBack.asExpanded;
//     final downloadManager = ref.read(simpleDownloadManagerProvider);
//     final libItem =
//         await ref.read(libraryItemProvider(state!.libraryItemId).future);
//     final downloadedUris = await downloadManager.getDownloadedFilesUri(libItem);

//     var bookPlayerSettings =
//         ref.read(bookSettingsProvider(state!.libraryItemId)).playerSettings;
//     var appPlayerSettings = ref.read(appSettingsProvider).playerSettings;

//     var configurePlayerForEveryBook =
//         appPlayerSettings.configurePlayerForEveryBook;

//     await Future.wait([
//       audioService.setSourceAudiobook(
//         state!.asExpanded,
//         baseUrl: api.baseUrl,
//         token: api.token!,
//         downloadedUris: downloadedUris,
//       ),
//       // set the volume
//       audioService.setVolume(
//         configurePlayerForEveryBook
//             ? bookPlayerSettings.preferredDefaultVolume ??
//                 appPlayerSettings.preferredDefaultVolume
//             : appPlayerSettings.preferredDefaultVolume,
//       ),
//       // set the speed
//       audioService.setSpeed(
//         configurePlayerForEveryBook
//             ? bookPlayerSettings.preferredDefaultSpeed ??
//                 appPlayerSettings.preferredDefaultSpeed
//             : appPlayerSettings.preferredDefaultSpeed,
//       ),
//     ]);
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
