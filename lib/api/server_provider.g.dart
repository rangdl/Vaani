// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// provides with a set of servers added by the user

@ProviderFor(AudiobookShelfServer)
final audiobookShelfServerProvider = AudiobookShelfServerProvider._();

/// provides with a set of servers added by the user
final class AudiobookShelfServerProvider
    extends
        $NotifierProvider<
          AudiobookShelfServer,
          Set<model.AudiobookShelfServer>
        > {
  /// provides with a set of servers added by the user
  AudiobookShelfServerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audiobookShelfServerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audiobookShelfServerHash();

  @$internal
  @override
  AudiobookShelfServer create() => AudiobookShelfServer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<model.AudiobookShelfServer> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<model.AudiobookShelfServer>>(
        value,
      ),
    );
  }
}

String _$audiobookShelfServerHash() =>
    r'144817dcb3704b80c5b60763167fcf932f00c29c';

/// provides with a set of servers added by the user

abstract class _$AudiobookShelfServer
    extends $Notifier<Set<model.AudiobookShelfServer>> {
  Set<model.AudiobookShelfServer> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              Set<model.AudiobookShelfServer>,
              Set<model.AudiobookShelfServer>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Set<model.AudiobookShelfServer>,
                Set<model.AudiobookShelfServer>
              >,
              Set<model.AudiobookShelfServer>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
