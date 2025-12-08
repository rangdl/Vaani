// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:collection/collection.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';

import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/features/settings/models/app_settings.dart';
import 'package:vaani/shared/extensions/chapter.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';

final offset = Duration(milliseconds: 10);

final _logger = Logger('AbsAudioPlayer');

abstract class AbsAudioPlayer {
  final _mediaItemController = BehaviorSubject<MediaItem?>.seeded(null);
  final playerStateSubject =
      BehaviorSubject.seeded(AbsPlayerState(false, AbsProcessingState.idle));
  final _bookStreamController = BehaviorSubject<BookExpanded?>.seeded(null);
  final _chapterStreamController = BehaviorSubject<BookChapter?>.seeded(null);

  BookExpanded? get book => _bookStreamController.nvalue;
  BookChapter? get currentChapter => _chapterStreamController.nvalue;
  AbsPlayerState get playerState => playerStateSubject.value;
  Stream<MediaItem?> get mediaItemStream => _mediaItemController.stream;
  Stream<AbsPlayerState> get playerStateStream => playerStateSubject.stream;

  Future<void> load(
    BookExpanded book, {
    required Uri baseUrl,
    required String token,
    Duration? initialPosition,
    List<Uri>? downloadedUris,
  }) async {
    if (_bookStreamController.nvalue == book) {
      _logger.info('Book is the same, doing nothing');
      return;
    }
    _bookStreamController.add(book);
    final appSettings = loadOrCreateAppSettings();

    final currentTrack = book.findTrackAtTime(initialPosition ?? Duration.zero);
    final indexTrack = book.tracks.indexOf(currentTrack);
    final positionInTrack = initialPosition != null
        ? initialPosition - currentTrack.startOffset
        : null;
    final title = appSettings.notificationSettings.primaryTitle
        .formatNotificationTitle(book);
    final artist = appSettings.notificationSettings.secondaryTitle
        .formatNotificationTitle(book);
    _chapterStreamController
        .add(book.findChapterAtTime(initialPosition ?? Duration.zero));
    final item = MediaItem(
      id: book.libraryItemId,
      title: title,
      artist: artist,
      duration: currentChapter?.duration ?? book.duration,
      artUri: Uri.parse(
        '$baseUrl/api/items/${book.libraryItemId}/cover?token=$token',
      ),
    );
    _mediaItemController.sink.add(item);
    final playlist = book.tracks
        .map(
          (track) => _getUri(currentTrack, downloadedUris,
              baseUrl: baseUrl, token: token),
        )
        .toList();
    await setPlayList(playlist, index: indexTrack, position: positionInTrack);
  }

  Future<void> setPlayList(
    List<Uri> playlist, {
    int? index,
    Duration? position,
  });
  Future<void> play();
  Future<void> pause();
  Future<void> playOrPause();

  // 跳到下一章
  Future<void> next() async {
    final chapter = currentChapter;
    if (book == null || chapter == null) {
      return;
    }
    final chapterIndex = book!.chapters.indexOf(chapter);
    if (chapterIndex < book!.chapters.length - 1) {
      final nextChapter = book!.chapters[chapterIndex + 1];
      await switchChapter(nextChapter.id);
    }
  }

  // 跳到上一章
  Future<void> previous() async {
    final chapter = currentChapter;
    if (book == null || chapter == null) {
      return;
    }
    final currentIndex = book!.chapters.indexOf(chapter);
    if (currentIndex > 0) {
      final prevChapter = book!.chapters[currentIndex - 1];
      await switchChapter(prevChapter.id);
    } else {
      // 已经是第一章，回到开头
      await seekInBook(Duration.zero);
    }
  }

  Future<void> seek(Duration position, {int? index});
  Future<void> seekInBook(Duration position) async {
    if (book == null) return;
    // 找到目标位置所在音轨和音轨内的位置
    final track = book!.findTrackAtTime(position);
    final index = book!.tracks.indexOf(track);
    Duration positionInTrack = position - track.startOffset;
    if (positionInTrack <= Duration.zero) {
      positionInTrack = offset;
    }
    // 切换到目标音轨具体位置
    await seek(positionInTrack, index: index);
  }

  Future<void> setSpeed(double speed);
  Future<void> setVolume(double volume);
  Future<void> switchChapter(int chapterId) async {
    if (book == null) return;

    final chapter = book!.chapters.firstWhere(
      (ch) => ch.id == chapterId,
      orElse: () => throw Exception('Chapter not found'),
    );
    await seekInBook(chapter.start + offset);
  }

  bool get playing => playerState.playing;
  Stream<bool> get playingStream;
  Stream<BookExpanded?> get bookStream => _bookStreamController.stream;
  Stream<BookChapter?> get chapterStream => _chapterStreamController.stream;

  int get currentIndex;
  double get speed;

  Duration get position;
  Stream<Duration> get positionStream;

  Duration get positionInChapter {
    final globalPosition = positionInBook;
    return globalPosition -
        (book?.findChapterAtTime(globalPosition).start ?? Duration.zero);
  }

  Duration get positionInBook =>
      position + (book?.tracks[currentIndex].startOffset ?? Duration.zero);

  Stream<Duration> get positionInChapterStream =>
      positionStream.map((position) {
        return positionInChapter;
      });

  Stream<Duration> get positionInBookStream => positionStream.map((position) {
        return positionInBook;
      });

  Duration get bufferedPosition;
  Stream<Duration> get bufferedPositionStream;
  Duration get bufferedPositionInBook =>
      bufferedPosition +
      (book?.tracks[currentIndex].startOffset ?? Duration.zero);
  Stream<Duration> get bufferedPositionInBookStream =>
      bufferedPositionStream.map((position) {
        return bufferedPositionInBook;
      });

  dispose() {
    _mediaItemController.close();
    playerStateSubject.close();
    _bookStreamController.close();
    _chapterStreamController.close();
  }
}

/// Enumerates the different processing states of a player.
enum AbsProcessingState {
  /// The player has not loaded an [AudioSource].
  idle,

  /// The player is loading an [AudioSource].
  loading,

  /// The player is buffering audio and unable to play.
  buffering,

  /// The player is has enough audio buffered and is able to play.
  ready,

  /// The player has reached the end of the audio.
  completed,
}

/// Encapsulates the playing and processing states. These two states vary
/// orthogonally, and so if [processingState] is [ProcessingState.buffering],
/// you can check [playing] to determine whether the buffering occurred while
/// the player was playing or while the player was paused.
class AbsPlayerState {
  /// Whether the player will play when [processingState] is
  /// [ProcessingState.ready].
  final bool playing;

  /// The current processing state of the player.
  final AbsProcessingState processingState;

  AbsPlayerState(this.playing, this.processingState);

  @override
  String toString() => 'playing=$playing,processingState=$processingState';

  @override
  int get hashCode => Object.hash(playing, processingState);

  @override
  bool operator ==(Object other) =>
      other.runtimeType == runtimeType &&
      other is PlayerState &&
      other.playing == playing &&
      other.processingState == processingState;

  AbsPlayerState copyWith({
    bool? playing,
    AbsProcessingState? processingState,
  }) {
    return AbsPlayerState(
      playing ?? this.playing,
      processingState ?? this.processingState,
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

/// Backwards compatible extensions on rxdart's ValueStream
extension _ValueStreamExtension<T> on ValueStream<T> {
  /// Backwards compatible version of valueOrNull.
  T? get nvalue => hasValue ? value : null;
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
