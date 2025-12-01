import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/features/player/providers/audiobook_player.dart';
import 'package:vaani/features/player/providers/currently_playing_provider.dart';
import 'package:vaani/features/player/view/widgets/player_player_pause_button.dart';
import 'package:vaani/router/router.dart';
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
    final currentChapter = ref.watch(currentChapterProvider);

    return PlayerMinimizedFramework(
      children: [
        // image
        Padding(
          padding: EdgeInsets.all(AppElementSizes.paddingSmall),
          child: GestureDetector(
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
                PlatformText(
                  '${currentBook.metadata.title ?? ''} - ${currentChapter?.title ?? ''}',
                  maxLines: 1, overflow: TextOverflow.ellipsis,
                  // velocity:
                  //     const Velocity(pixelsPerSecond: Offset(16, 0)),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                PlatformText(
                  currentBook.metadata.asBookMetadataExpanded.authorName ?? '',
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
          child: PlatformIconButton(
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
    final player = ref.watch(playerProvider);
    final progress =
        useStream(player.positionStreamInChapter, initialData: Duration.zero);
    return GestureDetector(
      onTap: () {
        if (GoRouterState.of(context).topRoute?.name != Routes.player.name) {
          context.pushNamed(Routes.player.name);
        } else {
          context.pop();
        }
      },
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
                value: (progress.data ?? Duration.zero).inSeconds /
                    (player.chapterDuration?.inSeconds ?? 1),
                // color: Theme.of(context).colorScheme.onPrimaryContainer,
                // backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
