import 'package:audio_service/audio_service.dart';
import 'package:vaani/features/player/core/abs_audio_player.dart';

// 对接audio_service
class AbsAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final AbsAudioPlayer _player;

  AbsAudioHandler(AbsAudioPlayer player) : _player = player {
    player.mediaItemStream.listen((item) {
      mediaItem.add(item);
    });
    // _player.playbackEventStream.map(_transformEvent).pipe(playbackState);

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
      playbackState.add(
        playbackState.value.copyWith(
          updatePosition: position,
        ),
      );
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
    await _player.play();
  }

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  @override
  Future<void> skipToNext() async {
    await _player.next();
  }

  @override
  Future<void> skipToPrevious() async {
    await _player.previous();
  }

  @override
  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  @override
  Future<void> setSpeed(double speed) async {
    await _player.setSpeed(speed);
  }

  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume);
  }

  // PlaybackState _transformEvent(PlaybackEvent event) {
  //   return PlaybackState(
  //     controls: [
  //       if (kIsWeb || !Platform.isAndroid) MediaControl.skipToPrevious,
  //       MediaControl.rewind,
  //       if (_player.playing) MediaControl.pause else MediaControl.play,
  //       MediaControl.stop,
  //       MediaControl.fastForward,
  //       if (kIsWeb || !Platform.isAndroid) MediaControl.skipToNext
  //     ],
  //     systemActions: {
  //       if (kIsWeb || !Platform.isAndroid) MediaAction.skipToPrevious,
  //       MediaAction.rewind,
  //       if (!(_settingsProvider?['lockSeekingNotification'] ?? false))
  //         MediaAction.seek,
  //       MediaAction.fastForward,
  //       MediaAction.stop,
  //       MediaAction.setSpeed,
  //       if (kIsWeb || !Platform.isAndroid) MediaAction.skipToNext
  //     },
  //     androidCompactActionIndices: const [1, 2, 3],
  //     processingState: const {
  //       ProcessingState.idle: AudioProcessingState.idle,
  //       ProcessingState.loading: AudioProcessingState.loading,
  //       ProcessingState.buffering: AudioProcessingState.buffering,
  //       ProcessingState.ready: AudioProcessingState.ready,
  //       ProcessingState.completed: AudioProcessingState.completed,
  //     }[_player.processingState]!,
  //     playing: _player.playing,
  //     updatePosition: position,
  //     bufferedPosition: _player.bufferedPosition,
  //     speed: _player.speed,
  //     queueIndex: event.currentIndex,
  //     captioningEnabled: false,
  //   );
  // }
}
