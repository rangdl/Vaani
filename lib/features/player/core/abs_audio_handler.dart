import 'package:audio_service/audio_service.dart';
import 'package:media_kit/media_kit.dart';

class AbsAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final Player player = Player();

  AbsAudioHandler() {
    // 1. 转发播放/暂停状态
    player.stream.playing.listen((bool playing) {
      playbackState.add(playbackState.value.copyWith(
        playing: playing,
        // 根据 playing 和实际情况更新 processingState
        processingState:
            playing ? AudioProcessingState.ready : AudioProcessingState.idle,
      ));
    });
    // 2. 转发播放位置
    player.stream.position.listen((Duration position) {
      playbackState.add(playbackState.value.copyWith(
        updatePosition: position,
      ));
    });
    // 3. 转发媒体总时长
    player.stream.duration.listen((Duration? duration) {
      // 当有新的媒体加载时，更新 mediaItem 的 duration
      final currentItem = mediaItem.value;
      if (currentItem != null && duration != null) {
        mediaItem.add(currentItem.copyWith(duration: duration));
      }
    });
    player.stream.completed.listen((bool playing) {
      print('播放完成');
    });
  }

  Future<void> playOrPause() async {
    await player.playOrPause();
  }

  Future<void> setMediaItem(MediaItem mediaItem) async {
    this.mediaItem.add(mediaItem);
    await player.open(Media(mediaItem.id), play: false);
    // ignore: unnecessary_null_comparison
    await player.stream.duration.firstWhere((d) => d != null);
  }

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
    await player.next();
  }

  @override
  Future<void> skipToPrevious() async {
    await player.previous();
  }

  @override
  Future<void> seek(Duration position) async {
    await player.seek(position);
  }

  @override
  Future<void> setSpeed(double speed) async {
    await player.setRate(speed);
  }

  Future<void> setVolume(double volume) async {
    await player.setVolume(volume);
  }
}
