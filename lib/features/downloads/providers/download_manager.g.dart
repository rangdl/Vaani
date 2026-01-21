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
    r'da5798e4becce751db80c41b93a48217418e4648';

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

String _$downloadManagerHash() => r'dce8e012a04d2e0668cd79f5ff57e5e1ece4255f';

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
    r'2e408f793ac5a731595b87388776f2ca87bb1b5d';

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

@ProviderFor(FileProgress)
final fileProgressProvider = FileProgressFamily._();

final class FileProgressProvider
    extends $NotifierProvider<FileProgress, (TaskStatus, double)> {
  FileProgressProvider._({
    required FileProgressFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fileProgressProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fileProgressHash();

  @override
  String toString() {
    return r'fileProgressProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FileProgress create() => FileProgress();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue((TaskStatus, double) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<(TaskStatus, double)>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FileProgressProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fileProgressHash() => r'35667f8be1b8855b29ca1922fd2420850503ee57';

final class FileProgressFamily extends $Family
    with
        $ClassFamilyOverride<
          FileProgress,
          (TaskStatus, double),
          (TaskStatus, double),
          (TaskStatus, double),
          String
        > {
  FileProgressFamily._()
    : super(
        retry: null,
        name: r'fileProgressProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FileProgressProvider call(String ino) =>
      FileProgressProvider._(argument: ino, from: this);

  @override
  String toString() => r'fileProgressProvider';
}

abstract class _$FileProgress extends $Notifier<(TaskStatus, double)> {
  late final _$args = ref.$arg as String;
  String get ino => _$args;

  (TaskStatus, double) build(String ino);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<(TaskStatus, double), (TaskStatus, double)>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<(TaskStatus, double), (TaskStatus, double)>,
              (TaskStatus, double),
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(FileState)
final fileStateProvider = FileStateFamily._();

final class FileStateProvider
    extends $NotifierProvider<FileState, (TaskStatus, double)> {
  FileStateProvider._({
    required FileStateFamily super.from,
    required (LibraryItemExpanded, AudioFile) super.argument,
  }) : super(
         retry: null,
         name: r'fileStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fileStateHash();

  @override
  String toString() {
    return r'fileStateProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  FileState create() => FileState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue((TaskStatus, double) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<(TaskStatus, double)>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FileStateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fileStateHash() => r'822fa871bf8103bdb7bc31212da83a2676b1cf17';

final class FileStateFamily extends $Family
    with
        $ClassFamilyOverride<
          FileState,
          (TaskStatus, double),
          (TaskStatus, double),
          (TaskStatus, double),
          (LibraryItemExpanded, AudioFile)
        > {
  FileStateFamily._()
    : super(
        retry: null,
        name: r'fileStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FileStateProvider call(LibraryItemExpanded item, AudioFile file) =>
      FileStateProvider._(argument: (item, file), from: this);

  @override
  String toString() => r'fileStateProvider';
}

abstract class _$FileState extends $Notifier<(TaskStatus, double)> {
  late final _$args = ref.$arg as (LibraryItemExpanded, AudioFile);
  LibraryItemExpanded get item => _$args.$1;
  AudioFile get file => _$args.$2;

  (TaskStatus, double) build(LibraryItemExpanded item, AudioFile file);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<(TaskStatus, double), (TaskStatus, double)>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<(TaskStatus, double), (TaskStatus, double)>,
              (TaskStatus, double),
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
