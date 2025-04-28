import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/features/auth/domain/entity/user.dart';
import 'package:task_products/features/cart/data/response/cart_response.dart';

abstract interface class AppPreferences {
  // auth
  Future<AppAuthenticationLevel> changeAuthentication(AuthenticationData token);
  Future<AuthenticationData> getAuthentication();
  Future<SuccessOperation> logout();

  // cart
  Future<int> addItemToCart(CartItem item);
  Future<SuccessOperation> updateItemToCart(CartItem item);
  Future<SuccessOperation> deleteItemFromCart(int id);
  Future<List<CartItem>> getAllItemsFromCart();
  Future<CartItem> getItemFromCart(String id);
  Future<SuccessOperation> clearCart();
  Future<bool> isCartEmpty();
  Future<int> getCartItemsCount();
}

class AppPreferencesImpl implements AppPreferences {
  final box = Hive.box(AppConstants.hiveCartBox);

  final userBox = Hive.box(AppConstants.hiveBoxUser);

  Future<int> addItemToCart(CartItem item) async {
    try {
      await box.put(item.id, item);

      return box.length;
    } catch (e) {
      return -1;
    }
  }

  Future<SuccessOperation> updateItemToCart(CartItem item) async {
    try {
      await box.put(item.id, item);
      return SuccessOperation(isSuccess: true);
    } catch (e) {
      return SuccessOperation(isSuccess: false, message: e.toString());
    }
  }

  Future<SuccessOperation> deleteItemFromCart(int id) async {
    try {
      await box.delete(id);
      return SuccessOperation(isSuccess: true);
    } catch (e) {
      return SuccessOperation(isSuccess: false, message: e.toString());
    }
  }

  Future<List<CartItem>> getAllItemsFromCart() async {
    return box.values
        .toList()
        .map(
          (e) => CartItem(
            id: e.id,
            title: e.title,
            price: e.price,
            quantity: e.quantity,
            image: e.image,
          ),
        )
        .toList();
  }

  Future<CartItem> getItemFromCart(String id) async {
    final values = box.values.toList();

    for (var item in values) {
      if (item.id.toString() == id.toString()) {
        return item;
      }
    }

    return CartItem.empty();
  }

  Future<SuccessOperation> clearCart() async {
    try {
      await box.clear();
      return SuccessOperation(isSuccess: true);
    } catch (e) {
      return SuccessOperation(isSuccess: false, message: e.toString());
    }
  }

  Future<bool> isCartEmpty() async {
    return box.isEmpty;
  }

  Future<int> getCartItemsCount() async {
    return box.length;
  }

  @override
  Future<AuthenticationData> getAuthentication() {
    try {
      final token = userBox.get('token');
      if (token == null) {
        return Future.value(AuthenticationData());
      } else {
        return Future.value(
          AuthenticationData(
            appAuthenticationLevel: AppAuthenticationLevel.authenticated,
            token: token,
          ),
        );
      }
    } catch (e) {
      return Future.value(AuthenticationData());
    }
  }

  @override
  Future<AppAuthenticationLevel> changeAuthentication(
    AuthenticationData authenicationData,
  ) async {
    try {
      if (authenicationData.appAuthenticationLevel ==
          AppAuthenticationLevel.authenticated) {
        await userBox.put('token', authenicationData.token);
        return AppAuthenticationLevel.authenticated;
      } else {
        await userBox.delete('token');
        return AppAuthenticationLevel.unAuthenticated;
      }
    } catch (e) {
      return Future.value(AppAuthenticationLevel.unAuthenticated);
    }
  }

  @override
  Future<SuccessOperation> logout() async {
    try {
      await userBox.delete('token');
      return SuccessOperation(isSuccess: true);
    } catch (e) {
      return SuccessOperation(isSuccess: false, message: e.toString());
    }
  }
}
