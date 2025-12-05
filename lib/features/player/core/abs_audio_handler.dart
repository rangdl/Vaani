import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AbsAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final AudioPlayer player;

  AbsAudioHandler(this.player);

  // 播放控制方法重写
  @override
  Future<void> play() async {
    await player.play();
  }

  @override
  Future<void> pause() async {
    await player.pause();
  }

  @override
  Future<void> skipToNext() async {
    await player.seekToNext();
  }

  @override
  Future<void> skipToPrevious() async {
    await player.seekToPrevious();
  }

  @override
  Future<void> seek(Duration position) async {
    await player.seek(position);
  }

  @override
  Future<void> setSpeed(double speed) async {
    await player.setSpeed(speed);
  }
}
