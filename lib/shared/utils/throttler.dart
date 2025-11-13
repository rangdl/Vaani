import 'dart:async';

// 节流器
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
