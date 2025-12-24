class CacheKey {
  static String personalized(String id) {
    return 'personalizedView:$id';
  }

  static String libraryItem(String id) {
    return 'library_item_$id';
  }

  static String libraryItems(String id) {
    return 'library_items_$id';
  }

  // 基础box的key 存储上一次播放的书籍id
  static String activeLibraryItemId = 'activeLibraryItemId';
}
