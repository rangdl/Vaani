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

@ProviderFor(currentTheme)
final currentThemeProvider = CurrentThemeFamily._();

final class CurrentThemeProvider
    extends
        $FunctionalProvider<
          (ThemeData, ThemeData),
          (ThemeData, ThemeData),
          (ThemeData, ThemeData)
        >
    with $Provider<(ThemeData, ThemeData)> {
  CurrentThemeProvider._({
    required CurrentThemeFamily super.from,
    required ({bool highContrast, String? id}) super.argument,
  }) : super(
         retry: null,
         name: r'currentThemeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$currentThemeHash();

  @override
  String toString() {
    return r'currentThemeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<(ThemeData, ThemeData)> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  (ThemeData, ThemeData) create(Ref ref) {
    final argument = this.argument as ({bool highContrast, String? id});
    return currentTheme(
      ref,
      highContrast: argument.highContrast,
      id: argument.id,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue((ThemeData, ThemeData) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<(ThemeData, ThemeData)>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentThemeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$currentThemeHash() => r'5fa3f9a214904a216f3a75d3dde0436b33b95264';

final class CurrentThemeFamily extends $Family
    with
        $FunctionalFamilyOverride<
          (ThemeData, ThemeData),
          ({bool highContrast, String? id})
        > {
  CurrentThemeFamily._()
    : super(
        retry: null,
        name: r'currentThemeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CurrentThemeProvider call({bool highContrast = false, String? id}) =>
      CurrentThemeProvider._(
        argument: (highContrast: highContrast, id: id),
        from: this,
      );

  @override
  String toString() => r'currentThemeProvider';
}
