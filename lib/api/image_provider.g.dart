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

String _$cacheSizeImageHash() => r'bd89478466ecb78c02c3528893cac17bb646c28a';

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
