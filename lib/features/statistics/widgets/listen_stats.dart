import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shelfsdk/audiobookshelf_api.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/shared/utils/helper.dart';

class ListenStats extends StatelessWidget {
  final GetUserStatsResponse ownStats;
  const ListenStats({super.key, required this.ownStats});

  @override
  Widget build(BuildContext context) {
    final int consecutiveDays = _calculateConsecutiveDays(ownStats.days);

    final DateTime today = DateTime.now();
    List<DateTime> last7DaysFormatted = _getLast7DaysFormatted(today);
    num totalTimeLast7Days = 0;
    for (var day in last7DaysFormatted) {
      totalTimeLast7Days += ownStats.days.getByDate(day)?.inSeconds ?? 0;
    }

    final List<Widget> items = [
      _buildInfoRow(
        Icons.timer_sharp,
        Helper.formatTimeToReadable(ownStats.totalTime.inSeconds, short: true),
        S.of(context).totalTimeListened,
        context,
      ),
      _buildInfoRow(
        Icons.today,
        Helper.formatTimeToReadable(
          ownStats.today.inSeconds,
          short: true,
          precise: true,
        ),
        S.of(context).today,
        context,
      ),
      _buildInfoRow(
        Icons.date_range_outlined,
        ownStats.days.length.toString(),
        S.of(context).daysListened,
        context,
      ),
      _buildInfoRow(
        Icons.stacked_line_chart,
        consecutiveDays.toString(),
        S.of(context).consecutiveDays,
        context,
      ),
      _buildInfoRow(
        HeroIcons.globe_alt,
        Helper.formatTimeToReadable(
          (ownStats.totalTime.inSeconds /
              (ownStats.days.isEmpty ? 1 : ownStats.days.length)),
          precise: true,
          short: true,
        ),
        S.of(context).averagePerDay,
        context,
      ),
      _buildInfoRow(
        Bootstrap.number_7_square,
        Helper.formatTimeToReadable(
          totalTimeLast7Days / 7,
          precise: true,
          short: true,
        ),
        S.of(context).averageLastWeek,
        context,
        padding: 8,
      ),
    ];

    final crossCount = min(
      (1000 / 250).floor(),
      max(1, (MediaQuery.of(context).size.width / 250)).floor(),
    );

    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: MasonryGridView.count(
        crossAxisCount: crossCount,
        itemCount: items.length,
        itemBuilder: (context, index) => items[index],
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
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
      children: [
        Padding(
          padding: EdgeInsets.all(padding ?? 0),
          child: Icon(icon, size: 48 - ((padding ?? 0) * 2)),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
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
        ),
      ],
    );
  }

  int _calculateConsecutiveDays(Map<DateTime, Duration> map) {
    // Get the current date
    DateTime today = DateTime.now();
    DateTime yesterday = today.subtract(const Duration(days: 1));

    // Check if the user listened yesterday
    if (map.getByDate(yesterday) == null) {
      return 0;
    }

    // Check if the user listened today
    if (map.getByDate(today) == null) {
      return 0;
    }

    // Calculate the consecutive days
    int consecutiveDays = 2;
    DateTime previousDay = yesterday;
    while (true) {
      DateTime day = previousDay.subtract(const Duration(days: 1));
      if (map.getByDate(day) == null) {
        break;
      }
      consecutiveDays++;
      previousDay = day;
    }

    return consecutiveDays;
  }

  List<DateTime> _getLast7DaysFormatted(DateTime today) {
    List<DateTime> last7DaysFormatted = List.generate(7, (index) {
      return today.subtract(Duration(days: 6 - index));
    });
    return last7DaysFormatted;
  }
}

extension DateTimeDurationMapExtensions on Map<DateTime, Duration> {
  // 按日期查找
  Duration? getByDate(DateTime dateTime) {
    final targetDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    final matchingKey = keys.firstWhere((key) {
      final keyDate = DateTime(key.year, key.month, key.day);
      return keyDate == targetDate;
    }, orElse: () => DateTime(0));

    return matchingKey != DateTime(0) ? this[matchingKey] : null;
  }
}
