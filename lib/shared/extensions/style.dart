import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  double get calculateHeight {
    return (height ?? 0) * (fontSize ?? 0);
  }
}
