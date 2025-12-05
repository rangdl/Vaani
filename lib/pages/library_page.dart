import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/api/image_provider.dart';
import 'package:vaani/api/library_provider.dart';
import 'package:vaani/features/you/view/widgets/library_switch_chip.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/router/router.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';
import 'package:vaani/shared/icons/abs_icons.dart';
import 'package:vaani/shared/widgets/shelves/book_shelf.dart';

// TODO: implement the library page
class LibraryPage extends HookConsumerWidget {
  const LibraryPage({this.libraryId, super.key});

  final String? libraryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLibrary = ref.watch(currentLibraryProvider).valueOrNull;

    // Determine the icon to use, with a fallback
    final IconData libraryIconData =
        AbsIcons.getIconByName(currentLibrary?.icon) ?? Icons.library_books;

    // Determine the title text
    final String appBarTitle = currentLibrary?.name ?? S.of(context).library;
    // set the library id as the active library
    // if (libraryId != null) {
    //   ref.read(apiSettingsProvider.notifier).updateState(
    //         ref.watch(apiSettingsProvider).copyWith(activeLibraryId: libraryId),
    //       );
    // }

    final views = ref.watch(currentLibraryItemsProvider);
    final scrollController = useScrollController();

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: Text(appBarTitle),
          onTap: () {
            // scroll to the top of the page
            scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            // refresh the view
            ref.invalidate(personalizedViewProvider);
          },
        ),
        leading: IconButton(
          icon: Icon(libraryIconData),
          tooltip:
              S.of(context).librarySwitchTooltip, // Helpful tooltip for users
          onPressed: () {
            showLibrarySwitcher(context, ref);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            tooltip: '刷新', // Helpful tooltip for users
            onPressed: () {
              return ref.refresh(currentLibraryItemsProvider);
            },
          ),
          IconButton(
            icon: Icon(Icons.download),
            tooltip: S.of(context).bookDownloads, // Helpful tooltip for users
            onPressed: () {
              GoRouter.of(context).pushNamed(Routes.downloads.name);
            },
          ),
        ],
      ),
      // drawer: const MyDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          return ref.refresh(currentLibraryItemsProvider);
        },
        child: views.when(
          data: (data) {
            return LayoutBuilder(
              builder: (context, constraints) {
                final height = getDefaultHeight(context);
                // final height = min(constraints.maxHeight, 500.0);
                final width = height * 0.75;
                return AlignedGridView.count(
                  crossAxisCount: constraints.maxWidth ~/ width,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  padding: EdgeInsets.only(top: 0, left: 8, right: 8),
                  itemCount: data.length,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return LibraryPageItem(
                      item: data[index],
                    );
                  },
                );
              },
            );
          },
          loading: () => const LibraryPageSkeleton(),
          error: (error, stack) {
            return Text('Error: $error');
          },
        ),
      ),
    );
  }

  double getDefaultHeight(
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

// 加载
class LibraryPageSkeleton extends StatelessWidget {
  const LibraryPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class LibraryPageItem extends HookConsumerWidget {
  const LibraryPageItem({
    super.key,
    required this.item,
  });
  final LibraryItem item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = item.media.asBookMinified;
    final metadata = book.metadata.asBookMetadataMinified;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookCoverWidget(itemId: item.id),
        const SizedBox(height: 3),
        Text(
          metadata.title ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 3),
        Text(
          metadata.authorName ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class BookCoverWidget extends HookConsumerWidget {
  const BookCoverWidget({
    super.key,
    required this.itemId,
  });

  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coverImage = ref.watch(coverImageProvider(itemId));

    return coverImage.when(
      data: (image) {
        // return const BookCoverSkeleton();
        if (image.isEmpty) {
          return const Icon(Icons.error);
        }

        return Image.memory(
          image,
          fit: BoxFit.cover,
        );
      },
      loading: () {
        return const Center(
          child: BookCoverSkeleton(),
        );
      },
      error: (error, stack) {
        return const Center(child: Icon(Icons.error));
      },
    );
  }
}
