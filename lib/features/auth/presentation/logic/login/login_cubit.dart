import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/input_validation_form/input_form.dart';
import 'package:task_products/features/auth/data/request/auth_request.dart';
import 'package:task_products/features/auth/domain/usecase/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginCubit({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(LoginState());

  void login() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));

    final result = await _loginUseCase(
      LoginRequest(
        email: state.emailInput.value.trim(),
        password: state.passwordInput.value.trim(),
      ),
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(flowStateApp: FlowStateApp.error, failure: failure),
        );
      },
      (token) {
        emit(
          state.copyWith(
            flowStateApp: FlowStateApp.successLoggedIn,
            token: token,
          ),
        );
      },
    );
  }

  void changeHidePassword() {
    emit(
      state.copyWith(
        showPassword: !state.showPassword,
        flowStateApp: FlowStateApp.normal,
      ),
    );
  }

  void changePassword(String value) {
    final input = PasswordInput.dirty(value);

    emit(
      state.copyWith(passwordInput: input, flowStateApp: FlowStateApp.normal),
    );
  }

  void changeEmail(String value) {
    final input = EmailInput.dirty(value);

    emit(state.copyWith(emailInput: input, flowStateApp: FlowStateApp.normal));
  }
}
