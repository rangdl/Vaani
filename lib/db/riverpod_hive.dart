import 'dart:async';

import 'package:clock/clock.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:meta/meta.dart';
import 'package:riverpod/experimental/persist.dart';

// Can be generated automatically
class PersistedDataAdapter extends TypeAdapter<PersistedData<String>> {
  @override
  final typeId = 999;

  @override
  PersistedData<String> read(BinaryReader reader) {
    final data = reader.readString();
    // 读取 destroyKey
    final hasDestroyKey = reader.readBool();
    final destroyKey = hasDestroyKey ? reader.readString() : null;
    // 读取 expireAt
    final hasExpireAt = reader.readBool();
    final expireAt = hasExpireAt
        ? DateTime.fromMillisecondsSinceEpoch(reader.readInt())
        : null;
    return PersistedData<String>(
      data,
      destroyKey: destroyKey,
      expireAt: expireAt,
    );
  }

  @override
  void write(BinaryWriter writer, PersistedData obj) {
    writer.writeString(obj.data);
    // 写入 destroyKey（可为空）
    if (obj.destroyKey != null) {
      writer.writeBool(true); // 标记有值
      writer.writeString(obj.destroyKey!);
    } else {
      writer.writeBool(false); // 标记为 null
    }
    // 写入 expireAt（可为空）
    if (obj.expireAt != null) {
      writer.writeBool(true); // 标记有值
      writer.writeInt(obj.expireAt!.millisecondsSinceEpoch);
    } else {
      writer.writeBool(false); // 标记为 null
    }
  }
}

// ignore: invalid_internal_annotation
@internal
extension Db on JsonHiveStorage {
  String get tableName => JsonHiveStorage._tableName;
  Box<PersistedData<String>> get box => _box;
}

/// A storage that stores data in SQLite using JSON.
///
/// Only JSON serializable is supported.
/// This is generally used in combination `riverpod_annotation's` `JsonPersist`.
final class JsonHiveStorage extends Storage<String, String> {
  static void _initialize() {
    Hive.registerAdapter(PersistedDataAdapter());
  }

  static void get initialize => _initialize();

  JsonHiveStorage._(this._box);

  static String get _tableName => 'riverpod';

  /// Opens a database at the specified [path].
  ///
  /// This will create a table named `riverpod` if it does not exist,
  /// and will delete any expired data present.
  ///
  /// [open] relies on the `clock` package to obtain the current time, for the
  /// purpose of determining if a key has expired.
  /// This enables your tests to mock the current type.
  static Future<JsonHiveStorage> open({String? boxName}) async {
    final box = await Hive.openBox<PersistedData<String>>(
      boxName ?? _tableName,
    );

    final instance = JsonHiveStorage._(box);
    await instance.deleteOutOfDate();
    return instance;
  }

  final Box<PersistedData<String>> _box;

  /// Closes the database.
  ///
  /// This makes the object unusable.
  Future<void> close() => _box.close();

  @override
  Future<void> deleteOutOfDate() async {
    final keysToDelete = <String>[];
    final currentTimestamp = _currentTimestamp();
    // 收集需要删除的键
    for (var key in box.keys) {
      final item = box.get(key);
      if (item != null &&
          (item.expireAt?.toUtc().millisecondsSinceEpoch ?? 0) <
              currentTimestamp) {
        keysToDelete.add(key.toString());
      }
    }

    // 批量删除
    if (keysToDelete.isNotEmpty) {
      await box.deleteAll(keysToDelete);
    }
  }

  @override
  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  int _currentTimestamp() => clock.now().toUtc().millisecondsSinceEpoch;

  @override
  Future<PersistedData<String>?> read(String key) async {
    return _box.get(key);
  }

  @override
  Future<void> write(String key, String value, StorageOptions options) {
    final expireAt = switch (options.cacheTime.duration) {
      null => null,
      final Duration duration => clock.now().add(duration),
    };
    return _box.put(
      key,
      PersistedData<String>(
        value,
        expireAt: expireAt,
        destroyKey: options.destroyKey,
      ),
    );
  }
}
