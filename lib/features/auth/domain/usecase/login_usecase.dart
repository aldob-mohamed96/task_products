import 'package:dartz/dartz.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/service/base_usecase.dart';
import 'package:task_products/features/auth/data/request/auth_request.dart';
import 'package:task_products/features/auth/domain/repository/auth_repository.dart';

final class LoginUseCase implements BaseUseCase<LoginRequest, String> {
  final AuthRepository _repository;

  LoginUseCase({required AuthRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, String>> call(LoginRequest input) async {
    return await _repository.login(input);
  }
}
