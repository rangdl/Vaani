// my_audio_handler.dart
import 'package:audio_service/audio_service.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';

// add a small offset so the display does not show the previous chapter for a split second
final offset = Duration(milliseconds: 10);

class HookAudioHandler extends BaseAudioHandler {
  final AudioPlayer _player = AudioPlayer();
  final List<AudioSource> _playlist = [];
  final Ref ref;

  BookExpanded? _book;

  /// the authentication token to access the [AudioTrack.contentUrl]
  final String token;

  /// the base url for the audio files
  final Uri baseUrl;

  HookAudioHandler(this.ref, {required this.token, required this.baseUrl}) {
    _setupAudioPlayer();
  }

  void _setupAudioPlayer() {
    _player.setAudioSources(_playlist);

    // // 监听播放位置变化，更新全局位置
    // _player.positionStream.listen((position) {
    //   // _updateGlobalPosition(position);
    // });

    // // 监听音轨变化
    // _player.currentIndexStream.listen((index) {
    //   if (index != null) {
    //     _onTrackChanged(index);
    //   }
    // });

    // 转发播放状态
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
  }

  // 加载有声书
  Future<void> setSourceAudiobook(
    BookExpanded audiobook, {
    Duration? initialPosition,
    List<Uri>? downloadedUris,
  }) async {
    _book = audiobook;

    // 清空现有播放列表
    _playlist.clear();

    // 添加所有音轨
    for (final track in audiobook.tracks) {
      final audioSource = ProgressiveAudioSource(
        _getUri(track, downloadedUris, baseUrl: baseUrl, token: token),
        tag: MediaItem(
          id: '${audiobook.libraryItemId}${track.index}',
          title: track.title,
          duration: track.duration,
        ),
      );
      _playlist.add(audioSource);
    }

    // 初始化队列显示
    final mediaItems = audiobook.tracks
        .map(
          (track) => MediaItem(
            id: '${audiobook.libraryItemId}${track.index}',
            title: track.title,
            duration: track.duration,
          ),
        )
        .toList();

    queue.add(mediaItems);

    // 恢复上次播放位置（如果有）
    if (initialPosition != null) {
      await seekToPosition(initialPosition);
    }
  }

  // // 音轨切换处理
  // void _onTrackChanged(int trackIndex) {
  //   if (_book == null) return;

  //   // 可以在这里处理音轨切换逻辑，比如预加载下一音轨
  //   // print('切换到音轨: ${_book!.tracks[trackIndex].title}');
  // }

  // 核心功能：跳转到指定章节
  Future<void> skipToChapter(int chapterId) async {
    if (_book == null) return;

    final chapter = _book!.chapters.firstWhere(
      (ch) => ch.id == chapterId,
      orElse: () => throw Exception('Chapter not found'),
    );

    await seekToPosition(chapter.start + offset);
  }

  Duration get positionInBook {
    if (_book != null && _player.currentIndex != null) {
      return _book!.tracks[_player.currentIndex!].startOffset +
          _player.position;
    }
    return Duration.zero;
  }

  // 当前音轨
  AudioTrack? get currentTrack {
    if (_book == null) {
      return null;
    }
    return _book!.findTrackAtTime(positionInBook);
  }

  // 当前章节
  BookChapter? get currentChapter {
    if (_book == null) {
      return null;
    }
    return _book!.findChapterAtTime(positionInBook);
  }

  // 播放控制方法
  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  // 重写上一曲/下一曲为章节导航
  @override
  Future<void> skipToNext() async {
    if (_book == null) {
      // 回退到默认行为
      return _player.seekToNext();
    }
    final chapter = currentChapter;
    if (chapter == null) {
      // 回退到默认行为
      return _player.seekToNext();
    }
    final currentIndex = _book!.chapters.indexOf(chapter);
    if (currentIndex < _book!.chapters.length - 1) {
      // 跳到下一章
      final nextChapter = _book!.chapters[currentIndex + 1];
      await skipToChapter(nextChapter.id);
    }
  }

  @override
  Future<void> skipToPrevious() async {
    if (_book == null) {
      return _player.seekToPrevious();
    }

    final chapter = currentChapter;
    if (chapter == null) {
      return _player.seekToPrevious();
    }
    final currentIndex = _book!.chapters.indexOf(chapter);
    if (currentIndex > 0) {
      // 跳到上一章
      final prevChapter = _book!.chapters[currentIndex - 1];
      await skipToChapter(prevChapter.id);
    } else {
      // 已经是第一章，回到开头
      await seekToPosition(Duration.zero);
    }
  }

  @override
  Future<void> seek(Duration position) async {
    // 这个 position 是当前音轨内的位置，我们不直接使用
    // 而是通过全局位置来控制
    final track = currentTrack;
    Duration startOffset = Duration.zero;
    if (track != null) {
      startOffset = track.startOffset;
    }
    await seekToPosition(startOffset + position);
  }

  // 核心功能：跳转到全局时间位置
  Future<void> seekToPosition(Duration globalPosition) async {
    if (_book == null) return;
    // 找到目标音轨和在音轨内的位置
    final track = _book!.findTrackAtTime(globalPosition);
    final index = _book!.tracks.indexOf(track);
    Duration positionInTrack = globalPosition - track.startOffset;
    if (positionInTrack <= Duration.zero) {
      positionInTrack = offset;
    }
    // 切换到目标音轨具体位置
    await _player.seek(positionInTrack, index: index);
  }

  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.skipToPrevious,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.skipToNext,
      ],
      processingState: const {
            ProcessingState.idle: AudioProcessingState.idle,
            ProcessingState.loading: AudioProcessingState.loading,
            ProcessingState.buffering: AudioProcessingState.buffering,
            ProcessingState.ready: AudioProcessingState.ready,
            ProcessingState.completed: AudioProcessingState.completed,
          }[_player.processingState] ??
          AudioProcessingState.idle,
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }
}

Uri _getUri(
  AudioTrack track,
  List<Uri>? downloadedUris, {
  required Uri baseUrl,
  required String token,
}) {
  // check if the track is in the downloadedUris
  final uri = downloadedUris?.firstWhereOrNull(
    (element) {
      return element.pathSegments.last == track.metadata?.filename;
    },
  );

  return uri ??
      Uri.parse('${baseUrl.toString()}${track.contentUrl}?token=$token');
}

extension BookExpandedExtension on BookExpanded {
  BookChapter findChapterAtTime(Duration position) {
    return chapters.firstWhere(
      (element) {
        return element.start <= position && element.end >= position + offset;
      },
      orElse: () => chapters.first,
    );
  }

  AudioTrack findTrackAtTime(Duration position) {
    return tracks.firstWhere(
      (element) {
        return element.startOffset <= position &&
            element.startOffset + element.duration >= position + offset;
      },
      orElse: () => tracks.first,
    );
  }

  Duration getTrackStartOffset(int index) {
    return tracks[index].startOffset;
  }
}
