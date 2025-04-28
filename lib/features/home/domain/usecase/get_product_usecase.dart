import 'package:dartz/dartz.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/core/service/base_usecase.dart';
import 'package:task_products/features/cart/domain/entity/cart_item.dart';
import 'package:task_products/features/cart/domain/repositories/cart_repository.dart';
import 'package:task_products/features/home/domain/entity/product.dart';
import 'package:task_products/features/home/domain/repository/repository.dart';

final class GetProductsUseCase implements BaseUseCase<Unit, Products> {
  final HomeRepository _repository;

  GetProductsUseCase({required HomeRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, Products>> call(Unit input) async {
    return await _repository.getProduct();
  }
}
