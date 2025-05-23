/*
o Use Hive to store cart items locally
o Each cart item should store: id, title, price, quantity, image
*/

import 'package:hive/hive.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/core/service/app_preferance.dart';
import 'package:task_products/features/cart/data/response/cart_response.dart';

abstract interface class CartLocalDataSource {
  Future<int> addItemToCart(CartItem item);
  Future<void> updateItemToCart(CartItem item);
  Future<void> deleteItemFromCart(String id);
  Future<List<CartItem>> getAllItemsFromCart();
  Future<CartItem> getItemFromCart(String id);
  Future<void> clearCart();
  Future<int> getCartCount();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final AppPreferences _appPreferences;

  CartLocalDataSourceImpl({required AppPreferences appPreferences})
    : _appPreferences = appPreferences;

  @override
  Future<int> addItemToCart(CartItem item) async {
    return await _appPreferences.addItemToCart(item);
  }

  @override
  Future<void> updateItemToCart(CartItem item) async {
    await _appPreferences.updateItemToCart(item);
  }

  @override
  Future<void> deleteItemFromCart(String id) async {
    await _appPreferences.deleteItemFromCart(id);
  }

  @override
  Future<List<CartItem>> getAllItemsFromCart() async {
    return await _appPreferences.getAllItemsFromCart();
  }

  @override
  Future<CartItem> getItemFromCart(String id) async {
    return await _appPreferences.getItemFromCart(id);
  }

  @override
  Future<void> clearCart() async {
    await _appPreferences.clearCart();
  }

  @override
  Future<int> getCartCount() {
    return _appPreferences.getCartItemsCount();
  }
}
