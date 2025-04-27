import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_products/core/routes/routes.dart';
import 'package:task_products/features/login/presentation/view/login/login_screen.dart';

import '../di/factory_locator.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}
