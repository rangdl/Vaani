// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:shelfsdk/audiobookshelf_api.dart' as core;
// import 'package:vaani/api/api_provider.dart';
// import 'package:vaani/api/library_item_provider.dart';
// import 'package:vaani/features/downloads/providers/download_manager.dart';
// import 'package:vaani/features/per_book_settings/providers/book_settings_provider.dart';
// import 'package:vaani/features/player/providers/audiobook_player.dart';
// import 'package:vaani/features/settings/app_settings_provider.dart';
// import 'package:vaani/globals.dart';

// part 'currently_playing_provider.g.dart';

// @riverpod
// class CurrentBook extends _$CurrentBook {
//   @override
//   core.BookExpanded? build() {
//     return null;
//   }

//   Future<void> update(core.BookExpanded book, Duration? currentTime) async {
//     final audioService = ref.read(playerProvider);
//     if (state == book) {
//       appLogger.info('Book was already set');
//       if (audioService.player.playing) {
//         appLogger.info('Pausing the book');
//         await audioService.pause();
//         return;
//       } else {
//         await audioService.play();
//       }
//     }
//     state = book;
//     final api = ref.read(authenticatedApiProvider);
//     final downloadManager = ref.read(simpleDownloadManagerProvider);
//     final libItem =
//         await ref.read(libraryItemProvider(state!.libraryItemId).future);
//     final downloadedUris = await downloadManager.getDownloadedFilesUri(libItem);

//     var bookPlayerSettings =
//         ref.read(bookSettingsProvider(state!.libraryItemId)).playerSettings;
//     var appPlayerSettings = ref.read(appSettingsProvider).playerSettings;

//     var configurePlayerForEveryBook =
//         appPlayerSettings.configurePlayerForEveryBook;
//     audioService.setSourceAudiobook(
//       state!,
//       baseUrl: api.baseUrl,
//       token: api.token!,
//       initialPosition: currentTime,
//       downloadedUris: downloadedUris,
//       volume: configurePlayerForEveryBook
//           ? bookPlayerSettings.preferredDefaultVolume ??
//               appPlayerSettings.preferredDefaultVolume
//           : appPlayerSettings.preferredDefaultVolume,
//       speed: configurePlayerForEveryBook
//           ? bookPlayerSettings.preferredDefaultSpeed ??
//               appPlayerSettings.preferredDefaultSpeed
//           : appPlayerSettings.preferredDefaultSpeed,
//     );
//   }
// }

// @riverpod
// class CurrentChapter extends _$CurrentChapter {
//   @override
//   core.BookChapter? build() {
//     final player = ref.watch(playerProvider);
//     player.chapterStream.distinct().listen((chapter) {
//       update(chapter);
//     });
//     return player.currentChapter;
//   }

//   void update(core.BookChapter? chapter) {
//     if (state != chapter) {
//       state = chapter;
//     }
//   }
// }
