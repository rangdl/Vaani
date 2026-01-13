import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vaani/db/available_boxes.dart';
import 'package:vaani/features/per_book_settings/models/book_settings.dart'
    as model;
import 'package:vaani/features/per_book_settings/models/nullable_player_settings.dart';

part 'book_settings_provider.g.dart';

final _box = HiveBoxes.individualBookSettingsBox;

final _logger = Logger('BookSettingsProvider');

model.BookSettings readFromBoxOrCreate(String bookId) {
  final foundSettings = _box.get(bookId);
  if (foundSettings != null) {
    _logger.fine('found book settings for $bookId in box: $foundSettings');
    return foundSettings;
  } else {
    // create a new settings object
    final settings = model.BookSettings(
      bookId: bookId,
      playerSettings: const NullablePlayerSettings(),
      progress: model.BookProgress(lastUpdate: DateTime.now()),
    );
    _logger.fine('created new book settings for $bookId: $settings');
    writeToBox(settings);
    return settings;
  }
}

void writeToBox(model.BookSettings newSettings) {
  _box.put(newSettings.bookId, newSettings);
  _logger.fine(
    'wrote book settings for ${newSettings.bookId} to box: $newSettings',
  );
}

void updateState(model.BookSettings newSettings, {bool force = false}) {
  // check if the settings are different
  final foundSettings = _box.get(newSettings.bookId);
  if (foundSettings == newSettings && !force) {
    return;
  }
  writeToBox(newSettings);
}

@riverpod
class BookSettings extends _$BookSettings {
  @override
  model.BookSettings build(String bookId) {
    return readFromBoxOrCreate(bookId);
  }

  void update(model.BookSettings newSettings, {bool force = false}) {
    state = newSettings;
    updateState(newSettings, force: force);
  }
}

@riverpod
class BookProgressSettings extends _$BookProgressSettings {
  @override
  model.BookProgress build(String bookId) {
    final progress = ref.read(
      bookSettingsProvider(bookId).select((v) => v.progress),
    );
    if (progress == null) {
      return model.BookProgress(lastUpdate: DateTime.now());
    }
    return progress;
  }
}
