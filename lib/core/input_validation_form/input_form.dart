import 'dart:io';

import 'package:formz/formz.dart';
import 'package:task_products/core/resources_manager/constant.dart';

import '../enum/enums.dart';
import 'validation.dart';

class PasswordInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const PasswordInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const PasswordInput.dirty([value = AppConstants.defaultEmptyString])
    : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validatePassword(value!);
  }
}

class EmailInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const EmailInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const EmailInput.dirty([value = AppConstants.defaultEmptyString])
    : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validateEmail(value!);
  }
}
