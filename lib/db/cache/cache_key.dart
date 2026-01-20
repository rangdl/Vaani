class CacheKey {
  CacheKey._();

  static String personalized(String id) {
    return 'personalizedView:$id';
  }

  static String libraryItem(String id) {
    return 'libraryItem:$id';
  }

  static String libraryItems(String id) {
    return 'libraryItems:$id';
  }

  static String cover(Uri baseUrl, String id) {
    return '$baseUrl/api/items/$id/cover?width=1200';
  }

  // 基础box的key 存储上一次播放的书籍id
  static String activeLibraryItemId = 'activeLibraryItemId';
}
