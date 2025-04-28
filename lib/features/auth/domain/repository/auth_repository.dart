import 'package:dartz/dartz.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/features/auth/data/request/auth_request.dart';
import 'package:task_products/features/auth/domain/entity/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(LoginRequest loginRequest);
  Future<Either<Failure, SuccessOperation>> logout();

  Future<Either<Failure, AuthenticationData>> getAuthentication();
  Future<Either<Failure, AppAuthenticationLevel>> changeAuthentication(
    AuthenticationData authenticationLevel,
  );
}
