// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';

import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/features/settings/models/app_settings.dart';
import 'package:vaani/shared/extensions/chapter.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';

final offset = Duration(milliseconds: 10);

final _logger = Logger('AbsAudioPlayer');

class AbsAudioPlayer {
  final Ref ref;
  late final AudioPlayer _player;
  AbsAudioPlayer(AudioPlayer player, this.ref) : _player = player {
    _player.positionStream.listen((position) {
      final chapter = currentChapter;
      if (positionInBook <= (chapter?.start ?? Duration.zero) ||
          positionInBook >= (chapter?.end ?? Duration.zero)) {
        final chapter = book?.findChapterAtTime(positionInBook);
        if (chapter != currentChapter) {
          // print('当前章节时长: ${currentChapter?.duration}');
          // print('切换章节时长: ${chapter?.duration}');
          // print('当前播放音轨时长: ${_player.duration}');
          chapterStreamController.add(chapter);
        }
      }
    });
  }

  final _bookStreamController = BehaviorSubject<BookExpanded?>.seeded(null);
  final chapterStreamController = BehaviorSubject<BookChapter?>.seeded(null);

  BookExpanded? get book => _bookStreamController.nvalue;
  AudioTrack? get currentTrack => book?.tracks[currentIndex];
  BookChapter? get currentChapter => chapterStreamController.nvalue;
  PlayerState get playerState => _player.playerState;
  Stream<PlayerState> get playerStateStream => _player.playerStateStream;

  // 加载整本书
  Future<void> load(
    BookExpanded book, {
    required Uri baseUrl,
    required String token,
    Duration? initialPosition,
    List<Uri>? downloadedUris,
    Duration? start,
    Duration? end,
    bool force = false,
  }) async {
    if (!force && _bookStreamController.nvalue == book) {
      _logger.info('Book is the same, doing nothing');
      return;
    }
    _bookStreamController.add(book);

    final currentTrack = book.findTrackAtTime(initialPosition ?? Duration.zero);
    final indexTrack = book.tracks.indexOf(currentTrack);
    final positionInTrack = initialPosition != null
        ? initialPosition - currentTrack.startOffset
        : null;
    chapterStreamController
        .add(book.findChapterAtTime(initialPosition ?? Duration.zero));
    final title = primaryTitle();
    final artist = secondaryTitle();

    mediaItem(track) => MediaItem(
          id: book.libraryItemId + track.index.toString(),
          title: title,
          artist: artist,
          duration: currentChapter?.duration ?? book.duration,
          artUri: Uri.parse(
            '$baseUrl/api/items/${book.libraryItemId}/cover?token=$token',
          ),
        );
    if (start != null && start > Duration.zero ||
        end != null && end > Duration.zero) {
      _logger.info(
        'Skip the opening ${start?.inSeconds} seconds, end ${end?.inSeconds} seconds',
      );
    }

    List<AudioSource> audioSources = start != null && start > Duration.zero ||
            end != null && end > Duration.zero
        ? book.tracks
            .map(
              (track) => ClippingAudioSource(
                child: AudioSource.uri(
                  _getUri(
                    track,
                    downloadedUris,
                    baseUrl: baseUrl,
                    token: token,
                  ),
                ),
                start: start,
                end: end == null ? null : track.duration - end,
                tag: mediaItem(track),
              ),
            )
            .toList()
        : book.tracks
            .map(
              (track) => AudioSource.uri(
                _getUri(track, downloadedUris, baseUrl: baseUrl, token: token),
                tag: mediaItem(track),
              ),
            )
            .toList();

    await _player
        .setAudioSources(
      audioSources,
      preload: true,
      initialIndex: indexTrack,
      initialPosition: positionInTrack,
    )
        .catchError((error) {
      _logger.shout('Error in setting audio source: $error');
      return null;
    });
  }

  Future<void> play() async {
    await _player.play();
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> playOrPause() async {
    _player.playing ? await _player.pause() : await _player.play();
  }

  // 跳到下一章
  Future<void> next() async {
    final chapter = currentChapter;
    if (book == null || chapter == null) {
      return;
    }
    final chapterIndex = book!.chapters.indexOf(chapter);
    if (chapterIndex < book!.chapters.length - 1) {
      final nextChapter = book!.chapters[chapterIndex + 1];
      await seekInBook(nextChapter.start + offset);
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
      await seekInBook(prevChapter.start + offset);
    } else {
      // 已经是第一章，回到开头
      await seekInBook(Duration.zero);
    }
  }

  Future<void> seek(Duration position, {int? index}) async {
    await _player.seek(_addClippingStart(position, add: false), index: index);
  }

  Future<void> setSpeed(double speed) async {
    await _player.setSpeed(speed);
  }

  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume);
  }

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

  Future<void> switchChapter(int chapterId) async {
    if (book == null) return;

    final chapter = book!.chapters.firstWhere(
      (ch) => ch.id == chapterId,
      orElse: () => throw Exception('Chapter not found'),
    );
    await seekInBook(chapter.start + offset);
  }

  bool get playing => playerState.playing;
  Stream<bool> get playingStream => _player.playingStream;
  Stream<BookExpanded?> get bookStream => _bookStreamController.stream;
  Stream<BookChapter?> get chapterStream => chapterStreamController.stream;

  int get currentIndex => _player.currentIndex ?? 0;
  double get speed => _player.speed;

  Duration get position => _addClippingStart(_player.position);
  Stream<Duration> get positionStream =>
      _player.positionStream.where((_) => _player.playing).map((position) {
        return _addClippingStart(position);
      });

  Duration get positionInChapter => getPositionInChapter(position);
  Duration getPositionInChapter(position) {
    final globalPosition = getPositionInBook(position);
    return globalPosition -
        (book?.findChapterAtTime(globalPosition).start ?? Duration.zero);
  }

  Duration get positionInBook => getPositionInBook(position);
  Duration getPositionInBook(position) =>
      position + (book?.tracks[currentIndex].startOffset ?? Duration.zero);

  Stream<Duration> get positionInChapterStream =>
      positionStream.map((position) {
        return getPositionInChapter(position);
      });

  Stream<Duration> get positionInBookStream => positionStream.map((position) {
        return positionInBook;
      });

  Duration get bufferedPosition => _player.bufferedPosition;
  Stream<Duration> get bufferedPositionStream => _player.bufferedPositionStream;
  Duration get bufferedPositionInBook =>
      bufferedPosition +
      (book?.tracks[currentIndex].startOffset ?? Duration.zero);
  Stream<Duration> get bufferedPositionInBookStream =>
      bufferedPositionStream.map((position) {
        return bufferedPositionInBook;
      });

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

  dispose() {
    _bookStreamController.close();
    chapterStreamController.close();
  }

  String primaryTitle() {
    final appSettings = ref.read(appSettingsProvider);
    final currentBook = book;
    if (currentBook != null) {
      return appSettings.notificationSettings.primaryTitle
          .formatNotificationTitle(currentBook, chapter: currentChapter);
    }
    return "";
  }

  String secondaryTitle() {
    final appSettings = ref.read(appSettingsProvider);
    final currentBook = book;
    if (currentBook != null) {
      return appSettings.notificationSettings.secondaryTitle
          .formatNotificationTitle(currentBook, chapter: currentChapter);
    }
    return "";
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

extension FormatNotificationTitle on String {
  String formatNotificationTitle(BookExpanded book, {BookChapter? chapter}) {
    return replaceAllMapped(
      RegExp(r'\$(\w+)'),
      (match) {
        final type = match.group(1);
        return NotificationTitleType.values
                .firstWhere((element) => element.name == type)
                .extractFrom(book, chapter: chapter) ??
            match.group(0) ??
            '';
      },
    );
  }
}

extension NotificationTitleUtils on NotificationTitleType {
  String? extractFrom(BookExpanded book, {BookChapter? chapter}) {
    var bookMetadataExpanded = book.metadata.asBookMetadataExpanded;
    switch (this) {
      case NotificationTitleType.bookTitle:
        return bookMetadataExpanded.title;
      case NotificationTitleType.chapterTitle:
        // TODO: implement chapter title; depends on https://github.com/Dr-Blank/Vaani/issues/2
        if (chapter != null) {
          return chapter.title;
        }
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
