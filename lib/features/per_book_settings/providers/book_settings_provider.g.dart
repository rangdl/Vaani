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

String _$bookSettingsHash() => r'b976df954edf98ec6ccb3eb41e9d07dd4a9193eb';

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
