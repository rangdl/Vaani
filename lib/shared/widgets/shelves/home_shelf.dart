import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/l10n/generated/l10n.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';
import 'package:vaani/shared/widgets/shelves/author_shelf.dart';
import 'package:vaani/shared/widgets/shelves/book_shelf.dart';

/// A shelf that displays books/authors/series on the home page
///
/// this will build the appropriate shelf based on the type of the shelf
class HomeShelf extends HookConsumerWidget {
  const HomeShelf({super.key, required this.shelf});

  final Shelf shelf;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageSettings = ref.watch(
      appSettingsProvider.select((v) => v.homePageSettings),
    );
    return switch (shelf.type) {
      ShelfType.book => BookHomeShelf(
        title: _showLabel(context),
        shelf: shelf.asLibraryItemShelf,
        showPlayButton: switch (shelf.id) {
          'continue-listening' =>
            homePageSettings.showPlayButtonOnContinueListeningShelf,
          'continue-series' =>
            homePageSettings.showPlayButtonOnContinueSeriesShelf,
          'listen-again' => homePageSettings.showPlayButtonOnListenAgainShelf,
          _ => homePageSettings.showPlayButtonOnAllRemainingShelves,
        },
      ),
      ShelfType.authors => AuthorHomeShelf(
        title: _showLabel(context),
        shelf: shelf.asAuthorShelf,
      ),
      _ => Container(),
    };
  }

  String _showLabel(context) => switch (shelf.label) {
    "Continue Listening" => S.of(context).homeBookContinueListening,
    "Continue Series" => S.of(context).homeBookContinueSeries,
    "Recently Added" => S.of(context).homeBookRecentlyAdded,
    "Recommended" => S.of(context).homeBookRecommended,
    "Discover" => S.of(context).homeBookDiscover,
    "Listen Again" => S.of(context).homeBookListenAgain,
    "Newest Authors" => S.of(context).homeBookNewestAuthors,
    _ => shelf.label,
  };
}

/// A shelf that displays children on the home page
class SimpleHomeShelf extends HookConsumerWidget {
  const SimpleHomeShelf({
    super.key,
    required this.children,
    required this.title,
    this.height,
  });

  /// the title of the shelf
  final String title;

  /// the children to display on the shelf
  final List<Widget> children;
  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if height is null take up 30% of the smallest screen dimension

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text(title, style: Theme.of(context).textTheme.titleMedium),
          ),
          // fix the height of the shelf as a percentage of the screen height
          SizedBox(
            height: height ?? getDefaultShelfHeight(context, perCent: 0.45),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0 || index == children.length + 1) {
                  return const SizedBox(width: 8);
                }
                return children[index - 1];
              },
              separatorBuilder: (context, index) {
                if (index == 0 || index == children.length + 1) {
                  return const SizedBox();
                }

                return const SizedBox(width: 4);
              },
              itemCount:
                  children.length +
                  2, // add some extra space at the start and end so that the first and last items are not at the edge
            ),
          ),
        ],
      ),
    );
  }

  /// get the height of the shelf based on the screen size
  /// the height is the height parent wants the shelf to be
  /// but it should not be less than 150 so we take the max of 150 and the height in the end
  /// ignoreWidth is used to ignore the width of the screen and take only the height into consideration else smallest side is taken so that shelf is not too big on tablets
  double getDefaultShelfHeight(
    BuildContext context, {
    bool ignoreWidth = false,
    atMin = 150.0,
    perCent = 0.3,
  }) {
    double referenceSide;
    if (ignoreWidth) {
      referenceSide = MediaQuery.of(context).size.height;
    } else {
      referenceSide = min(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      );
    }
    return max(atMin, referenceSide * perCent);
  }
}
