// my_audio_handler.dart
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/features/player/providers/session_provider.dart';
import 'package:vaani/shared/extensions/chapter.dart';

// add a small offset so the display does not show the previous chapter for a split second
final offset = Duration(milliseconds: 10);

class AbsAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final AudioPlayer _player = AudioPlayer();
  // final List<AudioSource> _playlist = [];
  final Ref ref;

  PlaybackSessionExpanded? _session;

  AbsAudioHandler(this.ref) {
    _setupAudioPlayer();
  }

  void _setupAudioPlayer() {
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
    _player.playerStateStream.distinct().listen((event) {
      ref.read(playStateProvider.notifier).setState(event);
    });
  }

  // 加载有声书
  Future<void> setSourceAudiobook(
    PlaybackSessionExpanded playbackSession, {
    required Uri baseUrl,
    required String token,
    List<Uri>? downloadedUris,
  }) async {
    _session = playbackSession;

    // 添加所有音轨
    List<AudioSource> audioSources = [];
    for (final track in playbackSession.audioTracks) {
      audioSources.add(
        AudioSource.uri(
          _getUri(track, downloadedUris, baseUrl: baseUrl, token: token),
        ),
      );
    }

    playMediaItem(
      MediaItem(
        id: playbackSession.libraryItemId,
        album: playbackSession.mediaMetadata.title,
        title: playbackSession.displayTitle,
        displaySubtitle: playbackSession.mediaType == MediaType.book
            ? (playbackSession.mediaMetadata as BookMetadata).subtitle
            : null,
        duration: playbackSession.duration,
        artUri: Uri.parse(
          '$baseUrl/api/items/${playbackSession.libraryItemId}/cover?token=$token',
        ),
      ),
    );
    final track = playbackSession.findTrackAtTime(playbackSession.currentTime);
    final index = playbackSession.audioTracks.indexOf(track);

    await _player.setAudioSources(
      audioSources,
      initialIndex: index,
      initialPosition: playbackSession.currentTime - track.startOffset,
    );
    _player.seek(playbackSession.currentTime - track.startOffset, index: index);
    await play();
    // 恢复上次播放位置（如果有）
    // if (initialPosition != null) {
    //   await seekInBook(initialPosition);
    // }
  }

  // // 音轨切换处理
  // void _onTrackChanged(int trackIndex) {
  //   if (_book == null) return;

  //   // 可以在这里处理音轨切换逻辑，比如预加载下一音轨
  //   // print('切换到音轨: ${_book!.tracks[trackIndex].title}');
  // }

  // 核心功能：跳转到指定章节
  Future<void> skipToChapter(int chapterId) async {
    if (_session == null) return;

    final chapter = _session!.chapters.firstWhere(
      (ch) => ch.id == chapterId,
      orElse: () => throw Exception('Chapter not found'),
    );

    await seekInBook(chapter.start + offset);
  }

  Duration get positionInBook {
    if (_session != null && _player.currentIndex != null) {
      return _session!.audioTracks[_player.currentIndex!].startOffset +
          _player.position;
    }
    return Duration.zero;
  }

  // 当前音轨
  AudioTrack? get currentTrack {
    if (_session == null) {
      return null;
    }
    return _session!.findTrackAtTime(positionInBook);
  }

  // 当前章节
  BookChapter? get currentChapter {
    if (_session == null) {
      return null;
    }
    return _session!.findChapterAtTime(positionInBook);
  }

  Duration? get chapterDuration => currentChapter?.duration;
  Stream<Duration> get positionStream => _player.positionStream;
  Stream<Duration> get positionStreamInChapter {
    return _player.positionStream.map((position) {
      final currentIndex = _player.currentIndex;
      if (_session == null || currentIndex == null) {
        return Duration.zero;
      }
      final globalPosition =
          position + _session!.audioTracks[currentIndex].startOffset;
      final chapter = _session!.findChapterAtTime(globalPosition);
      return globalPosition - chapter.start;
    });
  }

  Future<void> togglePlayPause() {
    // check if book is set
    if (_session == null) {
      return Future.value();
    }

    return switch (_player.playerState) {
      PlayerState(playing: var isPlaying) => isPlaying ? pause() : play(),
    };
  }

  // 播放控制方法
  @override
  Future<void> play() async {
    await _player.play();
  }

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  // 重写上一曲/下一曲为章节导航
  @override
  Future<void> skipToNext() async {
    if (_session == null) {
      // 回退到默认行为
      return _player.seekToNext();
    }
    final chapter = currentChapter;
    if (chapter == null) {
      // 回退到默认行为
      return _player.seekToNext();
    }
    final chapterIndex = _session!.chapters.indexOf(chapter);
    if (chapterIndex < _session!.chapters.length - 1) {
      // 跳到下一章
      final nextChapter = _session!.chapters[chapterIndex + 1];
      await skipToChapter(nextChapter.id);
    }
  }

  @override
  Future<void> skipToPrevious() async {
    if (_session == null) {
      return _player.seekToPrevious();
    }

    final chapter = currentChapter;
    if (chapter == null) {
      return _player.seekToPrevious();
    }
    final currentIndex = _session!.chapters.indexOf(chapter);
    if (currentIndex > 0) {
      // 跳到上一章
      final prevChapter = _session!.chapters[currentIndex - 1];
      await skipToChapter(prevChapter.id);
    } else {
      // 已经是第一章，回到开头
      await seekInBook(Duration.zero);
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
    await seekInBook(startOffset + position);
  }

  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume);
  }

  @override
  Future<void> setSpeed(double speed) async {
    await _player.setSpeed(speed);
  }

  // 核心功能：跳转到全局时间位置
  Future<void> seekInBook(Duration globalPosition) async {
    if (_session == null) return;
    // 找到目标音轨和在音轨内的位置
    final track = _session!.findTrackAtTime(globalPosition);
    final index = _session!.audioTracks.indexOf(track);
    Duration positionInTrack = globalPosition - track.startOffset;
    if (positionInTrack <= Duration.zero) {
      positionInTrack = offset;
    }
    // 切换到目标音轨具体位置
    await _player.seek(positionInTrack, index: index);
  }

  AudioPlayer get player => _player;
  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        if (kIsWeb || !Platform.isAndroid) MediaControl.skipToPrevious,
        MediaControl.rewind,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.fastForward,
        if (kIsWeb || !Platform.isAndroid) MediaControl.skipToNext,
      ],
      systemActions: {
        if (kIsWeb || !Platform.isAndroid) MediaAction.skipToPrevious,
        MediaAction.rewind,
        MediaAction.fastForward,
        MediaAction.stop,
        MediaAction.setSpeed,
        if (kIsWeb || !Platform.isAndroid) MediaAction.skipToNext,
      },
      androidCompactActionIndices: const [1, 2, 3],
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
      captioningEnabled: false,
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

extension PlaybackSessionExpandedExtension on PlaybackSessionExpanded {
  BookChapter findChapterAtTime(Duration position) {
    return chapters.firstWhere(
      (element) {
        return element.start <= position && element.end >= position + offset;
      },
      orElse: () => chapters.first,
    );
  }

  AudioTrack findTrackAtTime(Duration position) {
    return audioTracks.firstWhere(
      (element) {
        return element.startOffset <= position &&
            element.startOffset + element.duration >= position + offset;
      },
      orElse: () => audioTracks.first,
    );
  }

  int findTrackIndexAtTime(Duration position) {
    return audioTracks.indexWhere((element) {
      return element.startOffset <= position &&
          element.startOffset + element.duration >= position + offset;
    });
  }

  Duration getTrackStartOffset(int index) {
    return audioTracks[index].startOffset;
  }
}
