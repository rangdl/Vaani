// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$audioHandlerInitHash() => r'c54f17757807f8bc14daff5095c34eb88ff2037b';

/// See also [audioHandlerInit].
@ProviderFor(audioHandlerInit)
final audioHandlerInitProvider = FutureProvider<AbsAudioHandler>.internal(
  audioHandlerInit,
  name: r'audioHandlerInitProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$audioHandlerInitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AudioHandlerInitRef = FutureProviderRef<AbsAudioHandler>;
String _$playerHash() => r'9599b094cdd9eca614c27ec5bdf2d5259d20ac5f';

/// See also [Player].
@ProviderFor(Player)
final playerProvider = NotifierProvider<Player, AbsAudioHandler>.internal(
  Player.new,
  name: r'playerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$playerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Player = Notifier<AbsAudioHandler>;
String _$sessionHash() => r'ce9405cc0b8247014924a005fa60fbc3bf92d5c6';

/// See also [Session].
@ProviderFor(Session)
final sessionProvider =
    NotifierProvider<Session, core.PlaybackSessionExpanded?>.internal(
  Session.new,
  name: r'sessionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Session = Notifier<core.PlaybackSessionExpanded?>;
String _$currentChapterHash() => r'0be02fbc4f65b30da4ce18964ee457a18c4d1073';

/// See also [CurrentChapter].
@ProviderFor(CurrentChapter)
final currentChapterProvider =
    NotifierProvider<CurrentChapter, core.BookChapter?>.internal(
  CurrentChapter.new,
  name: r'currentChapterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentChapterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentChapter = Notifier<core.BookChapter?>;
String _$playbackReporterHash() => r'b9a2197a12e83f9760bd61ae2a1ad8dff82042e9';

/// See also [PlaybackReporter].
@ProviderFor(PlaybackReporter)
final playbackReporterProvider =
    AsyncNotifierProvider<PlaybackReporter, core.PlaybackReporter?>.internal(
  PlaybackReporter.new,
  name: r'playbackReporterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$playbackReporterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlaybackReporter = AsyncNotifier<core.PlaybackReporter?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
