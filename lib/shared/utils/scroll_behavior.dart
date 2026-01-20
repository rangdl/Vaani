// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Custom scroll behavior to allow dragging with mouse.
/// Necessary to allow dragging with mouse on Continents carousel.
class AppCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    // Allow to drag with mouse on Regions carousel
    PointerDeviceKind.mouse,

    // 默认
    PointerDeviceKind.touch,
    PointerDeviceKind.stylus,
    PointerDeviceKind.invertedStylus,
    PointerDeviceKind.trackpad,
    // The VoiceAccess sends pointer events with unknown type when scrolling
    // scrollables.
    PointerDeviceKind.unknown,
  };
}
