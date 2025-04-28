import 'package:dartz/dartz.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/core/service/base_usecase.dart';
import 'package:task_products/features/cart/data/response/cart_response.dart';
import 'package:task_products/features/cart/domain/repositories/cart_repository.dart';

final class UpdateItemCartUseCase
    implements BaseUseCase<CartItem, SuccessOperation> {
  final CartRepository _repository;

  UpdateItemCartUseCase({required CartRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(CartItem input) async {
    return await _repository.updateItem(input);
  }
}
