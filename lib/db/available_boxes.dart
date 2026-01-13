import 'package:flutter/foundation.dart' show immutable;
import 'package:hive_ce/hive.dart';
import 'package:vaani/features/per_book_settings/models/book_settings.dart';
import 'package:vaani/features/settings/models/models.dart';

@immutable
class HiveBoxes {
  const HiveBoxes._();
  static late final Box<dynamic> basicBox;

  /// Box for storing user preferences as [AppSettings]
  static late final Box<AppSettings> userPrefsBox;

  /// Box for storing [ApiSettings]
  static late final Box<ApiSettings> apiSettingsBox;

  /// stores the a list of [AudiobookShelfServer]
  static late final Box<AudiobookShelfServer> serverBox;

  /// stores the a list of [AuthenticatedUser]
  static late final Box<AuthenticatedUser> authenticatedUserBox;

  /// stores the a list of [BookSettings]
  static late final Box<BookSettings> individualBookSettingsBox;

  static Future<void> init() async {
    basicBox = await Hive.openBox('basicTypes');
    userPrefsBox = await Hive.openBox<AppSettings>('userPrefs');
    apiSettingsBox = await Hive.openBox<ApiSettings>('apiSettings');
    serverBox =
        await Hive.openBox<AudiobookShelfServer>('audiobookShelfServer');
    authenticatedUserBox =
        await Hive.openBox<AuthenticatedUser>('authenticatedUser');
    individualBookSettingsBox =
        await Hive.openBox<BookSettings>('bookSettings');
  }
}
