import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:smtc_windows/smtc_windows.dart';

class WindowsAudioService {
  final SMTCWindows smtc;
  final Ref ref;
  final AudioPlayer audioPlayer;

  final subscriptions = <StreamSubscription>[];

  WindowsAudioService(this.ref, this.audioPlayer)
    : smtc = SMTCWindows(enabled: false) {
    smtc.setPlaybackStatus(PlaybackStatus.stopped);
    final buttonStream = smtc.buttonPressStream.listen((event) {
      switch (event) {
        case PressedButton.play:
          audioPlayer.play();
          break;
        case PressedButton.pause:
          audioPlayer.pause();
          break;
        case PressedButton.next:
          audioPlayer.seekToNext();
          break;
        case PressedButton.previous:
          audioPlayer.seekToPrevious();
          break;
        case PressedButton.stop:
          audioPlayer.stop();
          break;
        default:
          break;
      }
    });

    final playerStateStream = audioPlayer.playerStateStream.listen((
      state,
    ) async {
      switch (state.processingState) {
        case ProcessingState.ready:
          if (state.playing) {
            await smtc.setPlaybackStatus(PlaybackStatus.playing);
          } else {
            await smtc.setPlaybackStatus(PlaybackStatus.paused);
          }
          break;
        case ProcessingState.completed:
          await smtc.setPlaybackStatus(PlaybackStatus.changing);
          break;
        default:
          break;
      }

      // switch (state) {
      //   case AudioPlaybackState.playing:
      //     await smtc.setPlaybackStatus(PlaybackStatus.playing);
      //     break;
      //   case AudioPlaybackState.paused:
      //     await smtc.setPlaybackStatus(PlaybackStatus.paused);
      //     break;
      //   case AudioPlaybackState.stopped:
      //     await smtc.setPlaybackStatus(PlaybackStatus.stopped);
      //     break;
      //   case AudioPlaybackState.completed:
      //     await smtc.setPlaybackStatus(PlaybackStatus.changing);
      //     break;
      //   default:
      //     break;
      // }
    });

    final positionStream = audioPlayer.positionStream.listen((pos) async {
      await smtc.setPosition(pos);
    });

    final durationStream = audioPlayer.durationStream.listen((duration) async {
      await smtc.setEndTime(duration ?? Duration.zero);
    });

    final currentIndexStream = audioPlayer.currentIndexStream.distinct().listen(
      (index) {
        if (index == null && audioPlayer.audioSources.isEmpty) {
          return;
        }
        final source = audioPlayer.audioSources[index ?? 0];
        if (source is IndexedAudioSource && source.tag is MediaItem) {
          addTrack(source.tag);
        }
        // source
      },
    );

    subscriptions.addAll([
      buttonStream,
      playerStateStream,
      positionStream,
      durationStream,
      currentIndexStream,
    ]);
  }

  Future<void> addTrack(MediaItem mediaItem) async {
    if (!smtc.enabled) {
      await smtc.enableSmtc();
    }
    await smtc.updateMetadata(
      MusicMetadata(
        title: mediaItem.title,
        artist: mediaItem.artist,
        album: mediaItem.album,
        thumbnail: mediaItem.artUri?.toString(),
        // albumArtist: track.artists.firstOrNull?.name ?? "Unknown",
        // thumbnail: (track.album?.images).asUrlString(
        //   placeholder: ImagePlaceholder.albumArt,
        // ),
      ),
    );
  }

  void dispose() {
    smtc.disableSmtc();
    smtc.dispose();
    for (var element in subscriptions) {
      element.cancel();
    }
  }
}
