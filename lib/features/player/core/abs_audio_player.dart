// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:just_audio/just_audio.dart';
import 'package:shelfsdk/audiobookshelf_api.dart' as api;

class AbsPlayerState {
  api.BookExpanded? book;
  // 当前章节
  final api.BookChapter? currentChapter;
  // 当前音轨序号
  final int currentIndex;

  AbsPlayerState({
    this.book,
    this.currentChapter,
    this.currentIndex = 0,
  });

  AbsPlayerState copyWith({
    api.BookExpanded? book,
    api.BookChapter? currentChapter,
    int? currentIndex,
  }) {
    return AbsPlayerState(
      book: book ?? this.book,
      currentChapter: currentChapter ?? this.currentChapter,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
