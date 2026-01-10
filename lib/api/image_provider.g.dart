// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CoverImage)
final coverImageProvider = CoverImageFamily._();

final class CoverImageProvider
    extends $StreamNotifierProvider<CoverImage, Uint8List> {
  CoverImageProvider._({
    required CoverImageFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'coverImageProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$coverImageHash();

  @override
  String toString() {
    return r'coverImageProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CoverImage create() => CoverImage();

  @override
  bool operator ==(Object other) {
    return other is CoverImageProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$coverImageHash() => r'89cc4783cbc76bb41beae34384d92fb277135c75';

final class CoverImageFamily extends $Family
    with
        $ClassFamilyOverride<
          CoverImage,
          AsyncValue<Uint8List>,
          Uint8List,
          Stream<Uint8List>,
          String
        > {
  CoverImageFamily._()
    : super(
        retry: null,
        name: r'coverImageProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CoverImageProvider call(String itemId) =>
      CoverImageProvider._(argument: itemId, from: this);

  @override
  String toString() => r'coverImageProvider';
}

abstract class _$CoverImage extends $StreamNotifier<Uint8List> {
  late final _$args = ref.$arg as String;
  String get itemId => _$args;

  Stream<Uint8List> build(String itemId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Uint8List>, Uint8List>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Uint8List>, Uint8List>,
              AsyncValue<Uint8List>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
