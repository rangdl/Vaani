import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/features/player/providers/abs_provider.dart'
    hide PlayerState;
import 'package:vaani/features/player/core/abs_audio_player.dart';

class AudiobookPlayerPlayPauseButton extends HookConsumerWidget {
  const AudiobookPlayerPlayPauseButton({
    super.key,
    this.iconSize = 48.0,
  });

  final double iconSize;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerStateProvider);

    return IconButton(
      icon: _getIcon(playerState, context),
      onPressed: () => _actionButtonPressed(playerState, ref),
    );
  }

  Widget _getIcon(AbsPlayerState playerState, BuildContext context) {
    if (playerState.playing) {
      return Icon(size: iconSize, Icons.pause);
    } else {
      switch (playerState.processingState) {
        case AbsProcessingState.loading || AbsProcessingState.buffering:
          return CircularProgressIndicator();
        default:
          return Icon(size: iconSize, Icons.play_arrow);
      }
    }
  }

  void _actionButtonPressed(AbsPlayerState playerState, WidgetRef ref) async {
    final player = ref.read(absPlayerProvider);
    if (playerState.playing) {
      await player.pause();
    } else {
      switch (playerState.processingState) {
        case AbsProcessingState.completed:
          await player.seekInBook(const Duration(seconds: 0));
          await player.play();
        default:
          await player.play();
      }
    }
  }
}
