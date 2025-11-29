// my_audio_handler.dart
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/features/player/core/player_status.dart' as core;
import 'package:vaani/features/player/providers/player_status_provider.dart';
import 'package:vaani/shared/extensions/chapter.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';

// add a small offset so the display does not show the previous chapter for a split second
final offset = Duration(milliseconds: 10);

class AbsAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final AudioPlayer _player = AudioPlayer();
  // final List<AudioSource> _playlist = [];
  final Ref ref;

  PlaybackSessionExpanded? _session;

  final _currentChapterObject = BehaviorSubject<BookChapter?>.seeded(null);
  AbsAudioHandler(this.ref) {
    _setupAudioPlayer();
  }

  void _setupAudioPlayer() {
    final statusNotifier = ref.read(playerStatusProvider.notifier);

    // 转发播放状态
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    _player.playerStateStream.listen((event) {
      if (event.playing) {
        statusNotifier.setPlayStatusVerify(core.PlayStatus.playing);
      } else {
        statusNotifier.setPlayStatusVerify(core.PlayStatus.paused);
      }
    });
    _player.positionStream.distinct().listen((position) {
      final chapter = _session?.findChapterAtTime(positionInBook);
      if (chapter != currentChapter) {
        _currentChapterObject.sink.add(chapter);
      }
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

    final track = playbackSession.findTrackAtTime(playbackSession.currentTime);

    final item = MediaItem(
      id: playbackSession.libraryItemId,
      album: playbackSession.mediaMetadata.title,
      artist: playbackSession.displayAuthor,
      title: playbackSession.displayTitle,
      displayTitle: playbackSession.displayTitle,
      displaySubtitle: playbackSession.mediaType == MediaType.book
          ? playbackSession.mediaMetadata.asBookMetadata.subtitle
          : null,
      displayDescription: "测试描述",
      duration: track.duration,
      artUri: Uri.parse(
        '$baseUrl/api/items/${playbackSession.libraryItemId}/cover?token=$token',
      ),
    );
    await playMediaItem(item);
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

  PlaybackSessionExpanded? get session => _session;

  // 当前音轨
  AudioTrack? get currentTrack {
    if (_session == null || _player.currentIndex == null) {
      return null;
    }
    return _session!.audioTracks[_player.currentIndex!];
  }

  // 当前章节
  BookChapter? get currentChapter {
    return _currentChapterObject.value;
  }

  Duration get position => _player.position;
  Duration get positionInChapter {
    return _player.position +
        (currentTrack?.startOffset ?? Duration.zero) -
        (currentChapter?.start ?? Duration.zero);
  }

  Duration get positionInBook {
    return _player.position + (currentTrack?.startOffset ?? Duration.zero);
  }

  Duration get bufferedPositionInBook {
    return _player.bufferedPosition +
        (currentTrack?.startOffset ?? Duration.zero);
  }

  Duration? get chapterDuration => currentChapter?.duration;

  Stream<PlayerState> get playerStateStream => _player.playerStateStream;

  Stream<Duration> get positionStream => _player.positionStream;

  Stream<Duration> get positionStreamInBook {
    return _player.positionStream.map((position) {
      return position + (currentTrack?.startOffset ?? Duration.zero);
    });
  }

  Stream<Duration> get slowPositionStreamInBook {
    final superPositionStream = _player.createPositionStream(
      steps: 100,
      minPeriod: const Duration(milliseconds: 500),
      maxPeriod: const Duration(seconds: 1),
    );
    return superPositionStream.map((position) {
      return position + (currentTrack?.startOffset ?? Duration.zero);
    });
  }

  Stream<Duration> get bufferedPositionStreamInBook {
    return _player.bufferedPositionStream.map((position) {
      return position + (currentTrack?.startOffset ?? Duration.zero);
    });
  }

  Stream<Duration> get positionStreamInChapter {
    return _player.positionStream.distinct().map((position) {
      return position +
          (currentTrack?.startOffset ?? Duration.zero) -
          (currentChapter?.start ?? Duration.zero);
    });
  }

  Stream<BookChapter?> get chapterStream => _currentChapterObject.stream;

  Future<void> togglePlayPause() async {
    // check if book is set
    if (_session == null) {
      return Future.value();
    }
    _player.playerState.playing ? await pause() : await play();
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
    final chapter = currentChapter;
    if (_session == null || chapter == null) {
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
    if (positionInTrack < Duration.zero) {
      positionInTrack = Duration.zero;
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
        MediaAction.seek,
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
      bufferedPosition: event.bufferedPosition,
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
