final class ApiInternalStatusCode {
  static final ApiInternalStatusCode _instance =
      ApiInternalStatusCode._internal();

  factory ApiInternalStatusCode() {
    return _instance;
  }

  ApiInternalStatusCode._internal();

  static const int failure = 0;
  static const int success = 1;
}

final class ResponseCode {
  static final ResponseCode _instance = ResponseCode._internal();

  factory ResponseCode() {
    return _instance;
  }

  ResponseCode._internal();
  //http response code
  static const int success = 200;
  static const int noContent = 201;
  static const int createdSuccessfully = 204;
  static const int badContent = 400;
  static const int unAuthorised = 401;
  static const int forbidden = 403;
  static const int internalServerError = 200;
  static const int notFound = 404;

  //local error code http not executed
  static const int connectTimeOut = -1000;
  static const int cancel = -1002;
  static const int recieveTimeOut = -1003;
  static const int sendTimeOut = -1004;
  static const int cashError = -1005;
  static const int noInternetConnection = -1006;
  static const int unknownError = -1007;

  }
