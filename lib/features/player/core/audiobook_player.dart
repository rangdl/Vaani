// my_audio_handler.dart
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/features/player/core/player_status.dart' as core;
import 'package:vaani/features/player/providers/player_status_provider.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/features/settings/models/app_settings.dart';
import 'package:vaani/shared/extensions/chapter.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';

// add a small offset so the display does not show the previous chapter for a split second
final offset = Duration(milliseconds: 10);

final _logger = Logger('AudiobookPlayer');

class AbsAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final AudioPlayer _player = AudioPlayer();
  // final List<AudioSource> _playlist = [];
  final Ref ref;

  BookExpanded? _book;
  BookExpanded? get book => _book;

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
      final chapter = _book?.findChapterAtTime(positionInBook);
      if (chapter != currentChapter) {
        _currentChapterObject.sink.add(chapter);
      }
    });
  }

  // 加载有声书
  Future<void> setSourceAudiobook(
    BookExpanded book, {
    bool preload = true,
    required Uri baseUrl,
    required String token,
    Duration? initialPosition,
    List<Uri>? downloadedUris,
  }) async {
    final appSettings = loadOrCreateAppSettings();
    // if (book == null) {
    //   _book = null;
    //   _logger.info('Book is null, stopping player');
    //   return stop();
    // }
    if (_book == book) {
      _logger.info('Book is the same, doing nothing');
      return;
    }
    _book = book;

    // 添加所有音轨
    List<AudioSource> audioSources = book.tracks
        .map(
          (track) => AudioSource.uri(
            _getUri(track, downloadedUris, baseUrl: baseUrl, token: token),
          ),
        )
        .toList();

    final title = appSettings.notificationSettings.primaryTitle
        .formatNotificationTitle(book);
    final album = appSettings.notificationSettings.secondaryTitle
        .formatNotificationTitle(book);
    playMediaItem(
      MediaItem(
        id: book.libraryItemId,
        title: title,
        album: album,
        displayTitle: title,
        displaySubtitle: album,
        duration: book.duration,
        artUri: Uri.parse(
          '$baseUrl/api/items/${book.libraryItemId}/cover?token=$token',
        ),
      ),
    );
    final trackToPlay = book.findTrackAtTime(initialPosition ?? Duration.zero);
    final initialIndex = book.tracks.indexOf(trackToPlay);
    final initialPositionInTrack = initialPosition != null
        ? initialPosition - trackToPlay.startOffset
        : null;
    await _player
        .setAudioSources(
      audioSources,
      preload: preload,
      initialIndex: initialIndex,
      initialPosition: initialPositionInTrack,
    )
        .catchError((error) {
      _logger.shout('Error in setting audio source: $error');
      return null;
    });
    // _player.seek(initialPositionInTrack, index: initialIndex);
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
    if (_book == null) return;

    final chapter = _book!.chapters.firstWhere(
      (ch) => ch.id == chapterId,
      orElse: () => throw Exception('Chapter not found'),
    );
    await seekInBook(chapter.start + offset);
  }

  BookExpanded? get Book => _book;

  // 当前音轨
  AudioTrack? get currentTrack {
    if (_book == null || _player.currentIndex == null) {
      return null;
    }
    return _book!.tracks[_player.currentIndex!];
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
    if (_book == null) {
      _logger.warning('No book is set, not toggling play/pause');
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
    if (_book == null) {
      // 回退到默认行为
      return _player.seekToNext();
    }
    final chapter = currentChapter;
    if (chapter == null) {
      // 回退到默认行为
      return _player.seekToNext();
    }
    final chapterIndex = _book!.chapters.indexOf(chapter);
    if (chapterIndex < _book!.chapters.length - 1) {
      // 跳到下一章
      final nextChapter = _book!.chapters[chapterIndex + 1];
      await skipToChapter(nextChapter.id);
    }
  }

  @override
  Future<void> skipToPrevious() async {
    final chapter = currentChapter;
    if (_book == null || chapter == null) {
      return _player.seekToPrevious();
    }
    final currentIndex = _book!.chapters.indexOf(chapter);
    if (currentIndex > 0) {
      // 跳到上一章
      final prevChapter = _book!.chapters[currentIndex - 1];
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
    if (_book == null) return;
    // 找到目标音轨和在音轨内的位置
    final track = _book!.findTrackAtTime(globalPosition);
    final index = _book!.tracks.indexOf(track);
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

extension FormatNotificationTitle on String {
  String formatNotificationTitle(BookExpanded book) {
    return replaceAllMapped(
      RegExp(r'\$(\w+)'),
      (match) {
        final type = match.group(1);
        return NotificationTitleType.values
                .firstWhere((element) => element.name == type)
                .extractFrom(book) ??
            match.group(0) ??
            '';
      },
    );
  }
}

extension NotificationTitleUtils on NotificationTitleType {
  String? extractFrom(BookExpanded book) {
    var bookMetadataExpanded = book.metadata.asBookMetadataExpanded;
    switch (this) {
      case NotificationTitleType.bookTitle:
        return bookMetadataExpanded.title;
      case NotificationTitleType.chapterTitle:
        // TODO: implement chapter title; depends on https://github.com/Dr-Blank/Vaani/issues/2
        return bookMetadataExpanded.title;
      case NotificationTitleType.author:
        return bookMetadataExpanded.authorName;
      case NotificationTitleType.narrator:
        return bookMetadataExpanded.narratorName;
      case NotificationTitleType.series:
        return bookMetadataExpanded.seriesName;
      case NotificationTitleType.subtitle:
        return bookMetadataExpanded.subtitle;
      case NotificationTitleType.year:
        return bookMetadataExpanded.publishedYear;
    }
  }
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

  int findTrackIndexAtTime(Duration position) {
    return tracks.indexWhere((element) {
      return element.startOffset <= position &&
          element.startOffset + element.duration >= position + offset;
    });
  }

  Duration getTrackStartOffset(int index) {
    return tracks[index].startOffset;
  }
}
