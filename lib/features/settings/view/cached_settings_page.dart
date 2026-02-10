import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/api/image_provider.dart';
import 'package:vaani/db/cache/cache.dart';
import 'package:vaani/features/settings/view/simple_settings_page.dart';
import 'package:vaani/l10n/generated/l10n.dart';
import 'package:vaani/shared/extensions/cache_manager.dart';
import 'package:vaani/shared/utils/custom_dialog.dart';

class CachedManagerPage extends HookConsumerWidget {
  const CachedManagerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imgSize = ref.watch(cacheSizeImageProvider);
    final apiSize = ref.watch(cacheSizeApiProvider);
    final defaultSize = ref.watch(cacheSizeDefaultProvider);
    return SimpleSettingsPage(
      title: Text('缓存管理'),
      sections: [
        SettingsSection(
          margin: const EdgeInsetsDirectional.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          tiles: [
            // preferred settings for every book
            SettingsTile(
              title: Text('图片缓存'),
              leading: const Icon(Icons.image),
              description: Text('图片缓存'),
              trailing: Text('${imgSize.value}'),
              onPressed: (context) async {
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
            SettingsTile(
              title: Text('数据缓存'),
              leading: const Icon(Icons.storage),
              description: Text('数据缓存'),
              trailing: Text('${apiSize.value}'),
              onPressed: (context) async {
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
            SettingsTile(
              title: Text('其他缓存'),
              leading: const Icon(Icons.info),
              description: Text('其他缓存'),
              trailing: Text('${defaultSize.value}'),
              onPressed: (context) async {
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
        ),
      ],
    );
  }
}
