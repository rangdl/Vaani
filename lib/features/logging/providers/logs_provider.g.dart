// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Logs)
final logsProvider = LogsProvider._();

final class LogsProvider extends $AsyncNotifierProvider<Logs, List<LogRecord>> {
  LogsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logsHash();

  @$internal
  @override
  Logs create() => Logs();
}

String _$logsHash() => r'aa9d3d56586cba6ddf69615320ea605d071ea5e2';

abstract class _$Logs extends $AsyncNotifier<List<LogRecord>> {
  FutureOr<List<LogRecord>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<LogRecord>>, List<LogRecord>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<LogRecord>>, List<LogRecord>>,
              AsyncValue<List<LogRecord>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
