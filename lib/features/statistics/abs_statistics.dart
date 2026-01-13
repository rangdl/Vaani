import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LibraryStatisticsPage extends HookConsumerWidget {
  const LibraryStatisticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('统计'),
      ),
      // body: Text('统计'),
    );
  }
}
