// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_status.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlayerList)
final playerListProvider = PlayerListProvider._();

final class PlayerListProvider
    extends $NotifierProvider<PlayerList, List<AudioSource>> {
  PlayerListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerListHash();

  @$internal
  @override
  PlayerList create() => PlayerList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<AudioSource> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<AudioSource>>(value),
    );
  }
}

String _$playerListHash() => r'73efb89a7982cd80259e904d75462feb6c8d3457';

abstract class _$PlayerList extends $Notifier<List<AudioSource>> {
  List<AudioSource> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<AudioSource>, List<AudioSource>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<AudioSource>, List<AudioSource>>,
              List<AudioSource>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
