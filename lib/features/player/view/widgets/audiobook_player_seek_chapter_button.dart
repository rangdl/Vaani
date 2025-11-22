import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/features/player/providers/session_provider.dart';

class AudiobookPlayerSeekChapterButton extends HookConsumerWidget {
  const AudiobookPlayerSeekChapterButton({
    super.key,
    required this.isForward,
  });

  /// if true, the button seeks forward, else it seeks backwards
  final bool isForward;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(playerProvider);
    return IconButton(
      icon: Icon(
        isForward ? Icons.skip_next : Icons.skip_previous,
        size: AppElementSizes.iconSizeSmall,
      ),
      onPressed: () {
        if (player.session == null) {
          return;
        }
        // if chapter does not exist, go to the start or end of the book
        if (player.currentChapter == null) {
          player
              .seekInBook(isForward ? player.session!.duration : Duration.zero);
          return;
        }
        if (isForward) {
          player.skipToNext();
        } else {
          player.skipToPrevious();
        }
      },
    );
  }
}
