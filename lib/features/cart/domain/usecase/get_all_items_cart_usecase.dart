
import 'package:dartz/dartz.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/service/base_usecase.dart';
import 'package:task_products/features/cart/domain/entity/cart_item.dart';
import 'package:task_products/features/cart/domain/repositories/cart_repository.dart';

final class GetAllItemsFromCartUseCase implements BaseUseCase<Unit, CartData> {
  final CartRepository _repository;

  GetAllItemsFromCartUseCase({required CartRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, CartData>> call(Unit input) async {
    return await _repository.getAllItems();
  }
}