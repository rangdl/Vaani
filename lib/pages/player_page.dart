import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/features/player/providers/currently_playing_provider.dart';
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
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(currentBook.metadata.title ?? ''),
        leading: IconButton(
          iconSize: 30,
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () => context.pop(),
        ),
        trailingActions: [
          IconButton(
            icon: const Icon(Icons.cast),
            onPressed: () {
              showNotImplementedToast(context);
            },
          ),
        ],
      ),
      body: isVertical ? PlayerExpanded() : PlayerExpandedDesktop(),
    );
  }
}
