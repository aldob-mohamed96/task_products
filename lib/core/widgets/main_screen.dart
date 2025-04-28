import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products/core/di/locator.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/extension/context.dart';
import 'package:task_products/core/extension/data_type.dart';
import 'package:task_products/core/resources_manager/color.dart';
import 'package:task_products/features/auth/presentation/logic/authentication/authentication_cubit.dart';
import 'package:task_products/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:task_products/features/cart/presentation/view/cart_screen.dart';

class MainNavgaitionWidget extends StatelessWidget {
  const MainNavgaitionWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: ColoredBox(
        color: ColorManager.whiteColor,
        child: MediaQuery(
          data: context.mediaQueryData,
          child: SafeArea(bottom: false, top: true, child: child),
        ),
      ),
    );
  }
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQueryData =>
      MediaQuery.of(this).copyWith(textScaler: textScalar);
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);
  TextScaler get textScalar => MediaQuery.of(
    this,
  ).textScaler.clamp(minScaleFactor: 0.5, maxScaleFactor: 1);
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // logout
          const SizedBox(height: 2),
          Center(
            child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed:
                      state.flowStateApp != FlowStateApp.logoutLoading
                          ? () {
                            context.read<AuthenticationCubit>().logOut();
                          }
                          : null,
                  child: const Text('Logout'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
