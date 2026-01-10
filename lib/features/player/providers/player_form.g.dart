// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_form.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playerExpandProgressNotifier)
final playerExpandProgressProvider = PlayerExpandProgressNotifierProvider._();

final class PlayerExpandProgressNotifierProvider
    extends
        $FunctionalProvider<
          Raw<ValueNotifier<double>>,
          Raw<ValueNotifier<double>>,
          Raw<ValueNotifier<double>>
        >
    with $Provider<Raw<ValueNotifier<double>>> {
  PlayerExpandProgressNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerExpandProgressProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerExpandProgressNotifierHash();

  @$internal
  @override
  $ProviderElement<Raw<ValueNotifier<double>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Raw<ValueNotifier<double>> create(Ref ref) {
    return playerExpandProgressNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<ValueNotifier<double>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<ValueNotifier<double>>>(value),
    );
  }
}

String _$playerExpandProgressNotifierHash() =>
    r'1ac7172d90a070f96222286edd1a176be197f378';

@ProviderFor(playerHeight)
final playerHeightProvider = PlayerHeightProvider._();

final class PlayerHeightProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  PlayerHeightProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerHeightProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerHeightHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return playerHeight(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$playerHeightHash() => r'41144a733b5ffd1c872a237ed7c9ea5f450dd0d4';

@ProviderFor(isPlayerActive)
final isPlayerActiveProvider = IsPlayerActiveProvider._();

final class IsPlayerActiveProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsPlayerActiveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isPlayerActiveProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isPlayerActiveHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isPlayerActive(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isPlayerActiveHash() => r'2c7ca125423126fb5f0ef218d37bc8fe0ca9ec98';
