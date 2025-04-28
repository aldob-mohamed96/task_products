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

class MainScreen extends StatefulWidget {
  final int index;
  const MainScreen({super.key, required this.index});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MainNavgaitionWidget(
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: ColorManager.primaryColor,
          unselectedItemColor: ColorManager.blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
        appBar: appBar(),
      ),
    );
  }

  AppBar appBar() {
    switch (_selectedIndex) {
      case 0:
        return AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        );
      case 1:
        return AppBar(
          title: const Text('Cart'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              icon: const Icon(Icons.home),
            ),
          ],
        );
      default:
        return AppBar(title: const Text('Profile'));
    }
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        cartFactory();
        return ExploreViewApartmentView();
      case 1:
        cartFactory();
        return ExploreViewApartmentView();
      default:
        return ProfileScreen();
    }
  }
}

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
