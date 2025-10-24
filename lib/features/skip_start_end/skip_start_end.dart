import 'dart:async';

import 'package:vaani/features/player/core/audiobook_player.dart';

class SkipStartEnd {
  final Duration start;
  final Duration end;
  final AudiobookPlayer player;
  int _index;
  final List<StreamSubscription> _subscriptions = [];
  final throttler = Throttler(delay: Duration(seconds: 3));
  // final StreamController<PlaybackEvent> _playbackController =
  //     StreamController<PlaybackEvent>.broadcast();

  SkipStartEnd({required this.start, required this.end, required this.player}) : _index = 0 {
    if (start > Duration()) {
      _subscriptions.add(
        player.currentIndexStream.listen((index) {
          if (_index != index && player.position.inMilliseconds < 500) {
            Future.microtask(() {
              player.seek(start);
            });
            _index = index!;
          }
        }),
      );
    }
    if (end > Duration()) {
      _subscriptions.add(
        player.positionStream.distinct().listen((position) {
          if (player.duration != null &&
              player.duration!.inMilliseconds - player.position.inMilliseconds <
                  end.inMilliseconds) {
            throttler.call(() {
              print('跳过片尾');
              Future.microtask(() {
                throttler.call(player.seekToNext);
              });
            });
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
    throttler.dispose();
    // _playbackController.close();
  }
}

class Throttler {
  final Duration delay;
  Timer? _timer;
  DateTime? _lastRun;

  Throttler({required this.delay});

  void call(void Function() callback) {
    // 如果是第一次调用，立即执行
    if (_lastRun == null) {
      callback();
      _lastRun = DateTime.now();
      return;
    }

    // 如果距离上次执行已经超过延迟时间，立即执行
    if (DateTime.now().difference(_lastRun!) > delay) {
      callback();
      _lastRun = DateTime.now();
    }
    // 否则，安排在下个周期执行
    else {
      _timer?.cancel();
      _timer = Timer(delay, () {
        callback();
        _lastRun = DateTime.now();
      });
    }
  }

  void dispose() {
    _timer?.cancel();
  }
}
