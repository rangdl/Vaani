// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audiobook_player.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$audioHandlerInitHash() => r'6e4662a45c1c6e84aa16436f71ffcfecc3d4bdab';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
