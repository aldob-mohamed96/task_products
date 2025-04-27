import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';

import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/error/network.dart';
import 'package:task_products/core/extension/data_source.dart';

import '../logger/logger.dart';
import 'permission.dart';
import 'url_launcher.dart';

class ExceptionHandling {
  ExceptionHandling.handleError(final dynamic error, {dynamic data = ''}) {
    final type = error.runtimeType;
    //  recoredError(error, data: data);
    if (type == DioException) {
      failure = NetworkException.handleNetworkError(error, data: data).failure;
      Logger.log('DioException : $error /n failure : ${failure.message}',
          level: LogLevel.success);
    } else if (type == SocketException) {
      failure = DataSourceNetworkError.internalServerError.getFailure();
      Logger.log('SocketException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else if (type == FormatException) {
      failure = DataSourceNetworkError.formatException.getFailure();
      Logger.log('FormatException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else if (type == UrlLauncherException) {
      failure = UrlLauncherException.handleUrlLancherError(error).failure;
      Logger.log(
          'UrlLauncherException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else if (type == PermissionException) {
      failure = PermissionException.handlePermissionError(error).failure;
      Logger.log('PermissionException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else if (type == Map<String, dynamic>) {
      failure = ApiException.handleApiError(error).failure;
      Logger.log('PermissionException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else {
      failure = DataSourceNetworkError.unknownError.getFailure();
      Logger.log('default : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    }
  }

  // void recoredError(dynamic error, {dynamic data = ''}) async {
  //   await FirebaseCrashlytics.instance.recordError(
  //     error,
  //     data,
  //     reason: 'A custom error occurred',
  //     fatal: false,
  //   );
  // }

  late Failure failure;
}
