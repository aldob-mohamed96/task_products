import 'package:dartz/dartz.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/service/base_usecase.dart';
import 'package:task_products/features/cart/data/response/cart_response.dart';
import 'package:task_products/features/cart/domain/entity/cart_item.dart';
import 'package:task_products/features/cart/domain/repositories/cart_repository.dart';

final class GetItemFromCartUseCase implements BaseUseCase<String, CartItem> {
  final CartRepository _repository;

  GetItemFromCartUseCase({required CartRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, CartItem>> call(String input) async {
    return await _repository.getItemById(input);
  }
}
