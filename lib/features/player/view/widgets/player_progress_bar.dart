import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/features/player/providers/audiobook_player.dart';

class AudiobookChapterProgressBar extends HookConsumerWidget {
  const AudiobookChapterProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(absAudioPlayerProvider);
    final currentChapter = ref.watch(currentChapterProvider);
    final position = useStream(
      player.positionInBookStream,
      initialData: const Duration(seconds: 0),
    );
    final buffered = useStream(
      player.bufferedPositionInBookStream,
      initialData: const Duration(seconds: 0),
    );

    // now find the chapter that corresponds to the current time
    // and calculate the progress of the current chapter
    final currentChapterProgress = currentChapter == null
        ? null
        : (player.positionInBook - currentChapter.start);

    final currentChapterBuffered = currentChapter == null
        ? null
        : (player.bufferedPositionInBook - currentChapter.start);

    return ProgressBar(
      progress:
          currentChapterProgress ?? position.data ?? const Duration(seconds: 0),
      total: currentChapter == null
          ? player.book?.duration ?? const Duration(seconds: 0)
          : currentChapter.end - currentChapter.start,
      // ! TODO add onSeek
      onSeek: (duration) {
        player.seekInBook(
          duration + (currentChapter?.start ?? const Duration(seconds: 0)),
        );
        // player.seek(duration);
      },
      thumbRadius: 8,
      buffered:
          currentChapterBuffered ?? buffered.data ?? const Duration(seconds: 0),
      bufferedBarColor: Theme.of(context).colorScheme.secondary,
      timeLabelType: TimeLabelType.remainingTime,
      timeLabelLocation: TimeLabelLocation.below,
    );
  }
}

class AudiobookProgressBar extends HookConsumerWidget {
  const AudiobookProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.read(absAudioPlayerProvider);
    final position = useStream(
      player.positionInBookStream,
      initialData: const Duration(seconds: 0),
    );

    return SizedBox(
      height: AppElementSizes.barHeightLarge,
      child: LinearProgressIndicator(
        value: (position.data ?? const Duration(seconds: 0)).inSeconds /
            (player.book?.duration ?? const Duration(seconds: 0)).inSeconds,
        borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
      ),
    );
  }
}
