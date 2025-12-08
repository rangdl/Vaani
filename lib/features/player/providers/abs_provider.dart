import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart' as api;
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/shared/audio_player.dart' as core;
import 'package:vaani/shared/audio_player_mpv.dart';

part 'abs_provider.g.dart';

// final _logger = Logger('AbsPlayerProvider');

@Riverpod(keepAlive: true)
class AbsAudioPlayer extends _$AbsAudioPlayer {
  @override
  core.AbsAudioPlayer build() {
    final player = AbsMpvAudioPlayer();
    return player;
  }

  Future<void> load(
    api.BookExpanded book, {
    Duration? initialPosition,
  }) async {
    if (state.book == book) {
      state.playOrPause();
      return;
    }
    final api = ref.read(authenticatedApiProvider);
    await state.load(
      book,
      baseUrl: api.baseUrl,
      token: api.token!,
      initialPosition: initialPosition,
    );
    await state.play();
  }
}

@riverpod
class PlayerState extends _$PlayerState {
  @override
  core.AbsPlayerState build() {
    final player = ref.read(absAudioPlayerProvider);
    player.playerStateStream.listen((playerState) {
      if (playerState != state) {
        state = playerState;
      }
    });
    return player.playerState;
  }

  bool isLoading(String itemId) {
    final player = ref.read(absAudioPlayerProvider);
    return player.book?.libraryItemId == itemId &&
        !state.playing &&
        state.processingState == core.AbsProcessingState.loading;
  }

  bool isPlaying() {
    return state.playing;
  }
}

@riverpod
class CurrentBook extends _$CurrentBook {
  @override
  api.BookExpanded? build() {
    final player = ref.read(absAudioPlayerProvider);
    player.bookStream.listen((book) {
      if (book != state) {
        state = book;
      }
    });
    return player.book;
  }
}

@riverpod
bool isPlayerActive(Ref ref) {
  final player = ref.read(absAudioPlayerProvider);
  player.bookStream.listen((book) {
    ref.invalidateSelf();
  });
  return player.book != null;
}

@riverpod
class CurrentChapter extends _$CurrentChapter {
  @override
  api.BookChapter? build() {
    final player = ref.read(absAudioPlayerProvider);
    player.chapterStream.listen((chapter) {
      if (chapter != state) {
        state = chapter;
      }
    });
    return player.currentChapter;
  }
}

@riverpod
Stream<Duration> positionChapter(Ref ref) {
  return ref.read(absAudioPlayerProvider).positionInChapterStream;
}

@riverpod
List<api.BookChapter> currentChapters(Ref ref) {
  final book = ref.watch(currentBookProvider);
  if (book == null) {
    return [];
  }
  final currentChapter = ref.watch(currentChapterProvider);
  if (currentChapter == null) {
    return [];
  }
  final index = book.chapters.indexOf(currentChapter);
  final total = book.chapters.length;
  final start = index - 3 >= 0 ? index - 3 : 0;
  final end = start + 20 <= total ? start + 20 : total;
  return book.chapters.sublist(start, end);
}
