import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';

import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/core/extension/data_source.dart';

import '../logger/logger.dart';

class ExceptionHandling {
  ExceptionHandling.handleError(final dynamic error, {dynamic data = ''}) {
    final type = error.runtimeType;
    //  recoredError(error, data: data);
    if (type == DioException) {
      failure = NetworkException.handleNetworkError(error, data: data).failure;
      Logger.log(
        'DioException : $error /n failure : ${failure.message}',
        level: LogLevel.success,
      );
    } else if (type == SocketException) {
      failure = DataSourceNetworkError.internalServerError.getFailure();
      Logger.log(
        'SocketException : $error /n failure : ${failure.message}',
        level: LogLevel.debug,
      );
    } else if (type == FormatException) {
      failure = DataSourceNetworkError.formatException.getFailure();
      Logger.log(
        'FormatException : $error /n failure : ${failure.message}',
        level: LogLevel.debug,
      );
    } else {
      failure = DataSourceNetworkError.unknownError.getFailure();
      Logger.log(
        'default : $error /n failure : ${failure.message}',
        level: LogLevel.debug,
      );
    }
  }

  late Failure failure;
}

class NetworkException implements Exception {
  NetworkException.handleNetworkError(
    final dynamic error, {
    dynamic data = '',
  }) {
    if (error is DioException) {
      failure = _handleNetworkDioFailure(error, data);
    } else {
      failure = DataSourceNetworkError.unknownError.getFailure();
    }
  }
  late Failure failure;

  Failure _handleNetworkDioFailure(final DioException error, dynamic data) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSourceNetworkError.connectTimeOut.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSourceNetworkError.sendTimeOut.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSourceNetworkError.receiveTimeOut.getFailure();
      case DioExceptionType.connectionError:
        return DataSourceNetworkError.connectTimeOut.getFailure();
      case DioExceptionType.badResponse:
        if (error.response != null) {
          final errorData = error.response!.data;

          if (errorData is Map<String, dynamic>) {
            if (errorData['error'] != null) {
              final errors = errorData['error'];
              if (errors is List<dynamic>) {
                return Failure(
                  code: 10203040,
                  message: errors.first.toString(),
                );
              } else {
                return Failure(
                  code: 10203040,
                  message: errorData['error'].toString(),
                );
              }
            }
          }
          if (error.response!.statusCode == 401) {
            return DataSourceNetworkError.unAuthorized.getFailure();
          } else if (error.response!.statusCode == 403) {
            return DataSourceNetworkError.forbidden.getFailure();
          } else if (error.response!.statusCode == 404) {
            return DataSourceNetworkError.notFound.getFailure();
          } else if (error.response!.statusCode == 500) {
            return DataSourceNetworkError.internalServerError.getFailure();
          } else {
            return DataSourceNetworkError.unknownError.getFailure();
          }
        } else {
          return DataSourceNetworkError.unknownError.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSourceNetworkError.cancel.getFailure();
      case DioExceptionType.badCertificate:
        return DataSourceNetworkError.unAuthorized.getFailure();

      default:
        return DataSourceNetworkError.unknownError.getFailure();
    }
  }
}
