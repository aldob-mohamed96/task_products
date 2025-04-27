import 'package:task_products/core/resources_manager/strings.dart';

final class ResponseMessage {
  static final ResponseMessage _instance = ResponseMessage._internal();

  factory ResponseMessage() {
    return _instance;
  }

  ResponseMessage._internal();

  static const String noContent = AppStrings.noContent;
  static const String badContent = AppStrings.badContent;
  static const String unAuthorised = AppStrings.unAuthorised;
  static const String forbidden = AppStrings.forbidden;
  static const String internalServerError = AppStrings.internalServerError;
  static const String notFound = AppStrings.notFound;
  static const String connectTimeOut = AppStrings.connectTimeOut;
  static const String cancel = AppStrings.cancel;
  static const String receiveTimeOut = AppStrings.receiveTimeOut;
  static const String sendTimeOut = AppStrings.sendTimeOut;
  static const String cashError = AppStrings.cashError;
  static const String noInternetConnection = AppStrings.noInternetConnection;
  static const String unknownError = AppStrings.unknownError;
}
