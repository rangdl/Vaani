import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/api/library_provider.dart';
import 'package:vaani/api/stats_provider.dart';
import 'package:vaani/features/statistics/widgets/listen_chart.dart';
import 'package:vaani/features/statistics/widgets/listen_stats.dart';
import 'package:vaani/l10n/generated/l10n.dart';
import 'package:vaani/shared/extensions/inverse_lerp.dart';
import 'package:vaani/shared/utils/helper.dart';

class LibraryStatisticsPage extends HookConsumerWidget {
  const LibraryStatisticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);
    return Scaffold(
      appBar: AppBar(
        title: Text('统计'),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(icon: Icon(Icons.account_circle), text: S.of(context).ownStats),
            Tab(icon: Icon(Icons.book), text: S.of(context).libraryStats),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [const OwnStats(), const LibraryStats()],
        // children: [Text('data'), Text('data2')],
      ),
    );
  }
}

class OwnStats extends HookConsumerWidget {
  const OwnStats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ownStats = ref.watch(ownStatsProvider);
    if (!ownStats.hasValue) {
      return const Center(child: CircularProgressIndicator());
    }
    final is7DaysSelected = useState(true);

    // Get the current date
    DateTime today = DateTime.now();

    // Get data based on the selected timeframe
    final List<int> lastDays = is7DaysSelected.value
        ? _getLastDays(ownStats.value!.days, today, 7)
        : _getLastDays(ownStats.value!.days, today, 30);
    final List<String> lastDaysLabels = is7DaysSelected.value
        ? _getLastDaysLabels(today, 7, context)
        : _getLastDaysLabels(today, 30, context);

    return SingleChildScrollView(
      child: Column(
        children: [
          ListenStats(ownStats: ownStats.value!),
          const SizedBox(height: 16),
          Wrap(
            spacing: 5.0,
            children: [
              ChoiceChip(
                // label: Text(S.of(context).last7Days),
                label: Text('近7日'),
                selected: is7DaysSelected.value,
                showCheckmark: true,
                checkmarkColor: Theme.of(context).colorScheme.onSurface,
                onSelected: (bool selected) {
                  is7DaysSelected.value = true;
                },
              ),
              ChoiceChip(
                // label: Text(S.of(context).last30Days),
                label: Text('近30日'),
                selected: !is7DaysSelected.value,
                showCheckmark: true,
                checkmarkColor: Theme.of(context).colorScheme.onSurface,
                onSelected: (bool selected) {
                  is7DaysSelected.value = false;
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 200, // Height for the chart
                  child: ListenChart(
                    lastDays: lastDays,
                    lastDaysLabels: lastDaysLabels,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 获取最近N天的值集合
  List<int> _getLastDays(
    Map<DateTime, Duration?> data,
    DateTime today,
    int days,
  ) {
    if (days <= 0) return [];

    final startDate = today.subtract(Duration(days: days));

    return data.entries
        .where((entry) {
          final entryDate = DateTime(
            entry.key.year,
            entry.key.month,
            entry.key.day,
          );
          final normalizedStart = DateTime(
            startDate.year,
            startDate.month,
            startDate.day,
          );
          final normalizedEnd = DateTime(today.year, today.month, today.day);

          return entryDate.compareTo(normalizedStart) >= 0 &&
              entryDate.compareTo(normalizedEnd) <= 0;
        })
        .map((entry) => entry.value?.inSeconds ?? 0)
        .toList();
  }

  List<String> _getLastDaysLabels(
    DateTime today,
    int days,
    BuildContext context,
  ) {
    List<String> lastDaysLabels = List.generate(days, (index) {
      DateTime day = today.subtract(Duration(days: days - 1 - index));
      return DateFormat.E(
        Localizations.localeOf(context).toString(),
      ).format(day);
    });
    return lastDaysLabels;
  }
}

class LibraryStats extends ConsumerWidget {
  const LibraryStats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final libraryStats = ref.watch(libraryStatsProvider).value;
    final currentLibrary = ref.watch(currentLibraryProvider).value;

    if (libraryStats == null || currentLibrary == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // constraints: const BoxConstraints(maxWidth: maxWidth),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentLibrary.name,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 16),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.spaceBetween,
                  spacing: 16.0,
                  runSpacing: 16.0,
                  children: [
                    _buildInfoRow(
                      Icons.book,
                      libraryStats.totalItems.toString(),
                      S.of(context).totalItems,
                      context,
                      padding: 8,
                    ),
                    _buildInfoRow(
                      Icons.timer,
                      Helper.formatTimeToReadable(
                        libraryStats.totalDuration.inSeconds,
                        short: true,
                      ),
                      S.of(context).totalDuration,
                      context,
                      padding: 8,
                    ),
                    _buildInfoRow(
                      Icons.sd_card,
                      libraryStats.totalSize.formatBytes(),
                      S.of(context).totalSize,
                      context,
                      padding: 8,
                    ),
                    _buildInfoRow(
                      Icons.audiotrack_outlined,
                      libraryStats.numAudioTracks.toString(),
                      S.of(context).totalAudioTracks,
                      context,
                      padding: 8,
                    ),
                    _buildInfoRow(
                      Icons.person,
                      libraryStats.totalAuthors.toString(),
                      S.of(context).totalAuthors,
                      context,
                      padding: 8,
                    ),
                    _buildInfoRow(
                      Icons.category,
                      libraryStats.totalGenres.toString(),
                      S.of(context).totalGenres,
                      context,
                      padding: 8,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  S.of(context).longestItems,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    runSpacing: 4.0,
                    children: _buildLongestItems(context, libraryStats),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).largestItems,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    runSpacing: 4.0,
                    children: _buildLargestItems(context, libraryStats),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).topAuthors,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    runSpacing: 4.0,
                    children: _buildAuthorItems(context, libraryStats),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).topGenres,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    runSpacing: 4.0,
                    children: _buildGenresItems(context, libraryStats),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLongestItems(
    BuildContext context,
    GetLibrarysStatsResponse libraryStats,
  ) {
    List<Widget> items = [];

    for (LibraryItemStats item in libraryStats.longestItems) {
      items.add(
        _buildBarChart(
          context,
          item.title,
          Helper.formatTimeToReadable(item.duration.inSeconds, short: true),
          item.duration.inSeconds /
              libraryStats.longestItems[0].duration.inSeconds,
        ),
      );
    }

    return items;
  }

  List<Widget> _buildLargestItems(
    BuildContext context,
    GetLibrarysStatsResponse libraryStats,
  ) {
    List<Widget> items = [];

    for (LibraryItemSizeStats item in libraryStats.largestItems) {
      items.add(
        _buildBarChart(
          context,
          item.title,
          item.size.formatBytes(),
          item.size / libraryStats.largestItems[0].size,
        ),
      );
    }

    return items;
  }

  List<Widget> _buildAuthorItems(
    BuildContext context,
    GetLibrarysStatsResponse libraryStats,
  ) {
    List<Widget> items = [];

    for (AuthorStats item in libraryStats.authorsWithCount) {
      items.add(
        _buildBarChart(
          context,
          item.name,
          item.count.toString(),
          item.count / libraryStats.authorsWithCount[0].count,
          endWidth: 50,
          percentage: 0.2,
        ),
      );
    }

    return items;
  }

  List<Widget> _buildGenresItems(
    BuildContext context,
    GetLibrarysStatsResponse libraryStats,
  ) {
    List<Widget> items = [];

    for (GenreStats item in libraryStats.genresWithCount) {
      items.add(
        _buildBarChart(
          context,
          item.genre,
          item.count.toString(),
          item.count / libraryStats.genresWithCount[0].count,
          endWidth: 50,
          percentage: 0.2,
        ),
      );
    }

    return items;
  }

  Widget _buildBarChart(
    BuildContext context,
    String title,
    String subtitle,
    double value, {
    double endWidth = 75,
    double percentage = 0.35,
  }) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        return Row(
          children: [
            Container(
              width: constraints.maxWidth * percentage,
              constraints: const BoxConstraints(maxWidth: 200),
              child: Tooltip(
                message: title,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: LinearProgressIndicator(
                  value: value,
                  backgroundColor: Theme.of(context).colorScheme.onSurface,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: endWidth,
              child: Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String mainText,
    String subText,
    BuildContext context, {
    double? padding = 2,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(padding ?? 0),
          child: Icon(icon, size: 48 - ((padding ?? 0) * 2)),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainText,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 1,
            ),
            Text(
              subText,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelLarge,
              maxLines: 1,
            ),
          ],
        ),
      ],
    );
  }
}
