import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:vaani/features/per_book_settings/providers/book_settings_provider.dart';
import 'package:vaani/features/player/providers/audiobook_player.dart';
import 'package:vaani/features/player/view/player_expanded.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/features/settings/view/notification_settings_page.dart';

class SkipChapterStartEndButton extends HookConsumerWidget {
  const SkipChapterStartEndButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tooltip(
      message: S.of(context).chapterSkip,
      child: IconButton(
        // icon: const Icon(Icons.fast_forward_rounded),
        icon: const Icon(FontAwesome.arrow_right_to_bracket_solid),
        onPressed: () async {
          // show toast
          pendingPlayerModals++;
          await showModalBottomSheet<bool>(
            context: context,
            barrierLabel: S.of(context).chapterSkip,
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
    final session = ref.watch(sessionProvider);
    final bookId = session?.libraryItemId ?? '_';
    final bookSettings = ref.watch(bookSettingsProvider(bookId));
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            title: Text(
              '${S.of(context).chapterSkipOpen}${bookSettings.playerSettings.skipChapterStart.inSeconds}s',
            ),
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
              },
            ),
          ),
          ListTile(
            title: Text(
              '${S.of(context).chapterSkipEnd}${bookSettings.playerSettings.skipChapterEnd.inSeconds}s',
            ),
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
