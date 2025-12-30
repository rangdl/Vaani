import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_sliver_list/super_sliver_list.dart';
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/features/player/view/player_expanded.dart'
    show pendingPlayerModals;
import 'package:vaani/features/player/view/widgets/playing_indicator_icon.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/shared/extensions/chapter.dart' show ChapterDuration;
import 'package:vaani/shared/extensions/duration_format.dart'
    show DurationFormat;
import 'package:vaani/shared/hooks.dart' show useLayoutEffect;

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
              maxHeight: MediaQuery.of(context).size.height * 0.7,
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
    this.back = true,
  });
  final bool back;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(currentBookProvider);
    final currentChapter = ref.watch(currentChapterProvider);
    if (currentChapter == null || book == null) {
      return SizedBox.shrink();
    }
    final initialIndex = book.chapters.indexOf(currentChapter);
    final scrollController = useScrollController();
    final listController = ListController();

    // 首次布局完成之后跳转到指定位置
    useLayoutEffect(() {
      listController.jumpToItem(
        index: initialIndex,
        scrollController: scrollController,
        alignment: 0.5,
      );
    });
    final theme = Theme.of(context);
    return Column(
      children: [
        ListTile(
          title: Text(
            '${S.of(context).chapters} (${initialIndex + 1}/${book.chapters.length})',
          ),
        ),
        // scroll to current chapter after opening the dialog
        Expanded(
          child: SuperListView.builder(
            listController: listController,
            controller: scrollController,
            itemCount: book.chapters.length,
            itemBuilder: (BuildContext context, int index) {
              final chapter = book.chapters[index];
              final isCurrent = currentChapter.id == chapter.id;
              final isPlayed = index < initialIndex;
              return Container(
                // 自定义autofocus,防止autofocus出现在其他组件底层
                decoration: isCurrent
                    ? BoxDecoration(
                        color: Theme.of(context).focusColor, // 背景色
                      )
                    : null,
                child: ListTile(
                  // autofocus: isCurrent,
                  iconColor:
                      isPlayed && !isCurrent ? theme.disabledColor : null,
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
                  onTap: () {
                    if (back) {
                      Navigator.of(context).pop();
                    } else {
                      ref.read(absPlayerProvider).switchChapter(chapter.id);
                    }
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
