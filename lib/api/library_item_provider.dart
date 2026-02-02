import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/experimental/persist.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart' as shelfsdk;
import 'package:vaani/api/api_provider.dart';
import 'package:vaani/db/cache/cache_key.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/shared/extensions/model_conversions.dart';

part 'library_item_provider.g.dart';

final _logger = Logger('LibraryItemProvider');

/// provides the library item for the given id
@Riverpod(keepAlive: true)
class LibraryItem extends _$LibraryItem {
  @override
  Stream<shelfsdk.LibraryItemExpanded> build(String id) async* {
    final api = ref.watch(authenticatedApiProvider);
    _logger.fine('LibraryItemProvider fetching library item: $id');
    await persist(
      ref.watch(storageProvider.future),
      key: CacheKey.libraryItem(id),
      encode: jsonEncode,
      decode: (encoded) =>
          shelfsdk.LibraryItemExpanded.fromJson(jsonDecode(encoded)),
    ).future;
    // look for the item in the cache
    // final key = CacheKey.libraryItem(id);
    // final cachedItem = await apiResponseCacheManager.get(
    //   key,
    //   shelfsdk.LibraryItemExpanded.fromJson,
    // );
    // if (cachedItem != null) {
    //   _logger.fine('LibraryItemProvider reading from cache for $id');
    //   yield cachedItem;
    // } else {
    //   _logger.fine('LibraryItemProvider cache miss for $id');
    // }
    try {
      final item = await api.items.get(
        libraryItemId: id,
        parameters: const shelfsdk.GetItemReqParams(
          expanded: true,
          include: [
            shelfsdk.GetItemIncludeOption.progress,
            shelfsdk.GetItemIncludeOption.rssFeed,
            shelfsdk.GetItemIncludeOption.authors,
            shelfsdk.GetItemIncludeOption.downloads,
          ],
        ),
      );
      // final result = await apiResponseCacheManager.put(key, item?.asExpanded);
      if (item != null) {
        yield item.asExpanded;
      }
    } catch (e) {
      debugPrintStack(stackTrace: StackTrace.current, label: e.toString());
      appLogger.severe('未查询到数据');
      appLogger.severe(e.toString());
    }
  }
}
