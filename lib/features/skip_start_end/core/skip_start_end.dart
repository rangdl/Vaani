import 'dart:async';

import 'package:vaani/shared/audio_player.dart';
import 'package:vaani/shared/extensions/chapter.dart';
import 'package:vaani/shared/utils/throttler.dart';

class SkipStartEnd {
  final Duration start;
  final Duration end;
  final AbsAudioPlayer player;

  final List<StreamSubscription> _subscriptions = [];
  final throttlerStart = Throttler(delay: Duration(seconds: 3));
  final throttlerEnd = Throttler(delay: Duration(seconds: 3));

  SkipStartEnd({
    required this.start,
    required this.end,
    required this.player,
  }) {
    if (start > Duration.zero) {
      _subscriptions.add(
        player.chapterStream.listen((chapter) {
          if (chapter != null &&
              player.positionInChapter < Duration(seconds: 1)) {
            Future.microtask(
              () => throttlerStart
                  .call(() => player.seekInBook(chapter.start + start)),
            );
          }
        }),
      );
    }
    if (end > Duration.zero) {
      _subscriptions.add(
        player.positionInChapterStream.listen((positionChapter) {
          if (end >
              (player.currentChapter?.duration ?? Duration.zero) -
                  positionChapter) {
            Future.microtask(
              () => throttlerEnd.call(() => player.next()),
            );
          }
        }),
      );
    }
  }

  /// dispose the timer
  void dispose() {
    for (var sub in _subscriptions) {
      sub.cancel();
    }
    throttlerStart.dispose();
    throttlerEnd.dispose();
    // _playbackController.close();
  }
}
