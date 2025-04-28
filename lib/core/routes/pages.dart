import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_products/core/di/locator.dart';
import 'package:task_products/core/routes/routes.dart';
import 'package:task_products/core/widgets/main_screen.dart';
import 'package:task_products/features/auth/presentation/view/login/login_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        loginFactory();
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => MainScreen(index: 0));
      case Routes.cart:
        cartFactory();
        return MaterialPageRoute(builder: (_) => MainScreen(index: 1));
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => MainScreen(index: 2));
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          'Task Products',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
