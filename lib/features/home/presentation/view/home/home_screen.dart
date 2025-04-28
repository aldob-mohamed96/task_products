import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products/app/production.dart';
import 'package:task_products/core/di/locator.dart';
import 'package:task_products/core/enum/enums.dart' show FlowStateApp;
import 'package:task_products/core/extension/context.dart';
import 'package:task_products/core/extension/data_type.dart';
import 'package:task_products/core/resources_manager/color.dart';
import 'package:task_products/core/routes/routes.dart';
import 'package:task_products/core/widgets/empty_content.dart';
import 'package:task_products/core/widgets/error_content.dart';
import 'package:task_products/core/widgets/font.dart';
import 'package:task_products/core/widgets/image_network.dart';
import 'package:task_products/core/widgets/loading.dart';
import 'package:task_products/core/widgets/main_screen.dart';
import 'package:task_products/features/auth/presentation/logic/authentication/authentication_cubit.dart';
import 'package:task_products/features/cart/presentation/logic/cart/cart_cubit.dart';
import 'package:task_products/features/home/domain/entity/product.dart';
import 'package:task_products/features/home/presentation/logic/home/home_cubit.dart';
import 'package:task_products/features/home/presentation/view/home/product_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>()..getProducts();
    context.read<CartCubit>()..getCartCount();
  }

  @override
  Widget build(BuildContext context) {
    return MainNavgaitionWidget(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              context.read<AuthenticationCubit>().logOut();
            },
            icon: const Icon(Icons.logout),
          ),
          actions: [
            SizedBox(width: 22),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    navigator.pushNamed(Routes.cart);
                  },
                  child: Badge(
                    backgroundColor: ColorManager.primaryColor,
                    offset: const Offset(5, -10),
                    label: state.countCart.toString().toText(
                      context,
                      color: ColorManager.white,
                    ),
                    child: const Icon(Icons.shopping_cart),
                  ),
                );
              },
            ),
            SizedBox(width: 22),
          ],
          title: "Products".toText(context),
        ),
        backgroundColor: ColorManager.white,
        body: ProductsView(),
      ),
    );
  }
}

//ignore: must_be_immutable
class ProductsView extends StatelessWidget {
  ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.flowStateApp == FlowStateApp.loading
              ? const Center(child: LoadinContent())
              : state.flowStateApp == FlowStateApp.error
              ? Center(
                child: ErrorContent(
                  message: state.failure.message,
                  onRefresh: () {
                    context.read<HomeCubit>().getProducts();
                  },
                ),
              )
              : state.flowStateApp == FlowStateApp.normal &&
                  state.products.products.isEmpty
              ? Center(
                child: EmptyContent(
                  onRefresh: () {
                    context.read<HomeCubit>().getProducts();
                  },
                ),
              )
              : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                  mainAxisExtent: 250,
                ),
                itemCount: state.products.products.length,
                itemBuilder: (context, index) {
                  return CartProductView(
                    product: state.products.products[index],
                  );
                },
              );
        },
      ),
    );
  }
}

//ignore: must_be_immutable
