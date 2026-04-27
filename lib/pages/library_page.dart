import 'dart:math';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart' show CupertinoSliverRefreshControl;
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
import 'package:vaani/l10n/generated/l10n.dart';
import 'package:vaani/router/models/library_item_extras.dart';
import 'package:vaani/router/router.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';
import 'package:vaani/shared/icons/abs_icons.dart';
import 'package:vaani/shared/utils/side_sheet.dart';
import 'package:vaani/shared/widgets/images.dart';

/// 媒体库页面
class LibraryPage extends HookConsumerWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLibrary = ref.watch(currentLibraryProvider).value;

    // Determine the icon to use, with a fallback
    final IconData libraryIconData =
        AbsIcons.getIconByName(currentLibrary?.icon) ?? Icons.library_books;

    // Determine the title text
    final String appBarTitle = currentLibrary?.name ?? S.of(context).library;

    // final pageData = ref.watch(libraryItemsProvider());
    // final items = pageData.items;

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
      // body: EasyRefresh(
      //   header: Components.easyRefreshHeader(context),
      //   footer: Components.easyRefreshFooter(context),
      //   onRefresh: () => ref.read(libraryItemsProvider().notifier).refresh(),
      //   onLoad: () => ref.read(libraryItemsProvider().notifier).loadMore(),
      //   child: _EasyRefreshLayoutBuilder(
      //     items,
      //     scrollController: scrollController,
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.all(AppElementSizes.paddingRegular),
        child: _EasyRefreshLayoutBuilder(
          // items,
          scrollController: scrollController,
        ),
      ),
    );
  }
}

class LibraryPageItem extends HookConsumerWidget {
  const LibraryPageItem(this.item, {super.key});
  final LibraryItemMinified item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = item.collapsedSeries != null
        ? item.collapsedSeries!.name
        : item.media.metadata.title ?? '';
    final subTitle = item.collapsedSeries != null
        ? '${item.collapsedSeries!.mapOrNull(null, numBooks: (v) => v.numBooks)}图书'
        : item.media.metadata.asBookMetadataMinified.authorName ?? '';
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final bodySmall = Theme.of(context).textTheme.bodySmall;
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
      borderRadius: BorderRadius.circular(AppElementSizes.borderRadiusSmall),
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: constraints.maxWidth,
              child: AbsBookCover(id: item.id),
            ),
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

    return Scaffold(
      appBar: AppBar(title: Text(series?.name ?? '')),
      // body: EasyRefresh(
      //   header: Components.easyRefreshHeader(context),
      //   footer: Components.easyRefreshFooter(context),
      //   onRefresh: () => ref
      //       .read(libraryItemsProvider(seriesId: series!.id).notifier)
      //       .refresh(),
      //   onLoad: () => ref
      //       .read(libraryItemsProvider(seriesId: series!.id).notifier)
      //       .loadMore(),
      //   child: _EasyRefreshLayoutBuilder(
      //     seriesId: series!.id,
      //     scrollController: scrollController,
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.all(AppElementSizes.paddingRegular),
        child: _EasyRefreshLayoutBuilder(
          seriesId: series!.id,
          scrollController: scrollController,
        ),
      ),
    );
  }
}

class _EasyRefreshLayoutBuilder extends HookConsumerWidget {
  // final List<LibraryItem> items;
  final String? seriesId;
  final ScrollController scrollController;

  const _EasyRefreshLayoutBuilder({
    this.seriesId,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, ref) {
    final isLoading = ref.watch(
      libraryItemsProvider().select((v) => v.isLoading),
    );
    final hasMore = ref.watch(
      libraryItemsProvider(seriesId: seriesId).select((v) => v.hasMore),
    );
    final items = ref.watch(
      libraryItemsProvider(seriesId: seriesId).select((v) => v.items),
    );
    loadMore(ScrollNotification notification) {
      if (notification is ScrollEndNotification) {
        final scrollMetrics = notification.metrics;
        final double contentHeight = scrollMetrics.maxScrollExtent;
        final double viewportHeight = scrollMetrics.viewportDimension;
        final double currentScroll = scrollMetrics.pixels;
        // 条件1：内容未填满屏幕
        if (contentHeight <= viewportHeight) {
          ref.read(libraryItemsProvider().notifier).loadMore();
        }
        // 条件2：滚动到底部附近
        else if (currentScroll >= contentHeight - viewportHeight - 100) {
          ref.read(libraryItemsProvider().notifier).loadMore();
        }
      }
      return false;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final height = getDefaultHeight(context);
        final width = height * 0.75;
        return NotificationListener(
          onNotification: loadMore,
          child: CustomScrollView(
            // CupertinoSliverRefreshControl 默认需要 BouncingScrollPhysics 才能工作。
            // 在 Android 上需要手动配置
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              // iOS 风格的下拉刷新，直接作为第一个 sliver
              CupertinoSliverRefreshControl(
                onRefresh: ref.read(libraryItemsProvider().notifier).refresh,
              ),
              SliverAlignedGrid.count(
                crossAxisCount: constraints.maxWidth ~/ width,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                // padding: EdgeInsets.all(AppElementSizes.paddingRegular),
                itemCount: items.length,
                // controller: scrollController,
                itemBuilder: (context, index) {
                  return LibraryPageItem(items[index].asMinified);
                },
              ),
              if (isLoading)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              if (!hasMore && seriesId == null)
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Center(child: Text(S.of(context).erNoMoreText)),
                  ),
                ),
            ],
          ),
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
