class HeroTagPrefixes {
  static const String heroTagPrefix = 'hero_tag_';

  /// The hero tag for the book cover
  static const String bookCover = 'book_cover_';
  static String bookCoverWith(String? id) {
    return bookCover + (id ?? '');
  }

  static const String bookCoverSkeleton = 'book_cover_skeleton_';
  static const String authorAvatar = 'author_avatar_';
  static const String authorAvatarSkeleton = 'author_avatar_skeleton_';
  static const String authorName = 'author_name_';
  static const String bookTitle = 'book_title_';
  static const String narratorName = 'narrator_name_';
  static const String libraryItemPlayButton = 'library_item_play_button_';

  /// 播放控制器 (Desktop)
  static const String controlsCenter = 'player_controls_desktop_center';
  static const String controlsRight = 'player_controls_desktop_right';
}
