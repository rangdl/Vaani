import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/features/player/view/widgets/player_player_pause_button.dart';
import 'package:vaani/router/router.dart';
import 'package:vaani/shared/extensions/chapter.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';
import 'package:vaani/shared/widgets/shelves/book_shelf.dart';

/// The height of the player when it is minimized
const double playerMinimizedHeight = 70;

class PlayerMinimized extends HookConsumerWidget {
  const PlayerMinimized({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBook = ref.watch(currentBookProvider);
    if (currentBook == null) {
      return SizedBox.shrink();
    }
    return GestureDetector(
      child: Container(
        height: playerMinimizedHeight,
        color: Theme.of(context).colorScheme.surface,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Hero(tag: 'player_hero', child: const PlayerMinimizedControls()),
            PlayerMinimizedProgress(),
          ],
        ),
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
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: playerMinimizedHeight,
                ),
                child: BookCoverWidget(),
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
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: AudiobookPlayerPlayPauseButton(),
          ),
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
      ref.read(audioPlayerProvider).positionInChapterStream,
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
