import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/error/error_handler.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/extension/data_source.dart';
import 'package:task_products/core/resources_manager/api_codes.dart';
import 'package:task_products/core/service/network_info.dart';
import 'package:task_products/features/home/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:task_products/features/home/data/mapper/product_mapper.dart';
import 'package:task_products/features/home/domain/entity/product.dart';
import 'package:task_products/features/home/domain/repository/repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  HomeRepositoryImpl({
    required HomeRemoteDataSource remoteDataSource,
    required NetworkInfo networkInfo,
  }) : _remoteDataSource = remoteDataSource,
       _networkInfo = networkInfo;

  @override
  Future<Either<Failure, Products>> getProduct() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getHomeData();
        if (response.statusCode == 200) {
          return Right(response.toProductHome());
        } else {
          return Left(
            Failure(
              message: response.data['error'],
              code: ResponseCode.internalServerError,
            ),
          );
        }
      } catch (e) {
        log(e.toString());
        return Left(ExceptionHandling.handleError(e).failure);
      }
    } else {
      return Left(DataSourceNetworkError.noInternetConnection.getFailure());
    }
  }
}
