import 'dart:math';

extension InverseLerp on num {
  /// Returns the fraction of this value between [min] and [max].
  double inverseLerp(num min, num max) {
    return (this - min) / (max - min);
  }

  String formatBytes() {
    if (this <= 0) return '0 B';
    const sizes = ['B', 'KB', 'MB', 'GB'];
    final i = (log(this) / log(1024)).floor();
    return '${(this / pow(1024, i)).toStringAsFixed(2)} ${sizes[i]}';
  }
}

extension Lerp on double {
  /// Returns the value between [min] and [max] given the fraction [t].
  double lerp(double min, double max) {
    return min + ((max - min) * this);
  }
}
