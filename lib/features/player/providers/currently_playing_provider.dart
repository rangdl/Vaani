import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart' as core;
import 'package:vaani/features/player/providers/audiobook_player.dart';

part 'currently_playing_provider.g.dart';

@riverpod
class CurrentChapter extends _$CurrentChapter {
  @override
  core.BookChapter? build() {
    final player = ref.watch(playerProvider);
    player.chapterStream.distinct().listen((chapter) {
      update(chapter);
    });
    return player.currentChapter;
  }

  void update(core.BookChapter? chapter) {
    if (state != chapter) {
      state = chapter;
    }
  }
}

@riverpod
List<core.BookChapter> currentChapters(Ref ref) {
  final session = ref.watch(sessionProvider);
  if (session == null) {
    return [];
  }
  final currentChapter = ref.watch(currentChapterProvider);
  if (currentChapter == null) {
    return [];
  }
  final index = session.chapters.indexOf(currentChapter);
  final total = session.chapters.length;
  return session.chapters
      .sublist(index - 3, (total - 3) <= (index + 17) ? total : index + 17);
}
