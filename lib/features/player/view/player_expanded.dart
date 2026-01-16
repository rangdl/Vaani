import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/constants/hero_tag_conventions.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/features/player/view/widgets/player_player_pause_button.dart';
import 'package:vaani/features/player/view/widgets/player_progress_bar.dart';
import 'package:vaani/features/skip_start_end/view/skip_start_end_button.dart';
import 'package:vaani/features/sleep_timer/view/sleep_timer_button.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';
import 'package:vaani/shared/widgets/images.dart';

import 'widgets/audiobook_player_seek_button.dart';
import 'widgets/audiobook_player_seek_chapter_button.dart';
import 'widgets/chapter_selection_button.dart';
import 'widgets/player_speed_adjust_button.dart';

var pendingPlayerModals = 0;

class PlayerExpanded extends HookConsumerWidget {
  const PlayerExpanded({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBook = ref.watch(currentBookProvider);
    if (currentBook == null) {
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
    return Column(
      children: [
        // sized box for system status bar; not needed as not full screen
        SizedBox(height: MediaQuery.of(context).padding.top),

        // the image
        Padding(
          padding: EdgeInsets.only(top: AppElementSizes.paddingLarge),
          child: Align(
            alignment: Alignment.center,
            // add a shadow to the image elevation hovering effect
            child: PlayerExpandedImage(id: currentBook.libraryItemId),
          ),
        ),

        // the chapter title
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: AppElementSizes.paddingRegular),
            child: currentChapter == null
                ? const SizedBox()
                : Text(
                    currentChapter.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
        ),

        // the book name and author
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: AppElementSizes.paddingRegular),
            child: Text(
              [
                currentBook.metadata.title ?? '',
                currentBook.metadata.asBookMetadataExpanded.authorName ?? '',
              ].join(' - '),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),

        // the progress bar
        Expanded(
          child: SizedBox(
            width: imageSize,
            child: Padding(
              padding: EdgeInsets.only(
                left: AppElementSizes.paddingRegular,
                right: AppElementSizes.paddingRegular,
              ),
              child: const AbsDesktopProgressBar(),
            ),
          ),
        ),

        // the chapter skip buttons, seek 30 seconds back and forward, and play/pause button
        Expanded(
          flex: 2,
          child: SizedBox(
            width: imageSize,
            height: AppElementSizes.iconSizeRegular,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // previous chapter
                const AudiobookPlayerSeekChapterButton(isForward: false),
                // buttonSkipBackwards
                const AudiobookPlayerSeekButton(isForward: false),
                AudiobookPlayerPlayPauseButton(),
                // buttonSkipForwards
                const AudiobookPlayerSeekButton(isForward: true),
                // next chapter
                const AudiobookPlayerSeekChapterButton(isForward: true),
              ],
            ),
          ),
        ),

        // speed control, sleep timer, chapter list, and settings
        Expanded(
          child: SizedBox(
            width: imageSize,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // speed control
                const PlayerSpeedAdjustButton(),
                const Spacer(),
                // sleep timer
                const SleepTimerButton(),
                const Spacer(),
                // chapter list
                const ChapterSelectionButton(),
                const Spacer(),
                // 跳过片头片尾
                SkipChapterStartEndButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PlayerExpandedImage extends StatelessWidget {
  final String? id;

  const PlayerExpandedImage({super.key, this.id});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            blurRadius: 32,
            spreadRadius: 8,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {},
        child: Hero(
          tag: HeroTagPrefixes.bookCoverWith(id),
          // child: BookCoverWidget(imageSize, itemId: itemId),
          child: AbsBookCover(id: id),
        ),
      ),
    );
  }
}
