import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/features/player/providers/session_provider.dart';

class AudiobookPlayerPlayPauseButton extends HookConsumerWidget {
  const AudiobookPlayerPlayPauseButton({
    super.key,
    this.iconSize = 48.0,
  });

  final double iconSize;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playState = ref.watch(playStateProvider);
    final player = ref.read(playerProvider.notifier);
    final playPauseController = useAnimationController(
      duration: const Duration(milliseconds: 200),
      initialValue: 1,
    );
    if (playState.playing) {
      playPauseController.forward();
    } else {
      playPauseController.reverse();
    }
    return switch (playState.processingState) {
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
