import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/features/player/core/audiobook_player.dart';

abstract class AbsAudioPlayer {
  AbsAudioPlayer._();

  BookExpanded? _book;

  BookExpanded? get book => _book;

  Future<void> play();
  Future<void> pause();
  Future<void> playOrPause();
  Future<void> next();
  Future<void> previous();
  Future<void> seek(Duration position, {int? index});
  Future<void> seekInBook(Duration position);
  Future<void> setSpeed(double speed);
  Future<void> setVolume(double volume);
  Future<void> switchChapter(int chapterId);

  int get currentIndex;

  Duration get position;

  Duration get positionInChapter {
    final globalPosition = positionInBook;
    return globalPosition -
        (book?.findChapterAtTime(globalPosition).start ?? Duration.zero);
  }

  Duration get positionInBook =>
      position + (book?.tracks[currentIndex].startOffset ?? Duration.zero);

  Stream<Duration> get positionStream;

  Stream<Duration> get positionInChapterStream;

  Stream<Duration> get positionInBookStream;
  Stream<Duration> get bufferedPositionInBookStream;
}
