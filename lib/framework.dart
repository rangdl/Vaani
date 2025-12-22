import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/features/downloads/providers/download_manager.dart';
import 'package:vaani/features/playback_reporting/providers/playback_reporter_provider.dart';
import 'package:vaani/features/shake_detector/shake_detector_provider.dart';
import 'package:vaani/features/sleep_timer/providers/sleep_timer_provider.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/shared/utils/helper.dart';
import 'package:vaani/shared/widgets/tray_manager.dart';

class Framework extends ConsumerWidget {
  final Widget child;

  const Framework(this.child, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Eagerly initialize providers by watching them.
    // By using "watch", the provider will stay alive and not be disposed.
    try {
      ref.watch(simpleDownloadManagerProvider);
      if (Helper.isAndroid()) ref.watch(shakeDetectorProvider);
      ref.watch(sleepTimerProvider);
      // ref.watch(skipStartEndProvider);
      ref.watch(playbackReporterProvider);
    } catch (e) {
      // debugPrintStack(stackTrace: StackTrace.current, label: e.toString());
      appLogger.severe(e.toString());
    }
    if (Helper.isDesktop()) return TrayManager(child);
    return child;
  }
}
