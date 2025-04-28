/*
o Use Hive to store cart items locally
o Each cart item should store: id, title, price, quantity, image
*/

import 'package:hive/hive.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/core/service/app_preferance.dart';
import 'package:task_products/features/auth/domain/entity/user.dart';
import 'package:task_products/features/cart/data/response/cart_response.dart';

abstract interface class AuthLocalDataSource {
  Future<AuthenticationData> getAuthentication();
  Future<AppAuthenticationLevel> changeAuthentication(
    AuthenticationData authenicationData,
  );
  // logout
  Future<SuccessOperation> logout();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final AppPreferences _appPreferences;

  AuthLocalDataSourceImpl({required AppPreferences appPreferences})
    : _appPreferences = appPreferences;

  @override
  Future<AppAuthenticationLevel> changeAuthentication(
    AuthenticationData authenicationData,
  ) async {
    return await _appPreferences.changeAuthentication(authenicationData);
  }

  @override
  Future<AuthenticationData> getAuthentication() async {
    return await _appPreferences.getAuthentication();
  }

  @override
  Future<SuccessOperation> logout() async {
    return await _appPreferences.logout();
  }
}
