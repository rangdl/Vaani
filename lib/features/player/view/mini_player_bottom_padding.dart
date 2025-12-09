import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/globals.dart' show playerMinHeight;

class MiniPlayerBottomPadding extends HookConsumerWidget {
  const MiniPlayerBottomPadding({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: ref.watch(audioPlayerProvider).playing
          ? const SizedBox(height: playerMinHeight + 8)
          : const SizedBox.shrink(),
    );
  }
}
