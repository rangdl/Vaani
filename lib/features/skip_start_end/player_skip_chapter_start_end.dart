import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/features/per_book_settings/providers/book_settings_provider.dart';
import 'package:vaani/features/player/providers/audiobook_player.dart';
import 'package:vaani/features/player/view/player_expanded.dart';
import 'package:vaani/settings/view/notification_settings_page.dart';

class SkipChapterStartEndButton extends HookConsumerWidget {
  const SkipChapterStartEndButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tooltip(
      message: "跳过片头片尾",
      child: IconButton(
        icon: const Icon(Icons.fast_forward_rounded),
        onPressed: () async {
          // show toast
          pendingPlayerModals++;
          await showModalBottomSheet<bool>(
            context: context,
            barrierLabel: '跳过片头片尾',
            constraints: BoxConstraints(
              // 40% of the screen height
              maxHeight: MediaQuery.of(context).size.height * 0.4,
            ),
            builder: (context) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: PlayerSkipChapterStartEnd(),
              );
            },
          );
          pendingPlayerModals--;
        },
      ),
    );
  }
}

class PlayerSkipChapterStartEnd extends HookConsumerWidget {
  const PlayerSkipChapterStartEnd({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(audiobookPlayerProvider);
    final bookId = player.book?.libraryItemId ?? '_';
    final bookSettings = ref.watch(bookSettingsProvider(bookId));
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            title: Text(
                '跳过片头 ${bookSettings.playerSettings.skipChapterStart.inSeconds}s'),
          ),
          Expanded(
            child: TimeIntervalSlider(
              defaultValue: bookSettings.playerSettings.skipChapterStart,
              // defaultValue: const Duration(seconds: 0),
              min: const Duration(seconds: 0),
              max: const Duration(seconds: 60),
              step: const Duration(seconds: 1),
              onChangedEnd: (interval) {
                ref
                    .read(
                      bookSettingsProvider(bookId).notifier,
                    )
                    .update(
                      bookSettings.copyWith
                          .playerSettings(skipChapterStart: interval),
                    );
                ref.read(audiobookPlayerProvider).setClip(start: interval);
              },
            ),
          ),
          ListTile(
            title: Text(
                '跳过片尾 ${bookSettings.playerSettings.skipChapterEnd.inSeconds}s'),
          ),
          Expanded(
            child: TimeIntervalSlider(
              defaultValue: bookSettings.playerSettings.skipChapterEnd,
              // defaultValue: const Duration(seconds: 0),
              min: const Duration(seconds: 0),
              max: const Duration(seconds: 60),
              step: const Duration(seconds: 1),
              onChangedEnd: (interval) {
                ref
                    .read(
                      bookSettingsProvider(bookId).notifier,
                    )
                    .update(
                      bookSettings.copyWith
                          .playerSettings(skipChapterEnd: interval),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
