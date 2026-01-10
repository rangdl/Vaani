// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_users_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// provides with a set of authenticated users

@ProviderFor(AuthenticatedUsers)
final authenticatedUsersProvider = AuthenticatedUsersProvider._();

/// provides with a set of authenticated users
final class AuthenticatedUsersProvider
    extends
        $NotifierProvider<AuthenticatedUsers, Set<model.AuthenticatedUser>> {
  /// provides with a set of authenticated users
  AuthenticatedUsersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authenticatedUsersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authenticatedUsersHash();

  @$internal
  @override
  AuthenticatedUsers create() => AuthenticatedUsers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<model.AuthenticatedUser> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<model.AuthenticatedUser>>(value),
    );
  }
}

String _$authenticatedUsersHash() =>
    r'c5e82cc70ffc31a0d315e3db9e07a141c583471e';

/// provides with a set of authenticated users

abstract class _$AuthenticatedUsers
    extends $Notifier<Set<model.AuthenticatedUser>> {
  Set<model.AuthenticatedUser> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<Set<model.AuthenticatedUser>, Set<model.AuthenticatedUser>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Set<model.AuthenticatedUser>,
                Set<model.AuthenticatedUser>
              >,
              Set<model.AuthenticatedUser>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
