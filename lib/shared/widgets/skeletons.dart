import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// 加载框

// 页面加载
class PageSkeleton extends StatelessWidget {
  const PageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

// a skeleton for the book cover
class BookCoverSkeleton extends StatelessWidget {
  const BookCoverSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: SizedBox(
        width: 150,
        child: Shimmer.fromColors(
          baseColor:
              Theme.of(context).colorScheme.surface.withValues(alpha: 0.3),
          highlightColor:
              Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
          child: Container(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
