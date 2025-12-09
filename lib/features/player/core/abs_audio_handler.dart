import 'package:audio_service/audio_service.dart';
import 'package:vaani/features/player/core/abs_audio_player.dart';

// 对接audio_service
class AbsAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final AbsAudioPlayer player;

  AbsAudioHandler(this.player) {
    player.mediaItemStream.listen((item) {
      mediaItem.add(item);
    });
    playbackState.add(
      playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          // if (player.state.playing) MediaControl.pause else MediaControl.play,
          // MediaControl.rewind,
          // MediaControl.fastForward,
          MediaControl.skipToNext,
          MediaControl.stop,
        ],
        systemActions: {
          MediaAction.play,
          MediaAction.pause,
          MediaAction.seek,
          MediaAction.seekForward,
          MediaAction.seekBackward,
        },
      ),
    );

    // 1. 转发播放/暂停状态
    player.playerStateStream.listen((playerState) {
      playbackState.add(
        playbackState.value.copyWith(
          playing: playerState.playing,
          // 根据 playing 和实际情况更新 processingState
          processingState: const {
                AbsProcessingState.idle: AudioProcessingState.idle,
                AbsProcessingState.loading: AudioProcessingState.loading,
                AbsProcessingState.buffering: AudioProcessingState.buffering,
                AbsProcessingState.ready: AudioProcessingState.ready,
                AbsProcessingState.completed: AudioProcessingState.completed,
              }[playerState.processingState] ??
              AudioProcessingState.idle,
        ),
      );
    });
    // 2. 转发播放位置
    player.positionStream.listen((Duration position) {
      playbackState.add(playbackState.value.copyWith(
        updatePosition: position,
      ));
    });
    // 3. 转发媒体总时长
    // player.stream.duration.listen((Duration? duration) {
    //   // 当有新的媒体加载时，更新 mediaItem 的 duration
    //   final currentItem = mediaItem.value;
    //   if (currentItem != null && duration != null) {
    //     mediaItem.add(currentItem.copyWith(duration: duration));
    //   }
    // });
    // player.stream.completed.listen((bool playing) {
    //   print('播放完成');
    // });
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
    await player.setSpeed(speed);
  }

  Future<void> setVolume(double volume) async {
    await player.setVolume(volume);
  }
}
