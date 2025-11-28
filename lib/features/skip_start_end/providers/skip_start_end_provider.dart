import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vaani/features/per_book_settings/providers/book_settings_provider.dart';
import 'package:vaani/features/player/providers/audiobook_player.dart';
import 'package:vaani/features/skip_start_end/core/skip_start_end.dart' as core;

part 'skip_start_end_provider.g.dart';

@riverpod
class SkipStartEnd extends _$SkipStartEnd {
  @override
  core.SkipStartEnd? build() {
    final session = ref.watch(sessionProvider);
    final bookId = session?.libraryItemId;
    if (session == null || bookId == null) {
      return null;
    }

    final player = ref.read(playerProvider);
    final bookSettings = ref.watch(bookSettingsProvider(bookId));
    final start = bookSettings.playerSettings.skipChapterStart;
    final end = bookSettings.playerSettings.skipChapterEnd;
    if (start < Duration.zero && end < Duration.zero) {
      return null;
    }

    final skipStartEnd = core.SkipStartEnd(
      start: start,
      end: end,
      player: player,
    );
    ref.onDispose(skipStartEnd.dispose);
    return skipStartEnd;
  }
}

// @riverpod
// class SkipStartEnd extends _$SkipStartEnd {
//   @override
//   core.SkipStartEnd? build() {
//     final player = ref.watch(simpleAudiobookPlayerProvider);
//     final book = ref.watch(audiobookPlayerProvider.select((v) => v.book));
//     final bookId = book?.libraryItemId ?? '_';
//     if (bookId == '_') {
//       return null;
//     }
//     final bookSettings = ref.watch(bookSettingsProvider(bookId));
//     final start = bookSettings.playerSettings.skipChapterStart;
//     final end = bookSettings.playerSettings.skipChapterEnd;

//     final skipStartEnd = core.SkipStartEnd(
//       start: start,
//       end: end,
//       player: player,
//       chapterId: player.currentChapter?.id,
//     );
//     ref.onDispose(skipStartEnd.dispose);
//     return skipStartEnd;
//   }
// }
