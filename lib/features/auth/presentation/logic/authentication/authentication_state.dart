part of 'authentication_cubit.dart';

class AuthenticationState extends Equatable {
  final AppAuthenticationLevel appAuthenticationLevel;
  final Failure failure;
  final FlowStateApp flowStateApp;

  const AuthenticationState({
    this.appAuthenticationLevel = AppAuthenticationLevel.unAuthenticated,
    this.failure = const Failure(),
    this.flowStateApp = FlowStateApp.draft,
  });

  AuthenticationState copyWith({
    AppAuthenticationLevel? appAuthenticationLevel,
    Failure? failure,
    FlowStateApp? flowStateApp,
  }) => AuthenticationState(
    appAuthenticationLevel:
        appAuthenticationLevel ?? this.appAuthenticationLevel,
    failure: failure ?? this.failure,
    flowStateApp: flowStateApp ?? this.flowStateApp,
  );

  @override
  List<Object> get props => [appAuthenticationLevel, failure, flowStateApp];
}
