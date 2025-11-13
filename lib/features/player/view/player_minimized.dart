import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/api/image_provider.dart';
import 'package:vaani/api/library_item_provider.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/features/player/providers/audiobook_player.dart';
import 'package:vaani/features/player/providers/currently_playing_provider.dart';
import 'package:vaani/features/player/view/widgets/player_player_pause_button.dart';
import 'package:vaani/router/router.dart';
import 'package:vaani/shared/widgets/shelves/book_shelf.dart';

/// The height of the player when it is minimized
const double playerMinimizedHeight = 70;

class PlayerMinimized extends HookConsumerWidget {
  const PlayerMinimized({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBook = ref.watch(currentlyPlayingBookProvider);
    if (currentBook == null) {
      return const SizedBox.shrink();
    }
    final itemBeingPlayed =
        ref.watch(libraryItemProvider(currentBook.libraryItemId));
    final imageOfItemBeingPlayed = itemBeingPlayed.valueOrNull != null
        ? ref.watch(
            coverImageProvider(itemBeingPlayed.valueOrNull!.id),
          )
        : null;
    final imgWidget = imageOfItemBeingPlayed?.valueOrNull != null
        ? Image.memory(
            imageOfItemBeingPlayed!.valueOrNull!,
            fit: BoxFit.cover,
          )
        : const BookCoverSkeleton();
    final bookMetaExpanded = ref.watch(currentBookMetadataProvider);
    final currentChapter = ref.watch(currentPlayingChapterProvider);

    return PlayerMinimizedFramework(
      children: [
        // image
        Padding(
          padding: EdgeInsets.all(AppElementSizes.paddingSmall),
          child: InkWell(
            onTap: () {
              // navigate to item page
              context.pushNamed(
                Routes.libraryItem.name,
                pathParameters: {
                  Routes.libraryItem.pathParamName!: currentBook.libraryItemId,
                },
              );
            },
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: playerMinimizedHeight,
              ),
              child: imgWidget,
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
                  '${bookMetaExpanded?.title ?? ''} - ${currentChapter?.title ?? ''}',
                  maxLines: 1, overflow: TextOverflow.ellipsis,
                  // velocity:
                  //     const Velocity(pixelsPerSecond: Offset(16, 0)),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  bookMetaExpanded?.authorName ?? '',
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
    );
  }
}

class PlayerMinimizedFramework extends HookConsumerWidget {
  final List<Widget> children;

  const PlayerMinimizedFramework({super.key, required this.children});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(audiobookPlayerProvider);
    final progress =
        useStream(player.positionStream, initialData: Duration.zero);
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.player.name),
      child: Container(
        height: playerMinimizedHeight,
        color: Theme.of(context).colorScheme.surface,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Row(
              children: children,
            ),
            SizedBox(
              height: AppElementSizes.barHeight,
              child: LinearProgressIndicator(
                // value: (progress.data ?? Duration.zero).inSeconds /
                //     player.book!.duration.inSeconds,
                value: (progress.data ?? Duration.zero).inSeconds /
                    (player.duration?.inSeconds ?? 1),
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
