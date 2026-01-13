import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shelfsdk/audiobookshelf_api.dart' as shelfsdk;
import 'package:vaani/api/image_provider.dart';
import 'package:vaani/api/library_item_provider.dart';
import 'package:vaani/constants/hero_tag_conventions.dart';
import 'package:vaani/features/item_viewer/view/library_item_page.dart';
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/router/models/library_item_extras.dart';
import 'package:vaani/shared/extensions/duration_format.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';
import 'package:vaani/shared/widgets/skeletons.dart';

class LibraryItemHeroSection extends HookConsumerWidget {
  const LibraryItemHeroSection({
    super.key,
    required this.itemId,
    required this.extraMap,
  });

  final String itemId;
  final LibraryItemExtras? extraMap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // book cover
          LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: calculateWidth(context, constraints),
                child: Column(
                  children: [
                    Hero(
                      tag:
                          HeroTagPrefixes.bookCover +
                          itemId +
                          (extraMap?.heroTagSuffix ?? ''),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: _BookCover(itemId: itemId),
                      ),
                    ),
                    // a progress bar
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        right: 8.0,
                        left: 8.0,
                      ),
                      child: _LibraryItemProgressIndicator(id: itemId),
                    ),
                  ],
                ),
              );
            },
          ),
          // book details
          _BookDetails(id: itemId, extraMap: extraMap),
        ],
      ),
    );
  }
}

class _BookDetails extends HookConsumerWidget {
  const _BookDetails({required this.id, this.extraMap});

  final String id;
  final LibraryItemExtras? extraMap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemFromApi = ref.watch(libraryItemProvider(id));

    final itemBookMetadata =
        itemFromApi.value?.media.metadata.asBookMetadataExpanded;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _BookTitle(extraMap: extraMap, itemBookMetadata: itemBookMetadata),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // authors info if available
                  BookAuthors(
                    itemBookMetadata: itemBookMetadata,
                    bookDetailsCached: extraMap?.book,
                  ),
                  // narrators info if available
                  BookNarrators(
                    itemBookMetadata: itemBookMetadata,
                    bookDetailsCached: extraMap?.book,
                  ),
                  // series info if available
                  BookSeries(
                    itemBookMetadata: itemBookMetadata,
                    bookDetailsCached: extraMap?.book,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LibraryItemProgressIndicator extends HookConsumerWidget {
  const _LibraryItemProgressIndicator({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(currentBookProvider);
    final player = ref.watch(absPlayerProvider);
    final libraryItem = ref.watch(libraryItemProvider(id)).value;
    if (libraryItem == null) {
      return const SizedBox.shrink();
    }

    final mediaProgress = libraryItem.userMediaProgress;
    if (mediaProgress == null && book?.libraryItemId != libraryItem.id) {
      return const SizedBox.shrink();
    }

    double progress;
    Duration remainingTime;
    if (book?.libraryItemId == libraryItem.id) {
      // final positionStream = useStream(player.slowPositionStream);
      progress =
          (player.positionInBook).inSeconds /
          libraryItem.media.asBookExpanded.duration.inSeconds;
      remainingTime =
          libraryItem.media.asBookExpanded.duration - player.positionInBook;
    } else {
      progress = mediaProgress?.progress ?? 0;
      remainingTime =
          (libraryItem.media.asBookExpanded.duration -
          mediaProgress!.currentTime);
    }

    final progressInPercent = progress * 100;

    return Tooltip(
      message: 'Progress: ${progressInPercent.toStringAsFixed(2)}%',
      waitDuration: 200.ms,
      child: Column(
        children: [
          // % progress
          // Text(
          //   // only show 2 decimal places
          //   '${(progressInPercent).toStringAsFixed(
          //     progressInPercent < 10 ? 1 : 0,
          //   )}% completed',
          //   style: Theme.of(context).textTheme.bodySmall,
          // ),

          // progress indicator
          LinearProgressIndicator(
            value: progress.clamp(0.03, 1),
            borderRadius: BorderRadius.circular(8),
            semanticsLabel: 'Book progress',
            semanticsValue: '${progressInPercent.toStringAsFixed(2)}%',
          ),
          const SizedBox.square(dimension: 4.0),
          // time remaining
          Text(
            // only show 2 decimal places
            '${remainingTime.smartBinaryFormat} left',

            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.75),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSectionSubLabelWithIcon extends HookConsumerWidget {
  const _HeroSectionSubLabelWithIcon({required this.icon, required this.text});

  final IconData icon;
  final Widget text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = Theme.of(context);
    final useMaterialThemeOnItemPage = ref
        .watch(appSettingsProvider)
        .themeSettings
        .useMaterialThemeOnItemPage;
    final color = useMaterialThemeOnItemPage
        ? themeData.colorScheme.primary
        : themeData.colorScheme.onSurface.withValues(alpha: 0.75);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8, top: 2),
            child: Icon(icon, size: 16, color: color),
          ),
          Expanded(child: text),
        ],
      ),
    );
  }
}

class BookSeries extends StatelessWidget {
  const BookSeries({
    required this.itemBookMetadata,
    required this.bookDetailsCached,
  });

  final shelfsdk.BookMetadataExpanded? itemBookMetadata;
  final shelfsdk.BookMinified? bookDetailsCached;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    String generateSeriesString() {
      final series = (itemBookMetadata)?.series ?? <shelfsdk.SeriesSequence>[];
      if (series.isEmpty) {
        return (bookDetailsCached?.metadata as shelfsdk.BookMetadataMinified?)
                ?.seriesName ??
            '';
      }
      return series
          .map((e) {
            try {
              e as shelfsdk.SeriesSequence;
              final seq = e.sequence != null ? '#${e.sequence} of ' : '';
              return '$seq${e.name}';
            } catch (e) {
              return '';
            }
          })
          .toList()
          .join(', ');
    }

    return generateSeriesString() == ''
        ? const SizedBox.shrink()
        : _HeroSectionSubLabelWithIcon(
            icon: Icons.library_books_rounded,
            text: Text(
              style: themeData.textTheme.titleSmall,
              generateSeriesString(),
            ),
          );
  }
}

class BookNarrators extends StatelessWidget {
  const BookNarrators({
    required this.itemBookMetadata,
    required this.bookDetailsCached,
  });

  final shelfsdk.BookMetadataExpanded? itemBookMetadata;
  final shelfsdk.BookMinified? bookDetailsCached;

  @override
  Widget build(BuildContext context) {
    String generateNarratorsString() {
      final narrators = (itemBookMetadata)?.narrators ?? [];
      if (narrators.isEmpty) {
        return (bookDetailsCached?.metadata as shelfsdk.BookMetadataMinified?)
                ?.narratorName ??
            '';
      }
      return narrators.join(', ');
    }

    final themeData = Theme.of(context);

    return generateNarratorsString() == ''
        ? const SizedBox.shrink()
        : _HeroSectionSubLabelWithIcon(
            icon: Icons.record_voice_over,
            text: Text(
              style: themeData.textTheme.titleSmall,
              generateNarratorsString(),
            ),
          );
  }
}

class _BookCover extends HookConsumerWidget {
  const _BookCover({required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coverImage = ref.watch(coverImageProvider(itemId));
    // final themeData = Theme.of(context);
    // final item = ref.watch(libraryItemProvider(itemId));
    // final themeSettings = ref.watch(appSettingsProvider).themeSettings;

    // ColorScheme? coverColorScheme;
    // if (themeSettings.useMaterialThemeOnItemPage) {
    //   coverColorScheme = ref
    //       .watch(
    //         themeOfLibraryItemProvider(
    //           itemId,
    //           brightness: Theme.of(context).brightness,
    //           highContrast: themeSettings.highContrast ||
    //               MediaQuery.of(context).highContrast,
    //         ),
    //       )
    //       .valueOrNull;
    // }

    return coverImage.when(
      data: (image) {
        // return const BookCoverSkeleton();
        if (image.isEmpty) {
          return const Icon(Icons.error);
        }

        return Image.memory(image, fit: BoxFit.cover);
      },
      loading: () {
        return const Center(child: BookCoverSkeleton());
      },
      error: (error, stack) {
        return const Center(child: Icon(Icons.error));
      },
    );
  }
}

class _BookTitle extends StatelessWidget {
  const _BookTitle({required this.extraMap, required this.itemBookMetadata});

  final LibraryItemExtras? extraMap;
  final shelfsdk.BookMetadataExpanded? itemBookMetadata;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag:
              HeroTagPrefixes.bookTitle +
              // itemId +
              (extraMap?.heroTagSuffix ?? ''),
          child: Text(
            // mode: AutoScrollTextMode.bouncing,
            // curve: Curves.fastEaseInToSlowEaseOut,
            // velocity: const Velocity(pixelsPerSecond: Offset(30, 0)),
            // delayBefore: 500.ms,
            // pauseBetween: 150.ms,
            // numberOfReps: 3,
            style: themeData.textTheme.headlineLarge,
            itemBookMetadata?.title ?? extraMap?.book?.metadata.title ?? '',
          ),
        ),
        // subtitle if available
        itemBookMetadata?.subtitle == null
            ? const SizedBox.shrink()
            : Text(
                style: themeData.textTheme.titleSmall?.copyWith(
                  color: themeData.colorScheme.onSurface.withValues(alpha: 0.8),
                ),
                itemBookMetadata?.subtitle ?? '',
              ),
      ],
    );
  }
}

class BookAuthors extends StatelessWidget {
  const BookAuthors({
    required this.itemBookMetadata,
    required this.bookDetailsCached,
  });

  final shelfsdk.BookMetadataExpanded? itemBookMetadata;
  final shelfsdk.BookMinified? bookDetailsCached;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    String generateAuthorsString() {
      final authors = (itemBookMetadata)?.authors ?? [];
      if (authors.isEmpty) {
        return (bookDetailsCached?.metadata.asBookMetadataMinified)
                ?.authorName ??
            '';
      }
      return authors.map((e) => e.name).join(', ');
    }

    return generateAuthorsString() == ''
        ? const SizedBox.shrink()
        : _HeroSectionSubLabelWithIcon(
            icon: FontAwesome.pen_nib_solid,
            text: Text(
              style: themeData.textTheme.titleSmall,
              generateAuthorsString(),
            ),
          );
  }
}
