import 'package:dio/dio.dart';
import 'package:task_products/core/network/api.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/core/service/network_info.dart';
import 'package:task_products/features/auth/data/request/auth_request.dart';

abstract interface class AuthRemoteDataSource {
  Future<Response> login(LoginRequest loginRequest);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ClientApi _clientApi;

  AuthRemoteDataSourceImpl({required ClientApi clientApi})
    : _clientApi = clientApi;

  @override
  Future<Response> login(LoginRequest loginRequest) async {
    return await _clientApi.postApi(
      AppConstants.apiLogin,
      headers: {'x-api-key': 'reqres-free-v1'},
      data: loginRequest.toJson(),
    );
  }
}
