import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';

part 'abs_status.g.dart';

@Riverpod(keepAlive: true)
class PlayerList extends _$PlayerList {
  @override
  List<AudioSource> build() {
    return [];
  }

  Future<void> setAudioBook(BookExpanded book, {Duration? position}) async {}
}
