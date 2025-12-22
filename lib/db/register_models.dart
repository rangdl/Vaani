import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:vaani/features/per_book_settings/models/book_settings.dart';
import 'package:vaani/features/settings/models/models.dart';

// register all models to Hive for serialization
Future registerModels() async {
  Hive.registerAdapter(
    JsonAdapter<AppSettings>(
      id: 1,
      fromJson: AppSettings.fromJson,
    ),
  );
  Hive.registerAdapter(
    JsonAdapter<ApiSettings>(
      id: 2,
      fromJson: ApiSettings.fromJson,
    ),
  );
  Hive.registerAdapter(
    JsonAdapter<AudiobookShelfServer>(
      id: 3,
      fromJson: AudiobookShelfServer.fromJson,
    ),
  );
  Hive.registerAdapter(
    JsonAdapter<AuthenticatedUser>(
      id: 4,
      fromJson: AuthenticatedUser.fromJson,
    ),
  );
  Hive.registerAdapter(
    JsonAdapter<BookSettings>(
      id: 5,
      fromJson: BookSettings.fromJson,
    ),
  );
}

/// 通用 JSON Adapter（适合简单模型）
class JsonAdapter<T> extends TypeAdapter<T> {
  final T Function(Map<String, dynamic>) fromJson;
  final int id;

  const JsonAdapter({
    required this.id,
    required this.fromJson,
  });

  @override
  int get typeId => id;

  @override
  T read(BinaryReader reader) {
    final jsonString = reader.readString();
    final jsonMap = jsonDecode(jsonString);
    return fromJson(jsonMap);
  }

  @override
  void write(BinaryWriter writer, T obj) {
    writer.writeString(jsonEncode(obj));
  }
}

// Future registerModels() async {
//   Hive.registerAdapter<AppSettings>(
//     'AppSettings',
//     ((json) => AppSettings.fromJson(json)),
//   );
//   Hive.registerAdapter<ApiSettings>(
//     'ApiSettings',
//     ((json) => ApiSettings.fromJson(json)),
//   );
//   Hive.registerAdapter<AudiobookShelfServer>(
//     'AudiobookShelfServer',
//     ((json) => AudiobookShelfServer.fromJson(json)),
//   );
//   Hive.registerAdapter<AuthenticatedUser>(
//     'AuthenticatedUser',
//     ((json) => AuthenticatedUser.fromJson(json)),
//   );
//   Hive.registerAdapter<BookSettings>(
//     'BookSettings',
//     ((json) => BookSettings.fromJson(json)),
//   );
//   Hive.registerAdapter<BookSettings>(
//     '_\$BookSettingsImpl', // hack because of freezed
//     ((json) => BookSettings.fromJson(json)),
//   );
// }
