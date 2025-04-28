import 'package:dartz/dartz.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/core/service/base_usecase.dart';
import 'package:task_products/features/auth/domain/entity/user.dart';
import 'package:task_products/features/auth/domain/repository/auth_repository.dart';

final class ChangeAuthenticationUsecase
    implements BaseUseCase<AuthenticationData, AppAuthenticationLevel> {
  final AuthRepository _repository;

  ChangeAuthenticationUsecase({required AuthRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, AppAuthenticationLevel>> call(
    AuthenticationData input,
  ) async {
    return await _repository.changeAuthentication(input);
  }
}
