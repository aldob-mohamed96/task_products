import 'package:dartz/dartz.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/features/cart/domain/entity/cart_item.dart';

abstract class CartRepository {
  Future<Either<Failure, SuccessOperation>> addItem(CartItem item);
  Future<Either<Failure, SuccessOperation>> updateItem(CartItem item);
  Future<Either<Failure, SuccessOperation>> deleteItem(String id);
  Future<Either<Failure, CartItem>> getItemById(String id);
  Future<Either<Failure, CartData>> getAllItems();
  Future<Either<Failure, SuccessOperation>> clearCart();
  Future<Either<Failure, int>> getCartCount();
}
