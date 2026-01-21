// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cacheSizeImage)
final cacheSizeImageProvider = CacheSizeImageProvider._();

final class CacheSizeImageProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  CacheSizeImageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cacheSizeImageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cacheSizeImageHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return cacheSizeImage(ref);
  }
}

String _$cacheSizeImageHash() => r'5d0fad0d139de51f87c4e172a9bb0664620cf7a2';

@ProviderFor(cacheSizeApi)
final cacheSizeApiProvider = CacheSizeApiProvider._();

final class CacheSizeApiProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  CacheSizeApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cacheSizeApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cacheSizeApiHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return cacheSizeApi(ref);
  }
}

String _$cacheSizeApiHash() => r'19b0a88d7c10e40d9835dcb8d4d5e28bb7f64298';

@ProviderFor(cacheSizeDefault)
final cacheSizeDefaultProvider = CacheSizeDefaultProvider._();

final class CacheSizeDefaultProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  CacheSizeDefaultProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cacheSizeDefaultProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cacheSizeDefaultHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return cacheSizeDefault(ref);
  }
}

String _$cacheSizeDefaultHash() => r'5f4530a1d4e0072f45071e7354b1c3057652afb9';

@ProviderFor(cacheImage)
final cacheImageProvider = CacheImageFamily._();

final class CacheImageProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List?>,
          Uint8List?,
          FutureOr<Uint8List?>
        >
    with $FutureModifier<Uint8List?>, $FutureProvider<Uint8List?> {
  CacheImageProvider._({
    required CacheImageFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'cacheImageProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cacheImageHash();

  @override
  String toString() {
    return r'cacheImageProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Uint8List?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Uint8List?> create(Ref ref) {
    final argument = this.argument as String;
    return cacheImage(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CacheImageProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cacheImageHash() => r'58545e6b44ca7ee5207fecbdcaf2fb437b28fb01';

final class CacheImageFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Uint8List?>, String> {
  CacheImageFamily._()
    : super(
        retry: null,
        name: r'cacheImageProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CacheImageProvider call(String id) =>
      CacheImageProvider._(argument: id, from: this);

  @override
  String toString() => r'cacheImageProvider';
}
