import 'dart:math';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/api/library_provider.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/features/you/view/widgets/library_switch_chip.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/router/models/library_item_extras.dart';
import 'package:vaani/router/router.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';
import 'package:vaani/shared/extensions/style.dart';
import 'package:vaani/shared/icons/abs_icons.dart';
import 'package:vaani/shared/utils/components.dart';
import 'package:vaani/shared/utils/side_sheet.dart';
import 'package:vaani/shared/widgets/images.dart';

/// 媒体库页面
class LibraryPage extends HookConsumerWidget {
  const LibraryPage({this.libraryId, super.key});

  final String? libraryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLibrary = ref.watch(currentLibraryProvider).value;

    // Determine the icon to use, with a fallback
    final IconData libraryIconData =
        AbsIcons.getIconByName(currentLibrary?.icon) ?? Icons.library_books;

    // Determine the title text
    final String appBarTitle = currentLibrary?.name ?? S.of(context).library;

    final pageData = ref.watch(libraryItemsProvider());
    final items = pageData.items;

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
          tooltip: S
              .of(context)
              .librarySwitchTooltip, // Helpful tooltip for users
          onPressed: () {
            showLibrarySwitcher(context, ref);
          },
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.filter_list),
          //   tooltip: '筛选', // Helpful tooltip for users
          //   onPressed: () {
          //     debugPrint('筛选');
          //   },
          // ),
          const LibraryItemsSort(),
          IconButton(
            icon: Icon(Icons.bar_chart),
            tooltip: '统计',
            onPressed: () =>
                GoRouter.of(context).pushNamed(Routes.libraryStatistics.name),
          ),
          IconButton(
            icon: Icon(Icons.arrow_circle_left),
            tooltip: '侧边弹出Sheet',
            onPressed: () => SideSheet.right(context, body: Text('data')),
          ),
          IconButton(
            icon: Icon(Icons.download),
            tooltip: S.of(context).bookDownloads, // Helpful tooltip for users
            onPressed: () =>
                GoRouter.of(context).pushNamed(Routes.downloads.name),
          ),
          const LibraryItemsMore(),
        ],
      ),
      body: EasyRefresh(
        header: Components.easyRefreshHeader(context),
        footer: Components.easyRefreshFooter(context),
        onRefresh: () => ref.read(libraryItemsProvider().notifier).refresh(),
        onLoad: () => ref.read(libraryItemsProvider().notifier).loadMore(),
        child: _EasyRefreshLayoutBuilder(
          items,
          scrollController: scrollController,
        ),
      ),
    );
  }
}

class LibraryPageItem extends HookConsumerWidget {
  const LibraryPageItem({super.key, required this.item, required this.width});
  final LibraryItemMinified item;
  final double width;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = item.media.metadata.title ?? '';
    final subTitle = item.collapsedSeries != null
        ? '${item.collapsedSeries!.asNumBooks.numBooks}图书'
        : item.media.metadata.asBookMetadataMinified.authorName ?? '';
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    final height =
        width +
        15 +
        (bodyLarge?.calculateHeight ?? 0) +
        (bodySmall?.calculateHeight ?? 0);
    return InkWell(
      onTap: () {
        if (item.collapsedSeries != null) {
          context.pushNamed(Routes.series.name, extra: item.collapsedSeries);
          return;
        }
        context.pushNamed(
          Routes.libraryItem.name,
          pathParameters: {Routes.libraryItem.pathParamName!: item.id},
          extra: LibraryItemExtras(book: item.media.asBookMinified),
        );
      },
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: AbsBookCover(id: item.id)),
            const SizedBox(height: 3),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: bodyLarge,
            ),
            const SizedBox(height: 2),
            Text(
              subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class LibraryItemsSort extends HookConsumerWidget {
  const LibraryItemsSort({this.seriesId, super.key});
  final String? seriesId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return IconButton(
    //   icon: Icon(Icons.sort),
    //   tooltip: '排序', // Helpful tooltip for users
    //   onPressed: () {
    //     debugPrint('排序');
    //   },
    // );
    final state = ref.watch(libraryItemsProvider(seriesId: seriesId));
    String selected = state.sort;
    return DropdownSearch<String>(
      selectedItem: selected,
      mode: Mode.custom,
      items: (filter, loadProps) => state.sortList,
      dropdownBuilder: (ctx, selectedItem) {
        return Container(
          padding: EdgeInsets.all(AppElementSizes.paddingRegular),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(state.sortDisplay(selectedItem ?? '')),
              state.desc
                  ? const Icon(Icons.keyboard_arrow_down)
                  : const Icon(Icons.keyboard_arrow_up),
            ],
          ),
        );
      },
      popupProps: PopupProps.menu(
        menuProps: MenuProps(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppElementSizes.borderRadiusRegular),
          ),
          popUpAnimationStyle: AnimationStyle(duration: Duration.zero),
        ),
        constraints: BoxConstraints(
          minWidth: 180,
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        itemBuilder: (context, item, isDisabled, isSelected) => ListTile(
          title: Text(state.sortDisplay(item)),
          trailing: selected == item
              ? state.desc
                    ? const Icon(Icons.keyboard_arrow_down)
                    : const Icon(Icons.keyboard_arrow_up)
              : null,
        ),
        fit: FlexFit.loose,
      ),
      onChanged: (value) {
        debugPrint(value);
        ref
            .read(libraryItemsProvider(seriesId: seriesId).notifier)
            .update(
              state.copyWith(
                sort: value,
                desc: state.sort == value ? !state.desc : state.desc,
              ),
            );
      },
    );
  }
}

class LibraryItemsMore extends HookConsumerWidget {
  const LibraryItemsMore({this.seriesId, super.key});
  final String? seriesId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(libraryItemsProvider(seriesId: seriesId));
    String selected = state.sort;
    return DropdownSearch<String>(
      selectedItem: selected,
      mode: Mode.custom,
      items: (filter, loadProps) => state.moreList,
      clickProps: ClickProps(borderRadius: BorderRadius.circular(20)),
      dropdownBuilder: (ctx, selectedItem) {
        return Container(
          padding: EdgeInsets.all(AppElementSizes.paddingRegular),
          child: Icon(Icons.more_vert),
        );
      },
      popupProps: PopupProps.menu(
        menuProps: MenuProps(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppElementSizes.borderRadiusRegular),
          ),
          popUpAnimationStyle: AnimationStyle(duration: Duration.zero),
        ),
        constraints: BoxConstraints(
          minWidth: 180,
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        itemBuilder: (context, item, isDisabled, isSelected) => ListTile(
          title: Text(state.moreDisplay(item)),
          trailing: 'collapseSeries' == item
              ? state.collapseSeries
                    ? const Icon(Icons.check)
                    : null
              : null,
        ),
        fit: FlexFit.loose,
      ),
      onChanged: (value) {
        debugPrint(value);
        switch (value) {
          case 'collapseSeries':
            ref
                .read(libraryItemsProvider(seriesId: seriesId).notifier)
                .update(state.copyWith(collapseSeries: !state.collapseSeries));
            break;
          default:
            break;
        }
      },
    );
  }
}

/// 系列页面
class SeriesPage extends HookConsumerWidget {
  final Series? series;
  const SeriesPage(this.series, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (series == null) {
      return SizedBox.shrink();
    }
    final scrollController = useScrollController();

    final pageData = ref.watch(libraryItemsProvider(seriesId: series!.id));
    final items = pageData.items;

    return Scaffold(
      appBar: AppBar(title: Text(series?.name ?? '')),
      body: EasyRefresh(
        header: Components.easyRefreshHeader(context),
        footer: Components.easyRefreshFooter(context),
        onRefresh: () => ref
            .read(libraryItemsProvider(seriesId: series!.id).notifier)
            .refresh(),
        onLoad: () => ref
            .read(libraryItemsProvider(seriesId: series!.id).notifier)
            .loadMore(),
        child: _EasyRefreshLayoutBuilder(
          items,
          scrollController: scrollController,
        ),
      ),
    );
  }
}

class _EasyRefreshLayoutBuilder extends HookWidget {
  final List<LibraryItem> items;
  final ScrollController scrollController;

  const _EasyRefreshLayoutBuilder(this.items, {required this.scrollController});
  @override
  Widget build(BuildContext context) {
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
          itemCount: items.length,
          controller: scrollController,
          itemBuilder: (context, index) {
            return LibraryPageItem(item: items[index].asMinified, width: width);
          },
        );
      },
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
