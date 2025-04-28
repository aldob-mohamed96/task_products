import 'package:dartz/dartz.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/core/service/base_usecase.dart';
import 'package:task_products/features/auth/domain/entity/user.dart';
import 'package:task_products/features/auth/domain/repository/auth_repository.dart';
import 'package:task_products/features/cart/data/response/cart_response.dart';
import 'package:task_products/features/cart/domain/repositories/cart_repository.dart';

final class GetAuthenticationUsecase
    implements BaseUseCase<Unit, AuthenticationData> {
  final AuthRepository _repository;

  GetAuthenticationUsecase({required AuthRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, AuthenticationData>> call(Unit input) async {
    return await _repository.getAuthentication();
  }
}
