// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playerActive)
final playerActiveProvider = PlayerActiveProvider._();

final class PlayerActiveProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  PlayerActiveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerActiveProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerActiveHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return playerActive(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$playerActiveHash() => r'4d3e7181cf66bfdb46d5caaece56cde07f610cc4';

@ProviderFor(audioPlayer)
final audioPlayerProvider = AudioPlayerProvider._();

final class AudioPlayerProvider
    extends
        $FunctionalProvider<
          audio.AudioPlayer,
          audio.AudioPlayer,
          audio.AudioPlayer
        >
    with $Provider<audio.AudioPlayer> {
  AudioPlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioPlayerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioPlayerHash();

  @$internal
  @override
  $ProviderElement<audio.AudioPlayer> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  audio.AudioPlayer create(Ref ref) {
    return audioPlayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(audio.AudioPlayer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<audio.AudioPlayer>(value),
    );
  }
}

String _$audioPlayerHash() => r'70d93206c89b454d2a18c037b2b5b24c169bd1fc';

@ProviderFor(AbsPlayer)
final absPlayerProvider = AbsPlayerProvider._();

final class AbsPlayerProvider
    extends $NotifierProvider<AbsPlayer, AbsAudioPlayer> {
  AbsPlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'absPlayerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$absPlayerHash();

  @$internal
  @override
  AbsPlayer create() => AbsPlayer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AbsAudioPlayer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AbsAudioPlayer>(value),
    );
  }
}

String _$absPlayerHash() => r'cd3beef3f4f215d17f9187c9d3e6931cdc4ac266';

abstract class _$AbsPlayer extends $Notifier<AbsAudioPlayer> {
  AbsAudioPlayer build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AbsAudioPlayer, AbsAudioPlayer>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AbsAudioPlayer, AbsAudioPlayer>,
              AbsAudioPlayer,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(PlayerState)
final playerStateProvider = PlayerStateProvider._();

final class PlayerStateProvider
    extends $NotifierProvider<PlayerState, audio.PlayerState> {
  PlayerStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerStateHash();

  @$internal
  @override
  PlayerState create() => PlayerState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(audio.PlayerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<audio.PlayerState>(value),
    );
  }
}

String _$playerStateHash() => r'b1b205d4e0bc09812c56e71da448bebd56c634dd';

abstract class _$PlayerState extends $Notifier<audio.PlayerState> {
  audio.PlayerState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<audio.PlayerState, audio.PlayerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<audio.PlayerState, audio.PlayerState>,
              audio.PlayerState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CurrentTime)
final currentTimeProvider = CurrentTimeFamily._();

final class CurrentTimeProvider
    extends $AsyncNotifierProvider<CurrentTime, shelfsdk.MediaProgress?> {
  CurrentTimeProvider._({
    required CurrentTimeFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'currentTimeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$currentTimeHash();

  @override
  String toString() {
    return r'currentTimeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CurrentTime create() => CurrentTime();

  @override
  bool operator ==(Object other) {
    return other is CurrentTimeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$currentTimeHash() => r'e2cf66f5f04cd51f5ddafd64ace395ec3bf0ede2';

final class CurrentTimeFamily extends $Family
    with
        $ClassFamilyOverride<
          CurrentTime,
          AsyncValue<shelfsdk.MediaProgress?>,
          shelfsdk.MediaProgress?,
          FutureOr<shelfsdk.MediaProgress?>,
          String
        > {
  CurrentTimeFamily._()
    : super(
        retry: null,
        name: r'currentTimeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CurrentTimeProvider call(String libraryItemId) =>
      CurrentTimeProvider._(argument: libraryItemId, from: this);

  @override
  String toString() => r'currentTimeProvider';
}

abstract class _$CurrentTime extends $AsyncNotifier<shelfsdk.MediaProgress?> {
  late final _$args = ref.$arg as String;
  String get libraryItemId => _$args;

  FutureOr<shelfsdk.MediaProgress?> build(String libraryItemId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<shelfsdk.MediaProgress?>,
              shelfsdk.MediaProgress?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<shelfsdk.MediaProgress?>,
                shelfsdk.MediaProgress?
              >,
              AsyncValue<shelfsdk.MediaProgress?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(CurrentBook)
final currentBookProvider = CurrentBookProvider._();

final class CurrentBookProvider
    extends $NotifierProvider<CurrentBook, shelfsdk.BookExpanded?> {
  CurrentBookProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentBookProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentBookHash();

  @$internal
  @override
  CurrentBook create() => CurrentBook();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(shelfsdk.BookExpanded? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<shelfsdk.BookExpanded?>(value),
    );
  }
}

String _$currentBookHash() => r'd7980be7cc6f90dc011032ec029e3812ab7fa1ec';

abstract class _$CurrentBook extends $Notifier<shelfsdk.BookExpanded?> {
  shelfsdk.BookExpanded? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<shelfsdk.BookExpanded?, shelfsdk.BookExpanded?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<shelfsdk.BookExpanded?, shelfsdk.BookExpanded?>,
              shelfsdk.BookExpanded?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CurrentChapter)
final currentChapterProvider = CurrentChapterProvider._();

final class CurrentChapterProvider
    extends $NotifierProvider<CurrentChapter, shelfsdk.BookChapter?> {
  CurrentChapterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentChapterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentChapterHash();

  @$internal
  @override
  CurrentChapter create() => CurrentChapter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(shelfsdk.BookChapter? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<shelfsdk.BookChapter?>(value),
    );
  }
}

String _$currentChapterHash() => r'507b926008848b8db316675ea73ea413a52fa2dd';

abstract class _$CurrentChapter extends $Notifier<shelfsdk.BookChapter?> {
  shelfsdk.BookChapter? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<shelfsdk.BookChapter?, shelfsdk.BookChapter?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<shelfsdk.BookChapter?, shelfsdk.BookChapter?>,
              shelfsdk.BookChapter?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 进度条显示
// 进度条总时长

@ProviderFor(total)
final totalProvider = TotalProvider._();

/// 进度条显示
// 进度条总时长

final class TotalProvider
    extends $FunctionalProvider<Duration, Duration, Duration>
    with $Provider<Duration> {
  /// 进度条显示
  // 进度条总时长
  TotalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$totalHash();

  @$internal
  @override
  $ProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Duration create(Ref ref) {
    return total(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Duration>(value),
    );
  }
}

String _$totalHash() => r'2d01953862a875f6e66fe3af56868e819e33fcc8';

@ProviderFor(progress)
final progressProvider = ProgressProvider._();

final class ProgressProvider
    extends
        $FunctionalProvider<AsyncValue<Duration>, Duration, Stream<Duration>>
    with $FutureModifier<Duration>, $StreamProvider<Duration> {
  ProgressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'progressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$progressHash();

  @$internal
  @override
  $StreamProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Duration> create(Ref ref) {
    return progress(ref);
  }
}

String _$progressHash() => r'53d111e4ca8e734430f60bd41519e369262152bf';

@ProviderFor(progressBuffered)
final progressBufferedProvider = ProgressBufferedProvider._();

final class ProgressBufferedProvider
    extends
        $FunctionalProvider<AsyncValue<Duration>, Duration, Stream<Duration>>
    with $FutureModifier<Duration>, $StreamProvider<Duration> {
  ProgressBufferedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'progressBufferedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$progressBufferedHash();

  @$internal
  @override
  $StreamProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Duration> create(Ref ref) {
    return progressBuffered(ref);
  }
}

String _$progressBufferedHash() => r'2a42f747b855c2e2bde146ca7b4cd64672d5db9e';
