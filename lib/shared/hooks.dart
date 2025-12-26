import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// useEffect((){}, []) 组件构建之后执行，但并不保证布局已经完成

// 自定义
// useLayoutEffect((){}) 组件布局完成之后执行 仅执行一次

void useInterval(VoidCallback callback, Duration delay) {
  final savedCallback = useRef(callback);
  savedCallback.value = callback;

  useEffect(
    () {
      final timer = Timer.periodic(delay, (_) => savedCallback.value());
      return timer.cancel;
    },
    [delay],
  );
}

void useTimer(VoidCallback callback, Duration delay) {
  final savedCallback = useRef(callback);
  savedCallback.value = callback;

  useEffect(
    () {
      final timer = Timer(delay, savedCallback.value);
      return timer.cancel;
    },
    [delay],
  );
}

void useLayoutEffect(VoidCallback callback) {
  final savedCallback = useRef(callback);
  savedCallback.value = callback;

  useEffect(
    () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        savedCallback.value();
      });
      return null;
    },
    [],
  );
}
