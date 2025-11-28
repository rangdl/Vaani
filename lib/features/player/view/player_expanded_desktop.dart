import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/features/player/providers/audiobook_player.dart';
import 'package:vaani/features/player/providers/currently_playing_provider.dart';
import 'package:vaani/features/player/view/player_expanded.dart'
    show PlayerExpandedImage;
import 'package:vaani/features/player/view/player_minimized.dart';
import 'package:vaani/features/player/view/widgets/audiobook_player_seek_button.dart';
import 'package:vaani/features/player/view/widgets/audiobook_player_seek_chapter_button.dart';
import 'package:vaani/features/player/view/widgets/player_player_pause_button.dart';
import 'package:vaani/features/player/view/widgets/player_speed_adjust_button.dart';
import 'package:vaani/features/skip_start_end/view/skip_start_end_button.dart';
import 'package:vaani/features/sleep_timer/view/sleep_timer_button.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/shared/extensions/chapter.dart';
import 'package:vaani/shared/extensions/duration_format.dart';

var pendingPlayerModals = 0;

class PlayerExpandedDesktop extends HookConsumerWidget {
  const PlayerExpandedDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    if (session == null) {
      return SizedBox.shrink();
    }

    /// all the properties that help in building the widget are calculated from the [percentageExpandedPlayer]
    /// however, some properties need to start later than 0% and end before 100%
    final currentChapter = ref.watch(currentChapterProvider);
    // final currentBookMetadata = ref.watch(currentBookMetadataProvider);
    // max height of the player is the height of the screen
    final playerMaxHeight = MediaQuery.of(context).size.height;
    final availWidth = MediaQuery.of(context).size.width;
    // the image width when the player is expanded
    final imageSize = min(playerMaxHeight * 0.5, availWidth * 0.9);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              top: AppElementSizes.paddingLarge,
              bottom: playerMinHeight + 40,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 45,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        // add a shadow to the image elevation hovering effect
                        child: PlayerExpandedImage(imageSize),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // previous chapter
                          const AudiobookPlayerSeekChapterButton(
                              isForward: false),
                          // buttonSkipBackwards
                          const AudiobookPlayerSeekButton(isForward: false),
                          AudiobookPlayerPlayPauseButton(),
                          // buttonSkipForwards
                          const AudiobookPlayerSeekButton(isForward: true),
                          // next chapter
                          const AudiobookPlayerSeekChapterButton(
                              isForward: true),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // speed control
                          const PlayerSpeedAdjustButton(),
                          const Spacer(),
                          // sleep timer
                          const SleepTimerButton(),
                          const Spacer(),
                          // 跳过片头片尾
                          SkipChapterStartEndButton(),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      currentChapter == null
                          ? SizedBox.shrink()
                          : Text(
                              currentChapter.title,
                              style: Theme.of(context).textTheme.titleLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                      Expanded(
                        child: ChapterSelection(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Hero(tag: 'player_hero', child: const PlayerMinimized()),
      ],
    );
  }
}

class ChapterSelection extends HookConsumerWidget {
  const ChapterSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentChapter = ref.watch(currentChapterProvider);
    if (currentChapter == null) {
      return SizedBox.shrink();
    }

    final currentChapters = ref.watch(currentChaptersProvider);
    final currentChapterIndex = currentChapters.indexOf(currentChapter);
    final theme = Theme.of(context);
    return Scrollbar(
      child: ListView.builder(
        itemCount: currentChapters.length,
        itemBuilder: (context, index) {
          final chapter = currentChapters[index];
          final isCurrent = currentChapterIndex == index;
          final isPlayed = index < currentChapterIndex;
          return ListTile(
            autofocus: isCurrent,
            iconColor: isPlayed && !isCurrent ? theme.disabledColor : null,
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
            // trailing: isCurrent
            //     ? const PlayingIndicatorIcon()
            //     : const Icon(Icons.play_arrow),
            selected: isCurrent,
            // key: isCurrent ? chapterKey : null,
            onTap: () {
              ref.read(playerProvider).skipToChapter(chapter.id);
            },
          );
        },
      ),
    );
  }
}
