import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/features/player/providers/audiobook_player.dart';
import 'package:vaani/features/player/providers/currently_playing_provider.dart';
import 'package:vaani/features/player/view/player_expanded.dart'
    show pendingPlayerModals;
import 'package:vaani/features/player/view/widgets/playing_indicator_icon.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/shared/extensions/chapter.dart' show ChapterDuration;
import 'package:vaani/shared/extensions/duration_format.dart'
    show DurationFormat;
import 'package:vaani/shared/hooks.dart' show useTimer;

class ChapterSelectionButton extends HookConsumerWidget {
  const ChapterSelectionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tooltip(
      message: S.of(context).chapters,
      child: IconButton(
        icon: const Icon(Icons.menu_book_rounded),
        onPressed: () async {
          pendingPlayerModals++;
          await showModalBottomSheet<bool>(
            context: context,
            barrierLabel: S.of(context).chapterSelect,
            constraints: BoxConstraints(
              // 40% of the screen height
              maxHeight: MediaQuery.of(context).size.height * 0.4,
            ),
            builder: (context) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: ChapterSelectionModal(),
              );
            },
          );
          pendingPlayerModals--;
        },
      ),
    );
  }
}

class ChapterSelectionModal extends HookConsumerWidget {
  const ChapterSelectionModal({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(currentBookProvider);
    final currentChapter = ref.watch(currentChapterProvider);

    final currentChapterIndex = currentChapter?.id;
    final chapterKey = GlobalKey();
    scrollToCurrentChapter() async {
      appLogger.fine('scrolling to chapter');
      await Scrollable.ensureVisible(
        chapterKey.currentContext!,
        duration: 200.ms,
        alignment: 0.5,
        curve: Curves.easeInOut,
      );
    }

    useTimer(scrollToCurrentChapter, 100.ms);
    // useInterval(scrollToCurrentChapter, 500.ms);
    final theme = Theme.of(context);
    return Column(
      children: [
        ListTile(
          title: Text(
            '${S.of(context).chapters} ${currentChapterIndex == null ? '' : ' (${currentChapterIndex + 1}/${session?.chapters.length})'}',
          ),
        ),
        // scroll to current chapter after opening the dialog
        Expanded(
          child: Scrollbar(
            child: SingleChildScrollView(
              primary: true,
              child: session?.chapters == null
                  ? Text(S.of(context).chapterNotFound)
                  : Column(
                      children: session!.chapters.map(
                        (chapter) {
                          final isCurrent = currentChapterIndex == chapter.id;
                          final isPlayed = currentChapterIndex != null &&
                              chapter.id < currentChapterIndex;
                          return ListTile(
                            autofocus: isCurrent,
                            iconColor: isPlayed && !isCurrent
                                ? theme.disabledColor
                                : null,
                            title: Text(
                              chapter.title,
                              style: isPlayed && !isCurrent
                                  ? TextStyle(color: theme.disabledColor)
                                  : null,
                            ),
                            subtitle: Text(
                              '(${chapter.duration.smartBinaryFormat})',
                              style: isPlayed && !isCurrent
                                  ? TextStyle(color: theme.disabledColor)
                                  : null,
                            ),
                            trailing: isCurrent
                                ? const PlayingIndicatorIcon()
                                : const Icon(Icons.play_arrow),
                            selected: isCurrent,
                            key: isCurrent ? chapterKey : null,
                            onTap: () {
                              Navigator.of(context).pop();
                              ref
                                  .read(playerProvider)
                                  .skipToChapter(chapter.id);
                            },
                          );
                        },
                      ).toList(),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
