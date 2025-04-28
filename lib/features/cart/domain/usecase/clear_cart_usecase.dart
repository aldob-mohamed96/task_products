import 'package:dartz/dartz.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/core/service/base_usecase.dart';
import 'package:task_products/features/cart/domain/entity/cart_item.dart';
import 'package:task_products/features/cart/domain/repositories/cart_repository.dart';

final class ClearCartUseCase
    implements BaseUseCase<Unit, SuccessOperation> {
  final CartRepository _repository;

  ClearCartUseCase({required CartRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(Unit input) async {
    return await _repository.clearCart();
  }
}
