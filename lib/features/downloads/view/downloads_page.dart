import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/api/library_item_provider.dart';
import 'package:vaani/features/downloads/providers/download_manager.dart';
import 'package:vaani/generated/l10n.dart';

class DownloadsPage extends HookConsumerWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final manager = ref.read(simpleDownloadManagerProvider);
    final downloadHistory = ref.watch(downloadHistoryProvider());

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).bookDownloads),
      ),
      body: Center(
        // history of downloads
        child: downloadHistory.when(
          data: (records) {
            // each group is one list tile, which contains the files downloaded
            final uniqueGroups = records.map((e) => e.group).toSet();
            return ListView.builder(
              itemCount: uniqueGroups.length,
              itemBuilder: (context, index) {
                final group = uniqueGroups.elementAt(index);
                final groupRecords = records.where((e) => e.group == group);
                final item = ref.watch(libraryItemProvider(group)).valueOrNull;

                return ExpansionTile(
                  title: Text(item?.media.metadata.title ?? group),
                  children: groupRecords
                      .map(
                        (e) => ListTile(
                          title: Text('${e.task.directory}/${e.task.filename}'),
                          subtitle: Text(e.task.creationTime.toString()),
                        ),
                      )
                      .toList(),
                );
              },
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) {
            return Text('Error: $error');
          },
        ),
      ),
    );
  }
}
