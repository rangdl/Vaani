// a table to track preferences of player for each book
// part 'book_prefs.g.dart';

/// stores the preferences of the player for a book
class BookPrefs {
  int libItemId;

  double? speed;
  // double? volume;
  // Duration? sleepTimer;
  // bool? showTotalProgress;
  // bool? showChapterProgress;
  // bool? useChapterInfo;

  BookPrefs({
    required this.libItemId,
    this.speed,
    // this.volume,
    // this.sleepTimer,
    // this.showTotalProgress,
    // this.showChapterProgress,
    // this.useChapterInfo,
  });
}
