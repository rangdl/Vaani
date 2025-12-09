import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:vaani/features/player/core/abs_audio_handler.dart' as core;
import 'package:vaani/features/player/core/abs_audio_player.dart';
import 'package:vaani/globals.dart';

/// 音频播放器 配置
Future<void> configurePlayer(AbsAudioPlayer player) async {
  // for playing audio on windows, linux

  // for configuring how this app will interact with other audio apps
  final session = await AudioSession.instance;
  await session.configure(const AudioSessionConfiguration.speech());

  await AudioService.init(
    builder: () => core.AbsAudioHandler(player),
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
