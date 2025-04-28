import 'package:dartz/dartz.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/service/base_usecase.dart';
import 'package:task_products/features/cart/domain/repositories/cart_repository.dart';

final class GetCartCountsUseCase
    implements BaseUseCase<Unit, int> {
  final CartRepository _repository;

  GetCartCountsUseCase({required CartRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, int>> call(Unit input) async {
    return await _repository.getCartCount();
  }
}

