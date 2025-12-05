import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio_media_kit/just_audio_media_kit.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/features/player/core/abs_audio_handler.dart' as core;
import 'package:vaani/features/player/core/abs_audio_player.dart' as core;

part 'abs_provider.g.dart';

final _logger = Logger('AbsPlayerProvider');

@Riverpod(keepAlive: true)
Future<core.AbsAudioHandler> absAudioHandler(Ref ref) async {
  // for playing audio on windows, linux
  JustAudioMediaKit.ensureInitialized();

  // for configuring how this app will interact with other audio apps
  final session = await AudioSession.instance;
  await session.configure(const AudioSessionConfiguration.speech());

  final player = ref.read(absAudioPlayerProvider);

  final audioService = await AudioService.init(
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

  return audioService;
}

@Riverpod(keepAlive: true)
class AbsAudioPlayer extends _$AbsAudioPlayer {
  @override
  core.AbsAudioPlayer build() {
    final player = core.AbsAudioPlayer();

    ref.onDispose(player.dispose);
    _logger.finer('created simple player');

    return player;
  }
}
