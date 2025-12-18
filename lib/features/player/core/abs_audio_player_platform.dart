import 'package:just_audio/just_audio.dart';
import 'package:just_audio_media_kit/just_audio_media_kit.dart';
import 'package:logging/logging.dart';
import 'package:vaani/features/player/core/abs_audio_player.dart';
import 'package:vaani/shared/extensions/chapter.dart';

final _logger = Logger('AbsPlatformAudioPlayer');

/// 音频播放器 平台ios,macos,android (just_audio)
class AbsPlatformAudioPlayer extends AbsAudioPlayer {
  late final AudioPlayer _player;
  AbsPlatformAudioPlayer() {
    // 跳转到播放列表指定条目指定位置
    // prefetch-playlist=yes
    JustAudioMediaKit.prefetchPlaylist = true;
    // merge-files=yes
    // cache=yes
    // cache-pause-wait=60

    JustAudioMediaKit.ensureInitialized();
    _player = AudioPlayer();
    _player.playerStateStream.listen((state) {
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
    positionStream.listen((position) {
      final chapter = currentChapter;
      if (positionInBook <= (chapter?.start ?? Duration.zero) ||
          positionInBook >= (chapter?.end ?? Duration.zero)) {
        final chapter = book?.findChapterAtTime(positionInBook);
        if (chapter != currentChapter) {
          print('当前章节时长: ${currentChapter?.duration}');
          print('切换章节时长: ${chapter?.duration}');
          print('当前播放音轨时长: ${_player.duration}');
          chapterStreamController.add(chapter);
        }
      }
    });
  }
  @override
  Duration get bufferedPosition => _player.bufferedPosition;

  @override
  Stream<Duration> get bufferedPositionStream => _player.bufferedPositionStream
      .where(
        (_) => _player.playerState.processingState == ProcessingState.buffering,
      )
      .asBroadcastStream();

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
  Duration get position => _addClippingStart(_player.position);

  Duration _addClippingStart(Duration position, {bool add = true}) {
    if (_player.sequenceState.currentSource != null &&
        _player.sequenceState.currentSource is ClippingAudioSource) {
      final currentSource =
          _player.sequenceState.currentSource as ClippingAudioSource;
      if (currentSource.start != null) {
        return add
            ? position + currentSource.start!
            : position - currentSource.start!;
      }
    }
    return position;
  }

  @override
  Stream<Duration> get positionStream =>
      _player.positionStream.where((_) => _player.playing).map((position) {
        return _addClippingStart(position);
      });

  @override
  Future<void> seek(Duration position, {int? index}) async {
    await _player.seek(_addClippingStart(position, add: false), index: index);
  }

  @override
  Future<void> setPlayList(
    List<(Uri, Duration)> playlist, {
    int? index,
    Duration? position,
    Duration? start,
    Duration? end,
  }) async {
    List<AudioSource> audioSources = start != null && start > Duration.zero ||
            end != null && end > Duration.zero
        ? playlist
            .map(
              (item) => ClippingAudioSource(
                child: AudioSource.uri(item.$1),
                start: start,
                end: end == null ? null : item.$2 - end,
              ),
            )
            .toList()
        : playlist.map((item) => AudioSource.uri(item.$1)).toList();
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
