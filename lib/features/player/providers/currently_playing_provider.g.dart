// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currently_playing_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentlyPlayingBook)
final currentlyPlayingBookProvider = CurrentlyPlayingBookProvider._();

final class CurrentlyPlayingBookProvider
    extends $FunctionalProvider<BookExpanded?, BookExpanded?, BookExpanded?>
    with $Provider<BookExpanded?> {
  CurrentlyPlayingBookProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentlyPlayingBookProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentlyPlayingBookHash();

  @$internal
  @override
  $ProviderElement<BookExpanded?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BookExpanded? create(Ref ref) {
    return currentlyPlayingBook(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookExpanded? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookExpanded?>(value),
    );
  }
}

String _$currentlyPlayingBookHash() =>
    r'e4258694c8f0d1e89651b330fae0f672ca13a484';

/// provided the current chapter of the book being played

@ProviderFor(currentPlayingChapter)
final currentPlayingChapterProvider = CurrentPlayingChapterProvider._();

/// provided the current chapter of the book being played

final class CurrentPlayingChapterProvider
    extends $FunctionalProvider<BookChapter?, BookChapter?, BookChapter?>
    with $Provider<BookChapter?> {
  /// provided the current chapter of the book being played
  CurrentPlayingChapterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentPlayingChapterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentPlayingChapterHash();

  @$internal
  @override
  $ProviderElement<BookChapter?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BookChapter? create(Ref ref) {
    return currentPlayingChapter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookChapter? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookChapter?>(value),
    );
  }
}

String _$currentPlayingChapterHash() =>
    r'73db8b8a9058573bb0c68ec5d5f8aba9306f3d24';

/// provides the book metadata of the currently playing book

@ProviderFor(currentBookMetadata)
final currentBookMetadataProvider = CurrentBookMetadataProvider._();

/// provides the book metadata of the currently playing book

final class CurrentBookMetadataProvider
    extends
        $FunctionalProvider<
          BookMetadataExpanded?,
          BookMetadataExpanded?,
          BookMetadataExpanded?
        >
    with $Provider<BookMetadataExpanded?> {
  /// provides the book metadata of the currently playing book
  CurrentBookMetadataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentBookMetadataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentBookMetadataHash();

  @$internal
  @override
  $ProviderElement<BookMetadataExpanded?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BookMetadataExpanded? create(Ref ref) {
    return currentBookMetadata(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookMetadataExpanded? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookMetadataExpanded?>(value),
    );
  }
}

String _$currentBookMetadataHash() =>
    r'f537ef4ef19280bc952de658ecf6520c535ae344';
