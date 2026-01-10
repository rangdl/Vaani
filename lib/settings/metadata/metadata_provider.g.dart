// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deviceName)
final deviceNameProvider = DeviceNameProvider._();

final class DeviceNameProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  DeviceNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceNameProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceNameHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return deviceName(ref);
  }
}

String _$deviceNameHash() => r'9e38adda74e70a91851a682f05228bd759356dcc';

@ProviderFor(deviceModel)
final deviceModelProvider = DeviceModelProvider._();

final class DeviceModelProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  DeviceModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceModelHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return deviceModel(ref);
  }
}

String _$deviceModelHash() => r'922b13d9e35b5b5c5b8e96f2f2c2ae594f4f41f2';

@ProviderFor(deviceSdkVersion)
final deviceSdkVersionProvider = DeviceSdkVersionProvider._();

final class DeviceSdkVersionProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  DeviceSdkVersionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceSdkVersionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceSdkVersionHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return deviceSdkVersion(ref);
  }
}

String _$deviceSdkVersionHash() => r'33178d80590808d1f4cca2be8a3b52c6f6724cac';

@ProviderFor(deviceManufacturer)
final deviceManufacturerProvider = DeviceManufacturerProvider._();

final class DeviceManufacturerProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  DeviceManufacturerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceManufacturerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceManufacturerHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return deviceManufacturer(ref);
  }
}

String _$deviceManufacturerHash() =>
    r'39250767deb8635fa7c7e18bae23576b9b863e04';
