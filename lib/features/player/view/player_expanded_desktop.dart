import 'dart:math';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/features/item_viewer/view/library_item_hero_section.dart';
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/features/player/view/player_expanded.dart'
    show PlayerExpandedImage;
import 'package:vaani/features/player/view/widgets/audiobook_player_seek_button.dart';
import 'package:vaani/features/player/view/widgets/audiobook_player_seek_chapter_button.dart';
import 'package:vaani/features/player/view/widgets/chapter_selection_button.dart';
import 'package:vaani/features/player/view/widgets/player_player_pause_button.dart';
import 'package:vaani/features/player/view/widgets/player_progress_bar.dart';
import 'package:vaani/features/player/view/widgets/player_speed_adjust_button.dart';
import 'package:vaani/features/skip_start_end/view/skip_start_end_button.dart';
import 'package:vaani/features/sleep_timer/view/sleep_timer_button.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';

var pendingPlayerModals = 0;

class PlayerExpandedDesktop extends HookConsumerWidget {
  const PlayerExpandedDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(currentBookProvider);
    if (book == null) {
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
    final itemBookMetadata = book.metadata.asBookMetadataExpanded;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              top: AppElementSizes.paddingLarge,
              right: AppElementSizes.paddingRegular,
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
                      _buildBookDetails(imageSize, itemBookMetadata),
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
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Theme.of(context).focusColor,
                                width: 1.0,
                                style: BorderStyle.solid, // 可以设置为 dashed 虚线
                              ),
                            ),
                          ),
                          child: ChapterSelectionModal(
                            back: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppElementSizes.paddingRegular,
              ),
              child: const AudiobookChapterProgressBar(
                timeLabelLocation: TimeLabelLocation.sides,
              ),
            ),
            Container(child: _buildBottom()),
          ],
        ),
      ],
    );
  }

  Widget _buildBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Expanded(
          child: Row(
            children: [
              const AudiobookPlayerSeekChapterButton(isForward: false),
              const AudiobookPlayerSeekButton(isForward: false),
              // play/pause button
              const AudiobookPlayerPlayPauseButton(),
              const AudiobookPlayerSeekButton(isForward: true),
              const AudiobookPlayerSeekChapterButton(isForward: true),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const PlayerSpeedAdjustButton(),
              const SleepTimerButton(),
              SkipChapterStartEndButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBookDetails(
      double width, BookMetadataExpanded? itemBookMetadata) {
    return Container(
      padding: EdgeInsets.all(AppElementSizes.paddingLarge),
      width: width,
      child: Column(
        children: [
          // authors info if available
          BookAuthors(
            itemBookMetadata: itemBookMetadata,
            bookDetailsCached: null,
          ),
          // narrators info if available
          BookNarrators(
            itemBookMetadata: itemBookMetadata,
            bookDetailsCached: null,
          ),
          // series info if available
          BookSeries(
            itemBookMetadata: itemBookMetadata,
            bookDetailsCached: null,
          ),
        ],
      ),
    );
  }
}
