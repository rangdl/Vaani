// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BookSettings)
final bookSettingsProvider = BookSettingsFamily._();

final class BookSettingsProvider
    extends $NotifierProvider<BookSettings, model.BookSettings> {
  BookSettingsProvider._({
    required BookSettingsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookSettingsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookSettingsHash();

  @override
  String toString() {
    return r'bookSettingsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BookSettings create() => BookSettings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(model.BookSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<model.BookSettings>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BookSettingsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookSettingsHash() => r'ef4316367513b1b2b3971e53609e8f0f29de8667';

final class BookSettingsFamily extends $Family
    with
        $ClassFamilyOverride<
          BookSettings,
          model.BookSettings,
          model.BookSettings,
          model.BookSettings,
          String
        > {
  BookSettingsFamily._()
    : super(
        retry: null,
        name: r'bookSettingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookSettingsProvider call(String bookId) =>
      BookSettingsProvider._(argument: bookId, from: this);

  @override
  String toString() => r'bookSettingsProvider';
}

abstract class _$BookSettings extends $Notifier<model.BookSettings> {
  late final _$args = ref.$arg as String;
  String get bookId => _$args;

  model.BookSettings build(String bookId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<model.BookSettings, model.BookSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<model.BookSettings, model.BookSettings>,
              model.BookSettings,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(BookProgressSettings)
final bookProgressSettingsProvider = BookProgressSettingsFamily._();

final class BookProgressSettingsProvider
    extends $NotifierProvider<BookProgressSettings, model.BookProgress> {
  BookProgressSettingsProvider._({
    required BookProgressSettingsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookProgressSettingsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookProgressSettingsHash();

  @override
  String toString() {
    return r'bookProgressSettingsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BookProgressSettings create() => BookProgressSettings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(model.BookProgress value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<model.BookProgress>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BookProgressSettingsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookProgressSettingsHash() =>
    r'be890f6b4f90565620a48c347cb86266fc232374';

final class BookProgressSettingsFamily extends $Family
    with
        $ClassFamilyOverride<
          BookProgressSettings,
          model.BookProgress,
          model.BookProgress,
          model.BookProgress,
          String
        > {
  BookProgressSettingsFamily._()
    : super(
        retry: null,
        name: r'bookProgressSettingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookProgressSettingsProvider call(String bookId) =>
      BookProgressSettingsProvider._(argument: bookId, from: this);

  @override
  String toString() => r'bookProgressSettingsProvider';
}

abstract class _$BookProgressSettings extends $Notifier<model.BookProgress> {
  late final _$args = ref.$arg as String;
  String get bookId => _$args;

  model.BookProgress build(String bookId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<model.BookProgress, model.BookProgress>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<model.BookProgress, model.BookProgress>,
              model.BookProgress,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
