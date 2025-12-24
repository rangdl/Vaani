import 'package:hive_ce/hive.dart';

extension BoxExtension on Box {
  T? getAs<T>(dynamic key, {String? defaultValue}) {
    final value = get(key, defaultValue: defaultValue);
    if (value is T) {
      return value;
    }
    return null;
  }
}
