import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/constants/hero_tag_conventions.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/features/player/view/widgets/audiobook_player_seek_button.dart';
import 'package:vaani/features/player/view/widgets/audiobook_player_seek_chapter_button.dart';
import 'package:vaani/features/player/view/widgets/player_player_pause_button.dart';
import 'package:vaani/features/player/view/widgets/player_speed_adjust_button.dart';
import 'package:vaani/features/skip_start_end/view/skip_start_end_button.dart';
import 'package:vaani/features/sleep_timer/view/sleep_timer_button.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/router/router.dart';
import 'package:vaani/shared/extensions/chapter.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';
import 'package:vaani/shared/widgets/shelves/book_shelf.dart';

class PlayerMinimized extends HookConsumerWidget {
  const PlayerMinimized({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBook = ref.watch(currentBookProvider);
    if (currentBook == null) {
      return SizedBox.shrink();
    }
    final size = MediaQuery.of(context).size;
    // 竖屏
    final isVertical = size.height > size.width;
    return Container(
      height: playerMinHeight,
      color: Theme.of(context).colorScheme.surface,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          isVertical
              ? const PlayerMinimizedControls()
              : const PlayerMinimizedControlsDesktop(),
          const PlayerMinimizedProgress(),
        ],
      ),
    );
  }
}

class PlayerMinimizedControls extends HookConsumerWidget {
  const PlayerMinimizedControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBook = ref.watch(currentBookProvider);
    final currentChapter = ref.watch(currentChapterProvider);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (GoRouterState.of(context).topRoute?.name != Routes.player.name) {
          context.pushNamed(Routes.player.name);
        } else {
          context.pop();
        }
      },
      child: Row(
        children: [
          // image
          Padding(
            padding: EdgeInsets.all(AppElementSizes.paddingSmall),
            child: GestureDetector(
              onTap: () {
                // navigate to item page
                if (currentBook != null) {
                  context.pushNamed(
                    Routes.libraryItem.name,
                    pathParameters: {
                      Routes.libraryItem.pathParamName!:
                          currentBook.libraryItemId,
                    },
                  );
                }
              },
              child: Hero(
                tag: HeroTagPrefixes.bookCoverWith(currentBook?.libraryItemId),
                child: BookCoverWidget(
                  playerMinHeight,
                  itemId: currentBook?.libraryItemId,
                ),
              ),
            ),
          ),
          // author and title of the book
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppElementSizes.paddingRegular,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // AutoScrollText(
                  Text(
                    '${currentBook?.metadata.title ?? ''} - ${currentChapter?.title ?? ''}',
                    maxLines: 1, overflow: TextOverflow.ellipsis,
                    // velocity:
                    //     const Velocity(pixelsPerSecond: Offset(16, 0)),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    currentBook?.metadata.asBookMetadataExpanded.authorName ??
                        '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.7),
                        ),
                  ),
                ],
              ),
            ),
          ),

          // rewind button
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              icon: const Icon(
                Icons.replay_30,
                size: AppElementSizes.iconSizeSmall,
              ),
              onPressed: () {},
            ),
          ),

          // play/pause button
          const AudiobookPlayerPlayPauseButton(),
        ],
      ),
    );
  }
}

class PlayerMinimizedProgress extends HookConsumerWidget {
  const PlayerMinimizedProgress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentChapter = ref.watch(currentChapterProvider);

    final progress = useStream(
      ref.read(absPlayerProvider).positionInChapterStream,
      initialData: Duration.zero,
    );
    return SizedBox(
      height: AppElementSizes.barHeight,
      child: LinearProgressIndicator(
        value: (progress.data ?? Duration.zero).inSeconds /
            (currentChapter?.duration.inSeconds ?? 1),
        // color: Theme.of(context).colorScheme.onPrimaryContainer,
        // backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }
}

class PlayerMinimizedControlsDesktop extends HookConsumerWidget {
  const PlayerMinimizedControlsDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBook = ref.watch(currentBookProvider);
    final currentChapter = ref.watch(currentChapterProvider);

    return MouseRegion(
      cursor: SystemMouseCursors.click, // 桌面端显示手型光标
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (GoRouterState.of(context).topRoute?.name != Routes.player.name) {
            context.pushNamed(Routes.player.name);
          } else {
            context.pop();
          }
        },
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  // image
                  Padding(
                    padding: EdgeInsets.all(AppElementSizes.paddingSmall),
                    child: GestureDetector(
                      onTap: () {
                        // navigate to item page
                        if (currentBook != null) {
                          context.pushNamed(
                            Routes.libraryItem.name,
                            pathParameters: {
                              Routes.libraryItem.pathParamName!:
                                  currentBook.libraryItemId,
                            },
                          );
                        }
                      },
                      child: Hero(
                        tag: HeroTagPrefixes.bookCoverWith(
                            currentBook?.libraryItemId),
                        child: BookCoverWidget(
                          playerMinHeight,
                          itemId: currentBook?.libraryItemId,
                        ),
                      ),
                    ),
                  ),
                  // author and title of the book
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: AppElementSizes.paddingRegular,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // AutoScrollText(
                          Text(
                            currentChapter?.title ??
                                currentBook?.metadata.title ??
                                '',
                            maxLines: 1, overflow: TextOverflow.ellipsis,
                            // velocity:
                            //     const Velocity(pixelsPerSecond: Offset(16, 0)),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            currentBook?.metadata.asBookMetadataExpanded
                                    .authorName ??
                                '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withValues(alpha: 0.7),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
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
        ),
      ),
    );
  }
}

class PlayerControlsDesktopCenter extends StatelessWidget {
  const PlayerControlsDesktopCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AudiobookPlayerSeekChapterButton(isForward: false),
        const AudiobookPlayerSeekButton(isForward: false),
        // play/pause button
        const AudiobookPlayerPlayPauseButton(),
        const AudiobookPlayerSeekButton(isForward: true),
        const AudiobookPlayerSeekChapterButton(isForward: true),
      ],
    );
  }
}

class PlayerControlsDesktopRight extends StatelessWidget {
  const PlayerControlsDesktopRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const PlayerSpeedAdjustButton(),
        const SleepTimerButton(),
        const SkipChapterStartEndButton(),
      ],
    );
  }
}
