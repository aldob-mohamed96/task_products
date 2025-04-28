import 'package:dartz/dartz.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/features/home/domain/entity/product.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, Products>> getProduct();
}
