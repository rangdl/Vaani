// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// get the api instance for the given base url

@ProviderFor(audiobookshelfApi)
final audiobookshelfApiProvider = AudiobookshelfApiFamily._();

/// get the api instance for the given base url

final class AudiobookshelfApiProvider
    extends
        $FunctionalProvider<
          AudiobookshelfApi,
          AudiobookshelfApi,
          AudiobookshelfApi
        >
    with $Provider<AudiobookshelfApi> {
  /// get the api instance for the given base url
  AudiobookshelfApiProvider._({
    required AudiobookshelfApiFamily super.from,
    required Uri? super.argument,
  }) : super(
         retry: null,
         name: r'audiobookshelfApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$audiobookshelfApiHash();

  @override
  String toString() {
    return r'audiobookshelfApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AudiobookshelfApi> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AudiobookshelfApi create(Ref ref) {
    final argument = this.argument as Uri?;
    return audiobookshelfApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AudiobookshelfApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AudiobookshelfApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AudiobookshelfApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$audiobookshelfApiHash() => r'd7fbddf9ce2b463468c8d4db5a1bc4a53b7b7278';

/// get the api instance for the given base url

final class AudiobookshelfApiFamily extends $Family
    with $FunctionalFamilyOverride<AudiobookshelfApi, Uri?> {
  AudiobookshelfApiFamily._()
    : super(
        retry: null,
        name: r'audiobookshelfApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// get the api instance for the given base url

  AudiobookshelfApiProvider call(Uri? baseUrl) =>
      AudiobookshelfApiProvider._(argument: baseUrl, from: this);

  @override
  String toString() => r'audiobookshelfApiProvider';
}

/// get the api instance for the authenticated user
///
/// if the user is not authenticated throw an error

@ProviderFor(authenticatedApi)
final authenticatedApiProvider = AuthenticatedApiProvider._();

/// get the api instance for the authenticated user
///
/// if the user is not authenticated throw an error

final class AuthenticatedApiProvider
    extends
        $FunctionalProvider<
          AudiobookshelfApi,
          AudiobookshelfApi,
          AudiobookshelfApi
        >
    with $Provider<AudiobookshelfApi> {
  /// get the api instance for the authenticated user
  ///
  /// if the user is not authenticated throw an error
  AuthenticatedApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authenticatedApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authenticatedApiHash();

  @$internal
  @override
  $ProviderElement<AudiobookshelfApi> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AudiobookshelfApi create(Ref ref) {
    return authenticatedApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AudiobookshelfApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AudiobookshelfApi>(value),
    );
  }
}

String _$authenticatedApiHash() => r'13bba42fa712f173d3b72761ae9d544854df26d0';

/// ping the server to check if it is reachable

@ProviderFor(isServerAlive)
final isServerAliveProvider = IsServerAliveFamily._();

/// ping the server to check if it is reachable

final class IsServerAliveProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// ping the server to check if it is reachable
  IsServerAliveProvider._({
    required IsServerAliveFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isServerAliveProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isServerAliveHash();

  @override
  String toString() {
    return r'isServerAliveProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as String;
    return isServerAlive(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is IsServerAliveProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isServerAliveHash() => r'3afd608ced03a23fa7300d4a59368d170406ecc8';

/// ping the server to check if it is reachable

final class IsServerAliveFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, String> {
  IsServerAliveFamily._()
    : super(
        retry: null,
        name: r'isServerAliveProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ping the server to check if it is reachable

  IsServerAliveProvider call(String address) =>
      IsServerAliveProvider._(argument: address, from: this);

  @override
  String toString() => r'isServerAliveProvider';
}

/// fetch status of server

@ProviderFor(serverStatus)
final serverStatusProvider = ServerStatusFamily._();

/// fetch status of server

final class ServerStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<ServerStatusResponse?>,
          ServerStatusResponse?,
          FutureOr<ServerStatusResponse?>
        >
    with
        $FutureModifier<ServerStatusResponse?>,
        $FutureProvider<ServerStatusResponse?> {
  /// fetch status of server
  ServerStatusProvider._({
    required ServerStatusFamily super.from,
    required (Uri, ResponseErrorHandler?) super.argument,
  }) : super(
         retry: null,
         name: r'serverStatusProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$serverStatusHash();

  @override
  String toString() {
    return r'serverStatusProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<ServerStatusResponse?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ServerStatusResponse?> create(Ref ref) {
    final argument = this.argument as (Uri, ResponseErrorHandler?);
    return serverStatus(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is ServerStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$serverStatusHash() => r'2d9c5d6f970caec555e5322d43a388ea8572619f';

/// fetch status of server

final class ServerStatusFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<ServerStatusResponse?>,
          (Uri, ResponseErrorHandler?)
        > {
  ServerStatusFamily._()
    : super(
        retry: null,
        name: r'serverStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// fetch status of server

  ServerStatusProvider call(
    Uri baseUrl, [
    ResponseErrorHandler? responseErrorHandler,
  ]) => ServerStatusProvider._(
    argument: (baseUrl, responseErrorHandler),
    from: this,
  );

  @override
  String toString() => r'serverStatusProvider';
}

/// fetch the personalized view

@ProviderFor(PersonalizedView)
final personalizedViewProvider = PersonalizedViewProvider._();

/// fetch the personalized view
final class PersonalizedViewProvider
    extends $StreamNotifierProvider<PersonalizedView, List<Shelf>> {
  /// fetch the personalized view
  PersonalizedViewProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'personalizedViewProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$personalizedViewHash();

  @$internal
  @override
  PersonalizedView create() => PersonalizedView();
}

String _$personalizedViewHash() => r'3f7c9f83215f8378e2b7b80333e0ad722f2ec279';

/// fetch the personalized view

abstract class _$PersonalizedView extends $StreamNotifier<List<Shelf>> {
  Stream<List<Shelf>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Shelf>>, List<Shelf>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Shelf>>, List<Shelf>>,
              AsyncValue<List<Shelf>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// fetch continue listening audiobooks

@ProviderFor(fetchContinueListening)
final fetchContinueListeningProvider = FetchContinueListeningProvider._();

/// fetch continue listening audiobooks

final class FetchContinueListeningProvider
    extends
        $FunctionalProvider<
          AsyncValue<GetUserSessionsResponse>,
          GetUserSessionsResponse,
          FutureOr<GetUserSessionsResponse>
        >
    with
        $FutureModifier<GetUserSessionsResponse>,
        $FutureProvider<GetUserSessionsResponse> {
  /// fetch continue listening audiobooks
  FetchContinueListeningProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchContinueListeningProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchContinueListeningHash();

  @$internal
  @override
  $FutureProviderElement<GetUserSessionsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GetUserSessionsResponse> create(Ref ref) {
    return fetchContinueListening(ref);
  }
}

String _$fetchContinueListeningHash() =>
    r'50aeb77369eda38d496b2f56f3df2aea135dab45';

@ProviderFor(me)
final meProvider = MeProvider._();

final class MeProvider
    extends $FunctionalProvider<AsyncValue<User>, User, FutureOr<User>>
    with $FutureModifier<User>, $FutureProvider<User> {
  MeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'meProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$meHash();

  @$internal
  @override
  $FutureProviderElement<User> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<User> create(Ref ref) {
    return me(ref);
  }
}

String _$meHash() => r'b3b6d6d940b465c60d0c29cd6e81ba2fcccab186';

@ProviderFor(login)
final loginProvider = LoginFamily._();

final class LoginProvider
    extends
        $FunctionalProvider<
          AsyncValue<LoginResponse?>,
          LoginResponse?,
          FutureOr<LoginResponse?>
        >
    with $FutureModifier<LoginResponse?>, $FutureProvider<LoginResponse?> {
  LoginProvider._({
    required LoginFamily super.from,
    required AuthenticatedUser? super.argument,
  }) : super(
         retry: null,
         name: r'loginProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loginHash();

  @override
  String toString() {
    return r'loginProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LoginResponse?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LoginResponse?> create(Ref ref) {
    final argument = this.argument as AuthenticatedUser?;
    return login(ref, user: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loginHash() => r'99410c2bed9c8f412c7b47c4e655db64e0054be2';

final class LoginFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<LoginResponse?>,
          AuthenticatedUser?
        > {
  LoginFamily._()
    : super(
        retry: null,
        name: r'loginProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoginProvider call({AuthenticatedUser? user}) =>
      LoginProvider._(argument: user, from: this);

  @override
  String toString() => r'loginProvider';
}
