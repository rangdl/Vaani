import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/features/player/view/player_expanded.dart';
import 'package:vaani/features/player/view/player_expanded_desktop.dart';
import 'package:vaani/shared/widgets/not_implemented.dart';

class PlayerPage extends HookConsumerWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBook = ref.watch(currentBookProvider);
    if (currentBook == null) {
      return SizedBox.shrink();
    }
    final size = MediaQuery.of(context).size;
    // 竖屏
    final isVertical = size.height > size.width;
    return Scaffold(
      appBar: AppBar(
        // 以下两项确保在滚动后背景色不变
        // elevation: 0 是保持 AppBar 不变的关键
        elevation: 0,
        // 设置 forceMaterialTransparency 防止滚动时的透明度变化
        forceMaterialTransparency: true,
        title: Text(currentBook.metadata.title ?? ''),
        leading: IconButton(
          iconSize: 30,
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cast),
            onPressed: () {
              showNotImplementedToast(context);
            },
          ),
        ],
      ),
      body: !isVertical ? PlayerExpanded() : PlayerExpandedDesktop(),
    );
  }
}
