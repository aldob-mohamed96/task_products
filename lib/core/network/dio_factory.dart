import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task_products/core/service/app_preferance.dart';

import '../enum/enums.dart';
import '../resources_manager/constant.dart';

abstract interface class IDioFactory {
  Future<Dio> getDio();
}

class DioFactoryImpl implements IDioFactory {
  final _dio = Dio();

  DioFactoryImpl();

  @override
  Future<Dio> getDio() async {
    _dio.options = BaseOptions(followRedirects: true, maxRedirects: 2);

    _dio.interceptors.add(InterceptorsWrapper());

    if (!kReleaseMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
    }
    return _dio;
  }
}
