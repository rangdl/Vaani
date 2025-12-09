import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:vaani/features/per_book_settings/providers/book_settings_provider.dart';
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/features/player/view/player_expanded.dart';
import 'package:vaani/features/player/view/widgets/speed_selector.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';

final _logger = Logger('PlayerSpeedAdjustButton');

class PlayerSpeedAdjustButton extends HookConsumerWidget {
  const PlayerSpeedAdjustButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.read(audioPlayerProvider);
    final book = ref.read(currentBookProvider);
    final bookId = book?.libraryItemId ?? '_';
    final bookSettings = ref.watch(bookSettingsProvider(bookId));
    final appSettings = ref.watch(appSettingsProvider);
    return TextButton(
      child: Text('${player.speed}x'),
      onPressed: () async {
        pendingPlayerModals++;
        _logger.fine('opening speed selector');
        await showModalBottomSheet<bool>(
          context: context,
          barrierLabel: 'Select Speed',
          builder: (context) {
            return SpeedSelector(
              onSpeedSelected: (speed) {
                player.setSpeed(speed);
                if (appSettings.playerSettings.configurePlayerForEveryBook) {
                  ref
                      .read(
                        bookSettingsProvider(bookId).notifier,
                      )
                      .update(
                        bookSettings.copyWith
                            .playerSettings(preferredDefaultSpeed: speed),
                      );
                } else {
                  ref
                      .read(
                        appSettingsProvider.notifier,
                      )
                      .update(
                        appSettings.copyWith
                            .playerSettings(preferredDefaultSpeed: speed),
                      );
                }
              },
            );
          },
        );
        pendingPlayerModals--;
        _logger.fine('Closing speed selector');
      },
    );
  }
}
