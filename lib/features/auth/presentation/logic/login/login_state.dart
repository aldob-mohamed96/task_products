part of 'login_cubit.dart';

class LoginState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final EmailInput emailInput;
  final PasswordInput passwordInput;
  final bool showPassword;
  final String token;

  LoginState({
    this.flowStateApp = FlowStateApp.draft,
    this.failure = const Failure(),
    this.emailInput = const EmailInput.pure(),
    this.passwordInput = const PasswordInput.pure(),
    this.showPassword = true,
    this.token = "",
  });

  bool get formIsValid =>
      passwordInput.isValid &&
      emailInput.isValid &&
      flowStateApp != FlowStateApp.loading &&
      !passwordInput.isPure &&
      !emailInput.isPure;

  copyWith({
    FlowStateApp? flowStateApp,
    Failure? failure,
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    bool? showPassword,
    String? token,
  }) {
    return LoginState(
      flowStateApp: flowStateApp ?? this.flowStateApp,
      failure: failure ?? this.failure,
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      showPassword: showPassword ?? this.showPassword,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [
    flowStateApp,
    passwordInput,
    emailInput,
    showPassword,
    failure,
    token,
  ];
}
