import 'package:just_audio/just_audio.dart';
import 'package:logging/logging.dart';
import 'package:vaani/shared/audio_player.dart';

final _logger = Logger('AbsPlatformAudioPlayer');

class AbsPlatformAudioPlayer extends AbsAudioPlayer {
  final AudioPlayer player = AudioPlayer();
  AbsPlatformAudioPlayer() {
    player.playerStateStream.listen((state) {
      playerStateSubject.add(
        playerState.copyWith(
          playing: state.playing,
          processingState: {
            ProcessingState.idle: AbsProcessingState.idle,
            ProcessingState.buffering: AbsProcessingState.buffering,
            ProcessingState.completed: AbsProcessingState.completed,
            ProcessingState.loading: AbsProcessingState.loading,
            ProcessingState.ready: AbsProcessingState.ready,
          }[state.processingState],
        ),
      );
    });
  }
  @override
  Duration get bufferedPosition => player.bufferedPosition;

  @override
  Stream<Duration> get bufferedPositionStream => player.bufferedPositionStream;

  @override
  int get currentIndex => player.currentIndex ?? 0;

  @override
  Future<void> pause() async {
    await player.pause();
  }

  @override
  Future<void> play() async {
    await player.play();
  }

  @override
  Future<void> playOrPause() async {
    player.playing ? await player.pause() : await player.play();
  }

  @override
  Stream<bool> get playingStream => player.playingStream;

  @override
  Duration get position => player.position;

  @override
  Stream<Duration> get positionStream => player.positionStream;

  @override
  Future<void> seek(Duration position, {int? index}) async {
    await player.seek(position, index: index);
  }

  @override
  Future<void> setPlayList(
    List<Uri> playlist, {
    int? index,
    Duration? position,
  }) async {
    List<AudioSource> audioSources =
        playlist.map((uri) => AudioSource.uri(uri)).toList();
    await player
        .setAudioSources(
      audioSources,
      preload: true,
      initialIndex: index,
      initialPosition: position,
    )
        .catchError((error) {
      _logger.shout('Error in setting audio source: $error');
      return null;
    });
  }

  @override
  Future<void> setSpeed(double speed) async {
    await player.setSpeed(speed);
  }

  @override
  Future<void> setVolume(double volume) async {
    await player.setVolume(volume);
  }

  @override
  double get speed => player.speed;
}
