import 'dart:math';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/constants/hero_tag_conventions.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/features/item_viewer/view/library_item_hero_section.dart';
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/features/player/view/player_expanded.dart'
    show PlayerExpandedImage;
import 'package:vaani/features/player/view/player_minimized.dart';
import 'package:vaani/features/player/view/widgets/chapter_selection_button.dart';
import 'package:vaani/features/player/view/widgets/player_progress_bar.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';

var pendingPlayerModals = 0;

class PlayerExpandedDesktop extends HookConsumerWidget {
  const PlayerExpandedDesktop({super.key});

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
    final itemBookMetadata = currentBook.metadata.asBookMetadataExpanded;
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
                        child: PlayerExpandedImage(
                          imageSize,
                          itemId: currentBook.libraryItemId,
                        ),
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
                          child: ChapterSelectionModal(back: false),
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
                horizontal: AppElementSizes.paddingLarge,
              ),
              child: const AbsDesktopProgressBar(
                timeLabelLocation: TimeLabelLocation.sides,
              ),
            ),
            SizedBox(
              height: playerMinHeight,
              child: MouseRegion(
                cursor: SystemMouseCursors.click, // 桌面端显示手型光标
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    context.pop();
                  },
                  child: _buildBottom(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottom() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Row()),
        Expanded(
          flex: 1,
          child: Hero(
            tag: HeroTagPrefixes.controlsCenter,
            child: const PlayerControlsDesktopCenter(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Hero(
            tag: HeroTagPrefixes.controlsRight,
            child: const PlayerControlsDesktopRight(),
          ),
        ),
      ],
    );
  }

  Widget _buildBookDetails(
    double width,
    BookMetadataExpanded? itemBookMetadata,
  ) {
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
