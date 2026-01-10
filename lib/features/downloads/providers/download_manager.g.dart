// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SimpleDownloadManager)
final simpleDownloadManagerProvider = SimpleDownloadManagerProvider._();

final class SimpleDownloadManagerProvider
    extends
        $NotifierProvider<
          SimpleDownloadManager,
          core.AudiobookDownloadManager
        > {
  SimpleDownloadManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'simpleDownloadManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$simpleDownloadManagerHash();

  @$internal
  @override
  SimpleDownloadManager create() => SimpleDownloadManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(core.AudiobookDownloadManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<core.AudiobookDownloadManager>(
        value,
      ),
    );
  }
}

String _$simpleDownloadManagerHash() =>
    r'8ab13f06ec5f2f73b73064bd285813dc890b7f36';

abstract class _$SimpleDownloadManager
    extends $Notifier<core.AudiobookDownloadManager> {
  core.AudiobookDownloadManager build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              core.AudiobookDownloadManager,
              core.AudiobookDownloadManager
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                core.AudiobookDownloadManager,
                core.AudiobookDownloadManager
              >,
              core.AudiobookDownloadManager,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DownloadManager)
final downloadManagerProvider = DownloadManagerProvider._();

final class DownloadManagerProvider
    extends $NotifierProvider<DownloadManager, core.AudiobookDownloadManager> {
  DownloadManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadManagerHash();

  @$internal
  @override
  DownloadManager create() => DownloadManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(core.AudiobookDownloadManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<core.AudiobookDownloadManager>(
        value,
      ),
    );
  }
}

String _$downloadManagerHash() => r'852012e32e613f86445afc7f7e4e85bec808e982';

abstract class _$DownloadManager
    extends $Notifier<core.AudiobookDownloadManager> {
  core.AudiobookDownloadManager build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              core.AudiobookDownloadManager,
              core.AudiobookDownloadManager
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                core.AudiobookDownloadManager,
                core.AudiobookDownloadManager
              >,
              core.AudiobookDownloadManager,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IsItemDownloading)
final isItemDownloadingProvider = IsItemDownloadingFamily._();

final class IsItemDownloadingProvider
    extends $NotifierProvider<IsItemDownloading, bool> {
  IsItemDownloadingProvider._({
    required IsItemDownloadingFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isItemDownloadingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isItemDownloadingHash();

  @override
  String toString() {
    return r'isItemDownloadingProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  IsItemDownloading create() => IsItemDownloading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsItemDownloadingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isItemDownloadingHash() => r'ea43c06393beec828134e08d5f896ddbcfbac8f0';

final class IsItemDownloadingFamily extends $Family
    with $ClassFamilyOverride<IsItemDownloading, bool, bool, bool, String> {
  IsItemDownloadingFamily._()
    : super(
        retry: null,
        name: r'isItemDownloadingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsItemDownloadingProvider call(String id) =>
      IsItemDownloadingProvider._(argument: id, from: this);

  @override
  String toString() => r'isItemDownloadingProvider';
}

abstract class _$IsItemDownloading extends $Notifier<bool> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  bool build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(ItemDownloadProgress)
final itemDownloadProgressProvider = ItemDownloadProgressFamily._();

final class ItemDownloadProgressProvider
    extends $AsyncNotifierProvider<ItemDownloadProgress, double?> {
  ItemDownloadProgressProvider._({
    required ItemDownloadProgressFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'itemDownloadProgressProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$itemDownloadProgressHash();

  @override
  String toString() {
    return r'itemDownloadProgressProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ItemDownloadProgress create() => ItemDownloadProgress();

  @override
  bool operator ==(Object other) {
    return other is ItemDownloadProgressProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemDownloadProgressHash() =>
    r'95f6ec0945f73d9156bf89bdb1865f3b2c9ffcaa';

final class ItemDownloadProgressFamily extends $Family
    with
        $ClassFamilyOverride<
          ItemDownloadProgress,
          AsyncValue<double?>,
          double?,
          FutureOr<double?>,
          String
        > {
  ItemDownloadProgressFamily._()
    : super(
        retry: null,
        name: r'itemDownloadProgressProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ItemDownloadProgressProvider call(String id) =>
      ItemDownloadProgressProvider._(argument: id, from: this);

  @override
  String toString() => r'itemDownloadProgressProvider';
}

abstract class _$ItemDownloadProgress extends $AsyncNotifier<double?> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<double?> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<double?>, double?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<double?>, double?>,
              AsyncValue<double?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(downloadHistory)
final downloadHistoryProvider = DownloadHistoryFamily._();

final class DownloadHistoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TaskRecord>>,
          List<TaskRecord>,
          FutureOr<List<TaskRecord>>
        >
    with $FutureModifier<List<TaskRecord>>, $FutureProvider<List<TaskRecord>> {
  DownloadHistoryProvider._({
    required DownloadHistoryFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'downloadHistoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$downloadHistoryHash();

  @override
  String toString() {
    return r'downloadHistoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<TaskRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TaskRecord>> create(Ref ref) {
    final argument = this.argument as String?;
    return downloadHistory(ref, group: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadHistoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$downloadHistoryHash() => r'4d8b84e30f7ff5ae69d23c8e03ff24af1234a1ad';

final class DownloadHistoryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<TaskRecord>>, String?> {
  DownloadHistoryFamily._()
    : super(
        retry: null,
        name: r'downloadHistoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DownloadHistoryProvider call({String? group}) =>
      DownloadHistoryProvider._(argument: group, from: this);

  @override
  String toString() => r'downloadHistoryProvider';
}

@ProviderFor(IsItemDownloaded)
final isItemDownloadedProvider = IsItemDownloadedFamily._();

final class IsItemDownloadedProvider
    extends $AsyncNotifierProvider<IsItemDownloaded, bool> {
  IsItemDownloadedProvider._({
    required IsItemDownloadedFamily super.from,
    required LibraryItemExpanded super.argument,
  }) : super(
         retry: null,
         name: r'isItemDownloadedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isItemDownloadedHash();

  @override
  String toString() {
    return r'isItemDownloadedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  IsItemDownloaded create() => IsItemDownloaded();

  @override
  bool operator ==(Object other) {
    return other is IsItemDownloadedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isItemDownloadedHash() => r'9bb7ba28bdb73e1ba706e849fedc9c7bd67f4b67';

final class IsItemDownloadedFamily extends $Family
    with
        $ClassFamilyOverride<
          IsItemDownloaded,
          AsyncValue<bool>,
          bool,
          FutureOr<bool>,
          LibraryItemExpanded
        > {
  IsItemDownloadedFamily._()
    : super(
        retry: null,
        name: r'isItemDownloadedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsItemDownloadedProvider call(LibraryItemExpanded item) =>
      IsItemDownloadedProvider._(argument: item, from: this);

  @override
  String toString() => r'isItemDownloadedProvider';
}

abstract class _$IsItemDownloaded extends $AsyncNotifier<bool> {
  late final _$args = ref.$arg as LibraryItemExpanded;
  LibraryItemExpanded get item => _$args;

  FutureOr<bool> build(LibraryItemExpanded item);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
