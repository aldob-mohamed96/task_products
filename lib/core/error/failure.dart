import 'package:equatable/equatable.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/core/resources_manager/strings.dart';


final class Failure extends Equatable implements Exception {
  final int code;
  final String message;
  const Failure(
      {this.code = AppConstants.defaultEmptyInteger,
      this.message = AppStrings.unknownError});

  const Failure.empty()
      : this(
            code: AppConstants.defaultEmptyInteger,
            message: AppConstants.defaultEmptyString);
  const Failure.unknownError()
      : this(
            code: AppConstants.defaultEmptyInteger,
            message: AppStrings.unknownError);

  @override
  String toString() {
    return 'Failure{code: $code, message: $message}';
  }

  @override
  List<Object?> get props => [code, message];
}
