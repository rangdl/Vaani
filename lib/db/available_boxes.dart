import 'package:flutter/foundation.dart' show immutable;
import 'package:hive_ce/hive.dart';
import 'package:vaani/features/per_book_settings/models/book_settings.dart';
import 'package:vaani/features/settings/models/models.dart';

@immutable
class AvailableHiveBoxes {
  const AvailableHiveBoxes._();

  static Future<void> init() async {
    await Hive.openBox('basicTypes');

    /// Box for storing user preferences as [AppSettings]
    await Hive.openBox<AppSettings>('userPrefs');

    /// Box for storing [ApiSettings]
    await Hive.openBox<ApiSettings>('apiSettings');

    /// stores the a list of [AudiobookShelfServer]

    await Hive.openBox<AudiobookShelfServer>('audiobookShelfServer');

    /// stores the a list of [AuthenticatedUser]

    await Hive.openBox<AuthenticatedUser>('authenticatedUser');

    /// stores the a list of [BookSettings]

    await Hive.openBox<BookSettings>('bookSettings');
  }

  static final basicBox = Hive.box('basicTypes');

  /// Box for storing user preferences as [AppSettings]
  static final userPrefsBox = Hive.box<AppSettings>('userPrefs');

  /// Box for storing [ApiSettings]
  static final apiSettingsBox = Hive.box<ApiSettings>('apiSettings');

  /// stores the a list of [AudiobookShelfServer]
  static final serverBox =
      Hive.box<AudiobookShelfServer>('audiobookShelfServer');

  /// stores the a list of [AuthenticatedUser]
  static final authenticatedUserBox =
      Hive.box<AuthenticatedUser>('authenticatedUser');

  /// stores the a list of [BookSettings]
  static final individualBookSettingsBox =
      Hive.box<BookSettings>('bookSettings');
}
