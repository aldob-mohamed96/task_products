import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/features/cart/data/data_source/local_data_source/local_data_source.dart';
import 'package:task_products/features/cart/data/response/cart_response.dart';
import 'package:task_products/features/cart/domain/entity/cart_item.dart';
import 'package:task_products/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource _localDataSource;

  CartRepositoryImpl({required CartLocalDataSource localDataSource})
    : _localDataSource = localDataSource;

  @override
  Future<Either<Failure, int>> addItem(CartItem item) async {
    try {
      ;

      return Right(await _localDataSource.addItemToCart(item));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> clearCart() async {
    try {
      _localDataSource.clearCart();
      return Right(SuccessOperation(isSuccess: true));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> deleteItem(String id) async {
    try {
      _localDataSource.deleteItemFromCart(int.parse(id));
      return Right(SuccessOperation(isSuccess: true));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartData>> getAllItems() async {
    try {
      final cartItems = await _localDataSource.getAllItemsFromCart();
      return Right(CartData(items: cartItems));
    } catch (e) {
      log(e.toString());
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getCartCount() async {
    try {
      final cartItems = await _localDataSource.getCartCount();
      return Right(cartItems);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartItem>> getItemById(String id) async {
    try {
      final cartItem = await _localDataSource.getItemFromCart(id);
      return Right(cartItem);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> updateItem(CartItem item) async {
    try {
      _localDataSource.updateItemToCart(item);
      return Right(SuccessOperation(isSuccess: true));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
