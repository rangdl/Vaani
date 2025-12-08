import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:vaani/features/player/core/abs_audio_handler.dart' as core;
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/globals.dart';

Future<void> configurePlayer(ProviderContainer container) async {
  // for playing audio on windows, linux
  MediaKit.ensureInitialized();
  // for configuring how this app will interact with other audio apps
  final session = await AudioSession.instance;
  await session.configure(const AudioSessionConfiguration.speech());

  await AudioService.init(
    builder: () => core.AbsAudioHandler(container.read(absAudioPlayerProvider)),
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

  appLogger.finer('created simple player');
}
