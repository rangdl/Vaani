import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/db/cache/cache.dart';
import 'package:vaani/db/cache/cache_key.dart';

class AbsBookCover extends HookConsumerWidget {
  const AbsBookCover({super.key, required this.id});

  final String? id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (id == null) {
      return _buildPlaceholder(context);
    }
    final api = ref.watch(authenticatedApiProvider);
    return CachedNetworkImage(
      cacheManager: imageCacheManager,
      imageUrl: CacheKey.cover(api.baseUrl, id!),
      imageBuilder: (context, imageProvider) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
            ),
            borderRadius: BorderRadius.circular(
              AppElementSizes.borderRadiusSmall,
            ),
          ),
        ),
      ),
      // progressIndicatorBuilder: (context, url, downloadProgress) =>
      //     CircularProgressIndicator(value: downloadProgress.progress),
      placeholder: (context, url) => _buildPlaceholder(context),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  Widget _buildPlaceholder(context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Shimmer.fromColors(
      baseColor: colorScheme.surface.withValues(alpha: 0.3),
      highlightColor: colorScheme.onSurface.withValues(alpha: 0.1),
      child: Container(color: colorScheme.surface),
    );
  }
}
