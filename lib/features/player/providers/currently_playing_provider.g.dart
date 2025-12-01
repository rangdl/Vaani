// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currently_playing_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentChaptersHash() => r'a25733d8085a2ce7dbc16fa2bf14f00ab8e2a623';

/// See also [currentChapters].
@ProviderFor(currentChapters)
final currentChaptersProvider =
    AutoDisposeProvider<List<core.BookChapter>>.internal(
  currentChapters,
  name: r'currentChaptersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentChaptersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentChaptersRef = AutoDisposeProviderRef<List<core.BookChapter>>;
String _$currentBookHash() => r'8dd534821b2b02a0259c6e6bde58012b880225c5';

/// See also [CurrentBook].
@ProviderFor(CurrentBook)
final currentBookProvider =
    AutoDisposeNotifierProvider<CurrentBook, core.BookExpanded?>.internal(
  CurrentBook.new,
  name: r'currentBookProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentBookHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentBook = AutoDisposeNotifier<core.BookExpanded?>;
String _$currentChapterHash() => r'f5f6d9e49cb7e455d032f7370f364d9ce30b8eb1';

/// See also [CurrentChapter].
@ProviderFor(CurrentChapter)
final currentChapterProvider =
    AutoDisposeNotifierProvider<CurrentChapter, core.BookChapter?>.internal(
  CurrentChapter.new,
  name: r'currentChapterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentChapterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentChapter = AutoDisposeNotifier<core.BookChapter?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
