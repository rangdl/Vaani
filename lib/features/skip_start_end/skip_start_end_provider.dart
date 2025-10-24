import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vaani/features/per_book_settings/providers/book_settings_provider.dart';
import 'package:vaani/features/player/providers/audiobook_player.dart';
import 'package:vaani/features/skip_start_end/skip_start_end.dart' as core;

part 'skip_start_end_provider.g.dart';

@Riverpod(keepAlive: true)
class SkipStartEnd extends _$SkipStartEnd {
  @override
  core.SkipStartEnd? build() {
    final player = ref.watch(audiobookPlayerProvider);
    final bookId = player.book?.libraryItemId ?? '_';
    if (bookId == '_') {
      return null;
    }
    final bookSettings = ref.watch(bookSettingsProvider(bookId));
    final start = bookSettings.playerSettings.skipChapterStart;
    final end = bookSettings.playerSettings.skipChapterEnd;

    return core.SkipStartEnd(start: start, end: end, player: player);
  }
}
