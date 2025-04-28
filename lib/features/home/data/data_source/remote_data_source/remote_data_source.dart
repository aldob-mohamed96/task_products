import 'package:dio/dio.dart';
import 'package:task_products/core/network/api.dart';
import 'package:task_products/core/resources_manager/constant.dart';

abstract interface class HomeRemoteDataSource {
  Future<Response> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ClientApi _clientApi;

  HomeRemoteDataSourceImpl({required ClientApi clientApi})
    : _clientApi = clientApi;

  @override
  Future<Response> getHomeData() async {
    return await _clientApi.getApiReturnList(AppConstants.apiHome);
  }
}
