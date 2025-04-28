import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:task_products/core/di/locator.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/core/resources_manager/strings.dart';
import 'package:task_products/core/routes/pages.dart';
import 'package:task_products/core/routes/routes.dart';
import 'package:task_products/features/auth/presentation/logic/authentication/authentication_cubit.dart';
import 'package:task_products/features/cart/data/response/cart_response.dart';
import 'package:task_products/features/cart/presentation/logic/cart/cart_cubit.dart';
import 'package:task_products/features/home/presentation/logic/home/home_cubit.dart';

import '../core/enum/enums.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
NavigatorState get navigator => navigatorKey.currentState!;

class AppProductionStartPoint extends StatelessWidget {
  final AppRouter appRouter;
  const AppProductionStartPoint({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => instance<AuthenticationCubit>()..getAuthentication(),
        ),
        BlocProvider(create: (_) => instance<CartCubit>()),
        BlocProvider(create: (_) => instance<HomeCubit>()),
      ],
      child: AppMaterailProduction(appRouter: appRouter),
    );
  }
}

class AppMaterailProduction extends StatefulWidget {
  final AppRouter appRouter;

  const AppMaterailProduction({super.key, required this.appRouter});

  @override
  State<AppMaterailProduction> createState() => _AppMaterailProductionState();
}

class _AppMaterailProductionState extends State<AppMaterailProduction>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MultiBlocListener(
          listeners: [
            BlocListener<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                if (state.appAuthenticationLevel ==
                    AppAuthenticationLevel.authenticated) {
                  navigator.pushNamedAndRemoveUntil(
                    Routes.home,
                    (route) => false,
                  );
                } else if (state.appAuthenticationLevel ==
                    AppAuthenticationLevel.unAuthenticated) {
                  navigator.pushNamedAndRemoveUntil(
                    Routes.login,
                    (route) => false,
                  );
                } else {
                  navigator.pushNamedAndRemoveUntil(
                    Routes.splash,
                    (route) => false,
                  );
                }
              },
            ),
          ],
          child: child!,
        );
      },
      navigatorKey: navigatorKey,
      title: "Task Products App",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      onGenerateRoute: widget.appRouter.generateRoute,
      themeMode: ThemeMode.light,
    );
  }
}

Future<void> initAppProduction() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initAppServicesGetIt();
}
