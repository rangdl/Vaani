import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/features/playback_reporting/core/playback_reporter.dart'
    as core;
import 'package:vaani/features/player/providers/audiobook_player.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/globals.dart';

part 'playback_reporter_provider.g.dart';

@Riverpod(keepAlive: true)
class PlaybackReporter extends _$PlaybackReporter {
  @override
  Future<core.PlaybackReporter> build() async {
    final playerSettings = ref.watch(appSettingsProvider).playerSettings;
    final player = ref.watch(playerProvider);
    final api = ref.watch(authenticatedApiProvider);

    final reporter = core.PlaybackReporter(
      player,
      api,
      reportingInterval: playerSettings.playbackReportInterval,
      markCompleteWhenTimeLeft: playerSettings.markCompleteWhenTimeLeft,
      minimumPositionForReporting: playerSettings.minimumPositionForReporting,
      deviceName: deviceName,
      deviceModel: deviceModel,
      deviceSdkVersion: deviceSdkVersion,
      deviceClientName: appName,
      deviceClientVersion: appVersion,
      deviceManufacturer: deviceManufacturer,
    );
    ref.onDispose(reporter.dispose);
    return reporter;
  }
}
