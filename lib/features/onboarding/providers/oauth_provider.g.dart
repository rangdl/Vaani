// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OauthFlows)
final oauthFlowsProvider = OauthFlowsProvider._();

final class OauthFlowsProvider
    extends $NotifierProvider<OauthFlows, Map<State, Flow>> {
  OauthFlowsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'oauthFlowsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$oauthFlowsHash();

  @$internal
  @override
  OauthFlows create() => OauthFlows();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<State, Flow> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<State, Flow>>(value),
    );
  }
}

String _$oauthFlowsHash() => r'4e278baa0bf26f2a10694ca2caadb68dd5b6156f';

abstract class _$OauthFlows extends $Notifier<Map<State, Flow>> {
  Map<State, Flow> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Map<State, Flow>, Map<State, Flow>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<State, Flow>, Map<State, Flow>>,
              Map<State, Flow>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// the code returned by the server in exchange for the verifier

@ProviderFor(loginInExchangeForCode)
final loginInExchangeForCodeProvider = LoginInExchangeForCodeFamily._();

/// the code returned by the server in exchange for the verifier

final class LoginInExchangeForCodeProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  /// the code returned by the server in exchange for the verifier
  LoginInExchangeForCodeProvider._({
    required LoginInExchangeForCodeFamily super.from,
    required ({
      State oauthState,
      Code code,
      ErrorResponseHandler? responseHandler,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'loginInExchangeForCodeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loginInExchangeForCodeHash();

  @override
  String toString() {
    return r'loginInExchangeForCodeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument =
        this.argument
            as ({
              State oauthState,
              Code code,
              ErrorResponseHandler? responseHandler,
            });
    return loginInExchangeForCode(
      ref,
      oauthState: argument.oauthState,
      code: argument.code,
      responseHandler: argument.responseHandler,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LoginInExchangeForCodeProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loginInExchangeForCodeHash() =>
    r'bfc3945529048a0f536052fd5579b76457560fcd';

/// the code returned by the server in exchange for the verifier

final class LoginInExchangeForCodeFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<String?>,
          ({State oauthState, Code code, ErrorResponseHandler? responseHandler})
        > {
  LoginInExchangeForCodeFamily._()
    : super(
        retry: null,
        name: r'loginInExchangeForCodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// the code returned by the server in exchange for the verifier

  LoginInExchangeForCodeProvider call({
    required State oauthState,
    required Code code,
    ErrorResponseHandler? responseHandler,
  }) => LoginInExchangeForCodeProvider._(
    argument: (
      oauthState: oauthState,
      code: code,
      responseHandler: responseHandler,
    ),
    from: this,
  );

  @override
  String toString() => r'loginInExchangeForCodeProvider';
}
