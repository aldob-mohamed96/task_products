import 'package:task_products/core/enum/enums.dart';

mixin ValidationImpl {
  DataSourceValidationInput? validateEmail(String? email) {
    final exp = RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (email == null || email.isEmpty) {
      return DataSourceValidationInput.empty;
    }
    if (!exp.hasMatch(email)) {
      return DataSourceValidationInput.notEmail;
    }
    return null;
  }

  DataSourceValidationInput? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return DataSourceValidationInput.empty;
    }

    if (password.length < 6) {
      return DataSourceValidationInput.shortPassword;
    }
    if (password.length > 25) {
      return DataSourceValidationInput.veryLong;
    }
    return null;
  }
}
