import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/features/auth/domain/entity/user.dart';
import 'package:task_products/features/auth/domain/usecase/change_authentication_usecase.dart';
import 'package:task_products/features/auth/domain/usecase/get_authentication_usecase.dart';
import 'package:task_products/features/auth/domain/usecase/logout_usecase.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final GetAuthenticationUsecase _getAuthenticationUsecase;
  final ChangeAuthenticationUsecase _changeAuthenticationUsecase;
  final LogOutUseCase _logOutUseCase;

  AuthenticationCubit({
    required GetAuthenticationUsecase getAuthenticationUsecase,
    required ChangeAuthenticationUsecase changeAuthenticationUsecase,
    required LogOutUseCase logOutUseCase,
  }) : _getAuthenticationUsecase = getAuthenticationUsecase,
       _changeAuthenticationUsecase = changeAuthenticationUsecase,
       _logOutUseCase = logOutUseCase,
       super(const AuthenticationState());

  Future<void> getAuthentication() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final result = await _getAuthenticationUsecase(unit);
    result.fold(
      (failure) => emit(
        state.copyWith(flowStateApp: FlowStateApp.error, failure: failure),
      ),
      (authenticationLevel) => emit(
        state.copyWith(
          flowStateApp: FlowStateApp.success,

          appAuthenticationLevel: authenticationLevel.appAuthenticationLevel,
        ),
      ),
    );
  }

  void logOut() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.logoutLoading));
    final result = await _logOutUseCase(unit);
    result.fold(
      (failure) => emit(
        state.copyWith(
          flowStateApp: FlowStateApp.logoutError,
          failure: failure,
        ),
      ),
      (successOperation) => emit(
        state.copyWith(
          flowStateApp: FlowStateApp.success,
          appAuthenticationLevel: AppAuthenticationLevel.unAuthenticated,
        ),
      ),
    );
  }

  Future<void> changeAuthentication(
    AppAuthenticationLevel authenticationLevel, {
    String token = "",
  }) async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final result = await _changeAuthenticationUsecase(
      AuthenticationData(
        appAuthenticationLevel: authenticationLevel,
        token: token,
      ),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(flowStateApp: FlowStateApp.error, failure: failure),
      ),
      (successOperation) => emit(
        state.copyWith(
          flowStateApp: FlowStateApp.success,
          appAuthenticationLevel: authenticationLevel,
        ),
      ),
    );
  }
}
