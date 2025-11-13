import 'dart:async';

import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/features/player/core/audiobook_player.dart';
import 'package:vaani/shared/extensions/chapter.dart';
import 'package:vaani/shared/utils/throttler.dart';

class SkipStartEnd {
  final Duration start;
  final Duration end;
  final AudiobookPlayer player;
  // 当前章节的id
  int? chapterId;
  // int _index;
  final List<StreamSubscription> _subscriptions = [];
  final throttler = Throttler(delay: Duration(seconds: 3));
  // final StreamController<PlaybackEvent> _playbackController =
  //     StreamController<PlaybackEvent>.broadcast();

  SkipStartEnd({
    required this.start,
    required this.end,
    required this.player,
    this.chapterId,
  }) {
    // if (start > Duration()) {
    //   _subscriptions.add(
    //     player.currentIndexStream.listen((index) {
    //       if (_index != index && player.position.inMilliseconds < 500) {
    //         Future.microtask(() {
    //           player.seek(start);
    //         });
    //         _index = index!;
    //       }
    //     }),
    //   );
    // }
    // if (end > Duration()) {
    //   _subscriptions.add(
    //     player.positionStream.distinct().listen((position) {
    //       if (player.duration != null &&
    //           player.duration!.inMilliseconds - player.position.inMilliseconds <
    //               end.inMilliseconds) {
    //         throttler.call(() {
    //           print('跳过片尾');
    //           Future.microtask(() async {
    //             await player.stop();
    //             player.seekToNext();
    //           });
    //         });
    //       }
    //     }),
    //   );
    // }
    if (start > Duration.zero || end > Duration.zero) {
      _subscriptions.add(
        player.positionStream.listen((position) {
          final chapter = player.currentChapter;
          if (chapter == null) {
            return;
          }
          if (chapter.id == chapterId) {
            if (end > Duration.zero &&
                chapter.duration - (player.positionInBook - chapter.start) <
                    end) {
              throttler.call(() {
                Future.microtask(() => skipEnd(chapter));
              });
            }
          }
          if (chapter.id != chapterId) {
            if (start > Duration.zero &&
                player.positionInBook - chapter.start < Duration(seconds: 1)) {
              throttler.call(() {
                Future.microtask(() => skipStart(chapter));
              });
            }

            chapterId = chapter.id;
          }
        }),
      );
    }
  }

  void skipStart(BookChapter chapter) {
    print('跳过片头');
    final globalPosition = player.positionInBook;
    if (globalPosition - chapter.start < Duration(seconds: 1)) {
      player.seekInBook(chapter.start + start);
    }
  }

  void skipEnd(chapter) {
    print('跳过片尾');
    final book = player.book;
    if (book == null) {
      return;
    }
    if (start > Duration.zero) {
      final currentIndex = book.chapters.indexOf(chapter);
      if (currentIndex < book.chapters.length - 1) {
        final nextChapter = book.chapters[currentIndex + 1];
        // 跳过片头+片尾
        print('跳过片头+片尾');
        player.skipToChapter(nextChapter.id, position: start);
      }
    } else {
      player.seekToPrevious();
    }
  }

  /// dispose the timer
  void dispose() {
    for (var sub in _subscriptions) {
      sub.cancel();
    }
    throttler.dispose();
    // _playbackController.close();
  }
}
