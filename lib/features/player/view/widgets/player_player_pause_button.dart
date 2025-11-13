import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/features/player/providers/audiobook_player.dart';

class AudiobookPlayerPlayPauseButton extends HookConsumerWidget {
  const AudiobookPlayerPlayPauseButton({
    super.key,
    this.iconSize = 48.0,
  });

  final double iconSize;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(audiobookPlayerProvider);
    final playing = ref.watch(isPlayerPlayingProvider);
    final playPauseController = useAnimationController(
      duration: const Duration(milliseconds: 200),
      initialValue: 1,
    );
    if (playing) {
      playPauseController.forward();
    } else {
      playPauseController.reverse();
    }
    return switch (player.processingState) {
      ProcessingState.loading || ProcessingState.buffering => const Padding(
          padding: EdgeInsets.all(AppElementSizes.paddingRegular),
          child: CircularProgressIndicator(),
        ),
      ProcessingState.completed => IconButton(
          onPressed: () async {
            await player.seekInBook(const Duration(seconds: 0));
            await player.play();
          },
          icon: const Icon(
            Icons.replay,
          ),
        ),
      ProcessingState.ready => IconButton(
          onPressed: () async {
            await player.togglePlayPause();
          },
          iconSize: iconSize,
          icon: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: playPauseController,
          ),
        ),
      ProcessingState.idle => const SizedBox.shrink(),
    };
  }
}
