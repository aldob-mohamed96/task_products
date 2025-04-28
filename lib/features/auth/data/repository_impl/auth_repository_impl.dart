import 'package:dartz/dartz.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/error/error_handler.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/extension/data_source.dart';
import 'package:task_products/core/resources_manager/api_codes.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/core/service/network_info.dart';
import 'package:task_products/features/auth/data/data_source/local_data_source/local_data_source.dart';
import 'package:task_products/features/auth/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:task_products/features/auth/data/request/auth_request.dart';
import 'package:task_products/features/auth/domain/entity/user.dart';
import 'package:task_products/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _authLocalDataSource;
  final AuthRemoteDataSource _authRemoteDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl({
    required AuthLocalDataSource authLocalDataSource,
    required AuthRemoteDataSource authRemoteDataSource,
    required NetworkInfo networkInfo,
  }) : _authLocalDataSource = authLocalDataSource,
       _authRemoteDataSource = authRemoteDataSource,
       _networkInfo = networkInfo;

  @override
  Future<Either<Failure, AppAuthenticationLevel>> changeAuthentication(
    AuthenticationData authenicationData,
  ) async {
    try {
      return Right(
        await _authLocalDataSource.changeAuthentication(authenicationData),
      );
    } catch (e) {
      return Left(Failure(message: e.toString(), code: ResponseCode.cashError));
    }
  }

  @override
  Future<Either<Failure, AuthenticationData>> getAuthentication() async {
    try {
      return Right(await _authLocalDataSource.getAuthentication());
    } catch (e) {
      return Left(Failure(message: e.toString(), code: ResponseCode.cashError));
    }
  }

  @override
  Future<Either<Failure, String>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemoteDataSource.login(loginRequest);
        if (response.statusCode == 200) {
          return Right(response.data['token']);
        } else {
          return Left(
            Failure(
              message: response.data['error'],
              code: ResponseCode.internalServerError,
            ),
          );
        }
      } catch (e) {
        return Left(ExceptionHandling.handleError(e).failure);
      }
    } else {
      return Left(DataSourceNetworkError.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> logout() async {
    try {
      return Right(await _authLocalDataSource.logout());
    } catch (e) {
      return Left(Failure(message: e.toString(), code: ResponseCode.cashError));
    }
  }
}
