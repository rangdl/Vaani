import 'dart:async';

import 'package:media_kit/media_kit.dart' hide PlayerState;
import 'package:vaani/shared/audio_player.dart';

class AbsMpvAudioPlayer extends AbsAudioPlayer {
  final player = Player();
  AbsMpvAudioPlayer() {
    player.stream.playing.listen((playing) {
      final state = playerState;
      playerStateSubject.add(
        state.copyWith(
          playing: playing,
          processingState: playing
              ? state.processingState == ProcessingState.idle
                  ? ProcessingState.ready
                  : state.processingState
              : player.state.buffering
                  ? ProcessingState.buffering
                  : player.state.completed
                      ? ProcessingState.completed
                      : ProcessingState.ready,
        ),
      );
    });
  }
  @override
  Stream<Duration> get bufferedPositionInBookStream => player.stream.buffer;

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
  Duration get position => player.state.position;

  @override
  Stream<Duration> get positionStream => player.stream.position;

  @override
  Future<void> seek(Duration position, {int? index}) async {
    if (index != null) {
      await player.jump(index);
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
    await player.setVolume(volume);
  }

  @override
  Stream<bool> get playingStream => player.stream.playing;

  @override
  // TODO: implement speed
  double get speed => player.state.rate;

  @override
  // TODO: implement bufferedPosition
  Duration get bufferedPosition => player.state.buffer;

  @override
  // TODO: implement bufferedPositionStream
  Stream<Duration> get bufferedPositionStream => player.stream.buffer;
}
