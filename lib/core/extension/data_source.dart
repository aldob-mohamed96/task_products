import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/error/failure.dart';

import '../resources_manager/api_codes.dart';
import '../resources_manager/api_messages.dart';
import '../resources_manager/constant.dart';
import '../resources_manager/strings.dart';

extension InputFiledError on DataSourceValidationInput? {
  String getErrorInput() {
    switch (this) {
      case DataSourceValidationInput.empty:
        return "Input is empty";
      case DataSourceValidationInput.usernameStyle:
        return "Input is not username style";
      case DataSourceValidationInput.shortPassword:
        return "Input is short password";
      case DataSourceValidationInput.notIdenticalPassword:
        return "Input is not identical password";
      case DataSourceValidationInput.weakPassword:
        return "Input is weak password";
      case DataSourceValidationInput.veryLong:
        return "Input is very long";
      case DataSourceValidationInput.length:
        return "Input is not length";
      case DataSourceValidationInput.maxInputCount:
        return "Input is max count";
      case DataSourceValidationInput.notPhoneStyle:
        return "Input is not phone style";
      case DataSourceValidationInput.notEmail:
        return "Input is not email";
      case DataSourceValidationInput.notInteger:
        return "Input is not integer";

      case DataSourceValidationInput.unknown:
        return "Input is unknown";
      case DataSourceValidationInput.inValidFormat:
        return "Input is not valid format";

      default:
        return "";
    }
  }
}

extension DataSourceExtension on DataSourceNetworkError {
  Failure getFailure() {
    switch (this) {
      case DataSourceNetworkError.notFound:
        return const Failure(
          code: ResponseCode.notFound,
          message: ResponseMessage.notFound,
        );
      case DataSourceNetworkError.noContent:
        return const Failure(
          code: ResponseCode.noContent,
          message: ResponseMessage.noContent,
        );
      case DataSourceNetworkError.badContent:
        return const Failure(
          code: ResponseCode.badContent,
          message: ResponseMessage.badContent,
        );
      case DataSourceNetworkError.forbidden:
        return const Failure(
          code: ResponseCode.forbidden,
          message: ResponseMessage.forbidden,
        );
      case DataSourceNetworkError.unAuthorized:
        return const Failure(
          code: ResponseCode.unAuthorised,
          message: ResponseMessage.unAuthorised,
        );
      case DataSourceNetworkError.internalServerError:
        return const Failure(
          code: ResponseCode.internalServerError,
          message: ResponseMessage.internalServerError,
        );
      case DataSourceNetworkError.connectTimeOut:
        return const Failure(
          code: ResponseCode.connectTimeOut,
          message: ResponseMessage.connectTimeOut,
        );
      case DataSourceNetworkError.cancel:
        return const Failure(
          code: ResponseCode.cancel,
          message: ResponseMessage.cancel,
        );
      case DataSourceNetworkError.receiveTimeOut:
        return const Failure(
          code: ResponseCode.recieveTimeOut,
          message: ResponseMessage.receiveTimeOut,
        );
      case DataSourceNetworkError.sendTimeOut:
        return const Failure(
          code: ResponseCode.sendTimeOut,
          message: ResponseMessage.sendTimeOut,
        );
      case DataSourceNetworkError.cashError:
        return const Failure(
          code: ResponseCode.cashError,
          message: ResponseMessage.cashError,
        );
      case DataSourceNetworkError.noInternetConnection:
        return const Failure(
          code: ResponseCode.noInternetConnection,
          message: ResponseMessage.noInternetConnection,
        );

      default:
        return const Failure(
          code: ResponseCode.unknownError,
          message: ResponseMessage.unknownError,
        );
    }
  }
}
