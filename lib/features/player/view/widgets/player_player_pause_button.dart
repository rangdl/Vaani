import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/features/player/core/player_status.dart';
import 'package:vaani/features/player/providers/player_status_provider.dart';
import 'package:vaani/features/player/providers/audiobook_player.dart';

class AudiobookPlayerPlayPauseButton extends HookConsumerWidget {
  const AudiobookPlayerPlayPauseButton({
    super.key,
    this.iconSize = 48.0,
  });

  final double iconSize;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerStatus =
        ref.watch(playerStatusProvider.select((v) => v.playStatus));

    return PlatformIconButton(
      icon: _getIcon(playerStatus, context),
      onPressed: () => _actionButtonPressed(playerStatus, ref),
    );
  }

  Widget _getIcon(PlayStatus playerStatus, BuildContext context) {
    switch (playerStatus) {
      case PlayStatus.playing:
        return Icon(size: iconSize, PlatformIcons(context).pause);
      case PlayStatus.paused:
        return Icon(size: iconSize, PlatformIcons(context).playArrow);
      case PlayStatus.loading:
        return PlatformCircularProgressIndicator();
      default:
        return Icon(size: iconSize, PlatformIcons(context).playArrow);
    }
  }

  void _actionButtonPressed(PlayStatus playerStatus, WidgetRef ref) async {
    final player = ref.read(playerProvider);
    switch (playerStatus) {
      case PlayStatus.loading:
        break;
      case PlayStatus.playing:
        await player.pause();
        break;
      case PlayStatus.completed:
        await player.seekInBook(const Duration(seconds: 0));
        await player.play();
        break;
      default:
        await player.play();
    }
  }
}
