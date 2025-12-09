import 'dart:async';

import 'package:media_kit/media_kit.dart' hide PlayerState;
import 'package:vaani/features/player/core/abs_audio_player.dart';

/// 音频播放器 mpv全平台 (media_kit)
class AbsMpvAudioPlayer extends AbsAudioPlayer {
  late Player player;
  AbsMpvAudioPlayer() {
    MediaKit.ensureInitialized();
    player = Player();
    player.stream.playing.listen((playing) {
      final state = playerState;
      playerStateSubject.add(
        state.copyWith(
          playing: playing,
          processingState: playing
              ? state.processingState == AbsProcessingState.idle
                  ? AbsProcessingState.ready
                  : state.processingState
              : player.state.buffering
                  ? AbsProcessingState.buffering
                  : player.state.completed
                      ? AbsProcessingState.completed
                      : AbsProcessingState.ready,
        ),
      );
    });
  }
  @override
  Duration get bufferedPosition => player.state.buffer;

  @override
  Stream<Duration> get bufferedPositionStream => player.stream.buffer;

  @override
  int get currentIndex => player.state.playlist.index;

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
    await player.playOrPause();
  }

  @override
  Stream<bool> get playingStream => player.stream.playing;

  @override
  Duration get position => player.state.position;

  @override
  Stream<Duration> get positionStream => player.stream.position;

  @override
  Future<void> seek(Duration position, {int? index}) async {
    if (index != null) {
      final playing = this.playing;
      await player.jump(index);
      if (!playing) await player.pause();
    }
    await player.seek(position);
  }

  @override
  Future<void> setPlayList(
    List<Uri> playlist, {
    int? index,
    Duration? position,
  }) async {
    await player.open(
      Playlist(
        playlist.map((uri) => Media(uri.toString())).toList(),
        index: index ?? 0,
      ),
      play: false,
    );
    // 等待open方法加载完成
    // ignore: unnecessary_null_comparison
    await player.stream.duration.firstWhere((d) => d != null);
    if (position != null) {
      await player.seek(position);
    }
  }

  @override
  Future<void> setSpeed(double speed) async {
    await player.setRate(speed);
  }

  @override
  Future<void> setVolume(double volume) async {
    await player.setVolume(volume * 100);
  }

  @override
  double get speed => player.state.rate;
}
