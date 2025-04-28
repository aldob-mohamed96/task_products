import 'package:task_products/core/resources_manager/strings.dart';

final class ResponseMessage {
  static final ResponseMessage _instance = ResponseMessage._internal();

  factory ResponseMessage() {
    return _instance;
  }

  ResponseMessage._internal();

  static const String noContent = "no content";
  static const String badContent = "bad content";
  static const String unAuthorised = "unAuthorised";
  static const String forbidden = "forbidden";
  static const String internalServerError = "internal server error";
  static const String notFound = "not found";
  static const String connectTimeOut = "connect time out";
  static const String cancel = "cancel";
  static const String receiveTimeOut = "receive time out";
  static const String sendTimeOut = "send time out";
  static const String cashError = "cash error";
  static const String noInternetConnection = "no internet connection";
  static const String unknownError = "unknown error";
}
