// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_from_cover_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(themeFromCover)
final themeFromCoverProvider = ThemeFromCoverFamily._();

final class ThemeFromCoverProvider
    extends
        $FunctionalProvider<
          AsyncValue<FutureOr<ColorScheme?>>,
          FutureOr<ColorScheme?>,
          FutureOr<FutureOr<ColorScheme?>>
        >
    with
        $FutureModifier<FutureOr<ColorScheme?>>,
        $FutureProvider<FutureOr<ColorScheme?>> {
  ThemeFromCoverProvider._({
    required ThemeFromCoverFamily super.from,
    required (ImageProvider<Object>, {Brightness brightness, bool highContrast})
    super.argument,
  }) : super(
         retry: null,
         name: r'themeFromCoverProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$themeFromCoverHash();

  @override
  String toString() {
    return r'themeFromCoverProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<FutureOr<ColorScheme?>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FutureOr<ColorScheme?>> create(Ref ref) {
    final argument =
        this.argument
            as (
              ImageProvider<Object>, {
              Brightness brightness,
              bool highContrast,
            });
    return themeFromCover(
      ref,
      argument.$1,
      brightness: argument.brightness,
      highContrast: argument.highContrast,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ThemeFromCoverProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$themeFromCoverHash() => r'afdeddc4bfe2fe46a4185143d3a88a23565e33f4';

final class ThemeFromCoverFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<FutureOr<ColorScheme?>>,
          (ImageProvider<Object>, {Brightness brightness, bool highContrast})
        > {
  ThemeFromCoverFamily._()
    : super(
        retry: null,
        name: r'themeFromCoverProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ThemeFromCoverProvider call(
    ImageProvider<Object> img, {
    Brightness brightness = Brightness.dark,
    bool highContrast = false,
  }) => ThemeFromCoverProvider._(
    argument: (img, brightness: brightness, highContrast: highContrast),
    from: this,
  );

  @override
  String toString() => r'themeFromCoverProvider';
}

@ProviderFor(themeOfLibraryItem)
final themeOfLibraryItemProvider = ThemeOfLibraryItemFamily._();

final class ThemeOfLibraryItemProvider
    extends
        $FunctionalProvider<
          AsyncValue<ColorScheme?>,
          ColorScheme?,
          FutureOr<ColorScheme?>
        >
    with $FutureModifier<ColorScheme?>, $FutureProvider<ColorScheme?> {
  ThemeOfLibraryItemProvider._({
    required ThemeOfLibraryItemFamily super.from,
    required (String?, {Brightness brightness, bool highContrast})
    super.argument,
  }) : super(
         retry: null,
         name: r'themeOfLibraryItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$themeOfLibraryItemHash();

  @override
  String toString() {
    return r'themeOfLibraryItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<ColorScheme?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ColorScheme?> create(Ref ref) {
    final argument =
        this.argument as (String?, {Brightness brightness, bool highContrast});
    return themeOfLibraryItem(
      ref,
      argument.$1,
      brightness: argument.brightness,
      highContrast: argument.highContrast,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ThemeOfLibraryItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$themeOfLibraryItemHash() =>
    r'1de3194255204e98e33548682b3f1db2db9c1997';

final class ThemeOfLibraryItemFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<ColorScheme?>,
          (String?, {Brightness brightness, bool highContrast})
        > {
  ThemeOfLibraryItemFamily._()
    : super(
        retry: null,
        name: r'themeOfLibraryItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ThemeOfLibraryItemProvider call(
    String? itemId, {
    Brightness brightness = Brightness.dark,
    bool highContrast = false,
  }) => ThemeOfLibraryItemProvider._(
    argument: (itemId, brightness: brightness, highContrast: highContrast),
    from: this,
  );

  @override
  String toString() => r'themeOfLibraryItemProvider';
}
