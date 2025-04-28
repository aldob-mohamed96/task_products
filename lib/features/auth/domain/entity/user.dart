import 'package:equatable/equatable.dart';
import 'package:task_products/core/enum/enums.dart';

class AuthenticationData extends Equatable {
  final String token;
  final AppAuthenticationLevel appAuthenticationLevel;

  const AuthenticationData({
    this.token = "",
    this.appAuthenticationLevel = AppAuthenticationLevel.initial,
  });

  // copyWith
  copyWith({String? token, AppAuthenticationLevel? appAuthenticationLevel}) {
    return AuthenticationData(
      appAuthenticationLevel:
          appAuthenticationLevel ?? this.appAuthenticationLevel,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [token, appAuthenticationLevel];
}
