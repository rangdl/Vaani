import 'package:just_audio/just_audio.dart';
import 'package:just_audio_media_kit/just_audio_media_kit.dart';
import 'package:logging/logging.dart';
import 'package:vaani/features/player/core/abs_audio_player.dart';
import 'package:vaani/shared/extensions/chapter.dart';

final _logger = Logger('AbsPlatformAudioPlayer');

/// 音频播放器 平台ios,macos,android (just_audio)
class AbsPlatformAudioPlayer extends AbsAudioPlayer {
  late final AudioPlayer _player;
  AbsPlatformAudioPlayer(AudioPlayer player) {
    _player = player;
    // 跳转到播放列表指定条目指定位置
    // prefetch-playlist=yes
    JustAudioMediaKit.prefetchPlaylist = true;
    // merge-files=yes
    // cache=yes
    // cache-pause-wait=60

    JustAudioMediaKit.ensureInitialized();
    player = AudioPlayer();
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
    player.positionStream.distinct().listen((position) {
      final chapter = currentChapter;
      if (positionInBook <= (chapter?.start ?? Duration.zero) ||
          positionInBook <= (chapter?.end ?? Duration.zero)) {
        final chapter = book?.findChapterAtTime(positionInBook);
        if (chapter != currentChapter) {
          print('当前章节时长: ${currentChapter?.duration}');
          print('切换章节时长: ${chapter?.duration}');
          print('当前播放音轨时长: ${player.duration}');
          chapterStreamController.add(chapter);
        }
      }
    });
  }
  @override
  Duration get bufferedPosition => _player.bufferedPosition;

  @override
  Stream<Duration> get bufferedPositionStream => _player.bufferedPositionStream;

  @override
  int get currentIndex => _player.currentIndex ?? 0;

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  @override
  Future<void> play() async {
    await _player.play();
  }

  @override
  Future<void> playOrPause() async {
    _player.playing ? await _player.pause() : await _player.play();
  }

  @override
  Stream<bool> get playingStream => _player.playingStream;

  @override
  Duration get position => _player.position;

  @override
  Stream<Duration> get positionStream => _player.positionStream;

  @override
  Future<void> seek(Duration position, {int? index}) async {
    await _player.seek(position, index: index);
  }

  @override
  Future<void> setPlayList(
    List<Uri> playlist, {
    int? index,
    Duration? position,
  }) async {
    List<AudioSource> audioSources =
        playlist.map((uri) => AudioSource.uri(uri)).toList();
    await _player
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
    await _player.setSpeed(speed);
  }

  @override
  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume);
  }

  @override
  double get speed => _player.speed;

  @override
  void dispose() {
    super.dispose();
    _player.dispose();
  }
}
