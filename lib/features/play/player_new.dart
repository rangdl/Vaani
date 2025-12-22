import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';

part 'player_new.g.dart';

final _logger = Logger('player');

@Riverpod(keepAlive: true)
Future<PlaybackSessionExpanded> playback(Ref ref, String id) async {
  final api = ref.watch(authenticatedApiProvider);
  try {
    final session = await api.items.play(
      libraryItemId: id,
      parameters: PlayItemReqParams(
        deviceInfo: DeviceInfoReqParams(
          clientVersion: appVersion,
          manufacturer: deviceManufacturer,
          model: deviceModel,
          sdkVersion: deviceSdkVersion,
          clientName: appName,
          deviceName: deviceName,
        ),
        forceDirectPlay: false,
        forceTranscode: false,
        supportedMimeTypes: [
          "audio/flac",
          "audio/mpeg",
          "audio/mp4",
          "audio/ogg",
          "audio/aac",
          "audio/webm",
        ],
      ),
    );
    return session!.asExpanded;
  } catch (e) {
    _logger.severe('Error starting session: $e');
    throw StateError('Error starting session');
  }
}
