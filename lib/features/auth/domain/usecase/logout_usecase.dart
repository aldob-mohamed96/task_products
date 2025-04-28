import 'package:dartz/dartz.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/core/service/base_usecase.dart';
import 'package:task_products/features/auth/data/request/auth_request.dart';
import 'package:task_products/features/auth/domain/repository/auth_repository.dart';

final class LogOutUseCase implements BaseUseCase<Unit, SuccessOperation> {
  final AuthRepository _repository;

  LogOutUseCase({required AuthRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(Unit input) async {
    return await _repository.logout();
  }
}
