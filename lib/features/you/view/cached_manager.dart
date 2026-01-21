import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/api/image_provider.dart';
import 'package:vaani/db/cache_manager.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/shared/extensions/cache_manager.dart';
import 'package:vaani/shared/utils/custom_dialog.dart';

class CachedManagerPage extends HookConsumerWidget {
  const CachedManagerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('缓存管理')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CachedManagerBody(),
        ),
      ),
    );
  }
}

class CachedManagerBody extends HookConsumerWidget {
  const CachedManagerBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imgSize = ref.watch(cacheSizeImageProvider);
    final apiSize = ref.watch(cacheSizeApiProvider);
    final defaultSize = ref.watch(cacheSizeDefaultProvider);
    return ListView(
      children: [
        ListTile(
          title: Text('图片缓存'),
          leading: Icon(Icons.image),
          trailing: Text('${imgSize.value}'),
          onTap: () async {
            DialogUtils.showConfirmDialog(
              context,
              title: '清除图片缓存',
              content: '这会清除图片缓存，后续需要重新下载。',
              confirmText: S.of(context).clean,
              onPressed: () async {
                await imageCacheManager.clean();
                return ref.refresh(cacheSizeImageProvider);
              },
            );
          },
        ),
        ListTile(
          title: Text('数据缓存'),
          leading: Icon(Icons.storage),
          trailing: Text('${apiSize.value}'),
          onTap: () async {
            DialogUtils.showConfirmDialog(
              context,
              title: '清除数据图片缓存',
              content: '这会清除SWR数据缓存，后续会重新请求数据。',
              confirmText: S.of(context).clean,
              onPressed: () async {
                await apiResponseCacheManager.clean();
                return ref.refresh(cacheSizeApiProvider);
              },
            );
          },
        ),
        ListTile(
          title: Text('其他缓存'),
          leading: Icon(Icons.info),
          trailing: Text('${defaultSize.value}'),
          onTap: () async {
            DialogUtils.showConfirmDialog(
              context,
              title: '清除其他缓存',
              content: '这会清除其他缓存，后续会重新请求数据或下载。',
              confirmText: S.of(context).clean,
              onPressed: () async {
                await defaultCacheManager.clean();
                return ref.refresh(cacheSizeDefaultProvider);
              },
            );
          },
        ),
      ],
    );
  }
}
