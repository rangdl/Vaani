import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';

/// 进度条展示 根据设置显示章节进度或整本书的进度
class AbsDesktopProgressBar extends HookConsumerWidget {
  final TimeLabelLocation timeLabelLocation;
  const AbsDesktopProgressBar({
    super.key,
    this.timeLabelLocation = TimeLabelLocation.below,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(absPlayerProvider);
    final currentChapter = ref.watch(currentChapterProvider);
    final playerSettings =
        ref.watch(appSettingsProvider.select((v) => v.playerSettings));
    final showChapterProgress =
        playerSettings.expandedPlayerSettings.showChapterProgress;

    final position = ref.watch(progressProvider);
    final buffered = ref.watch(progressBufferedProvider);

    final total = ref.watch(totalProvider);
    return ProgressBar(
      progress: position.requireValue,
      total: total,
      onSeek: (duration) {
        player.seekInBook(
          duration +
              (showChapterProgress
                  ? (currentChapter?.start ?? Duration.zero)
                  : Duration.zero),
        );
      },
      thumbRadius: 8,
      buffered: buffered.requireValue,
      bufferedBarColor: Theme.of(context).colorScheme.secondary,
      timeLabelType: TimeLabelType.remainingTime,
      timeLabelLocation: timeLabelLocation,
    );
  }
}

// 书籍进度 简化版
class AbsMinimizedProgress extends HookConsumerWidget {
  const AbsMinimizedProgress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(progressProvider);
    final total = ref.watch(totalProvider);
    return SizedBox(
      height: AppElementSizes.barHeight,
      child: LinearProgressIndicator(
        value: total > Duration.zero
            ? ((position.value ?? Duration.zero).inSeconds / total.inSeconds)
            : 0,
      ),
    );
  }
}
