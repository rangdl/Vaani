// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// copied from [DynamicColorBuilder]

@ProviderFor(systemTheme)
final systemThemeProvider = SystemThemeFamily._();

/// copied from [DynamicColorBuilder]

final class SystemThemeProvider
    extends
        $FunctionalProvider<
          AsyncValue<(ColorScheme, ColorScheme)?>,
          (ColorScheme, ColorScheme)?,
          FutureOr<(ColorScheme, ColorScheme)?>
        >
    with
        $FutureModifier<(ColorScheme, ColorScheme)?>,
        $FutureProvider<(ColorScheme, ColorScheme)?> {
  /// copied from [DynamicColorBuilder]
  SystemThemeProvider._({
    required SystemThemeFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'systemThemeProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$systemThemeHash();

  @override
  String toString() {
    return r'systemThemeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<(ColorScheme, ColorScheme)?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<(ColorScheme, ColorScheme)?> create(Ref ref) {
    final argument = this.argument as bool;
    return systemTheme(ref, highContrast: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SystemThemeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$systemThemeHash() => r'c78d3d94683624a80b296594268c5fd4295e77a3';

/// copied from [DynamicColorBuilder]

final class SystemThemeFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<(ColorScheme, ColorScheme)?>, bool> {
  SystemThemeFamily._()
    : super(
        retry: null,
        name: r'systemThemeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// copied from [DynamicColorBuilder]

  SystemThemeProvider call({bool highContrast = false}) =>
      SystemThemeProvider._(argument: highContrast, from: this);

  @override
  String toString() => r'systemThemeProvider';
}
