import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/extension/context.dart';
import 'package:task_products/core/extension/data_type.dart';
import 'package:task_products/core/extension/widget.dart';
import 'package:task_products/core/resources_manager/color.dart';
import 'package:task_products/core/widgets/empty_content.dart';
import 'package:task_products/core/widgets/error_content.dart';
import 'package:task_products/core/widgets/font.dart';
import 'package:task_products/core/widgets/image_network.dart';
import 'package:task_products/core/widgets/loading.dart';
import 'package:task_products/features/cart/presentation/logic/cart/cart_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();

    context.read<CartCubit>().getAllItemsFromCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CartCubit>().clearCart();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return state.flowStateApp == FlowStateApp.loading
                    ? const Center(child: LoadinContent())
                    : state.flowStateApp == FlowStateApp.error
                    ? Center(
                      child: ErrorContent(
                        onRefresh: () {
                          context.read<CartCubit>().getAllItemsFromCart();
                        },
                      ),
                    )
                    : state.cartItems.items.isEmpty &&
                        state.flowStateApp == FlowStateApp.normal
                    ? Center(child: const EmptyContent())
                    : ListView.separated(
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 10),

                      itemCount: state.cartItems.items.length,
                      itemBuilder: (context, index) {
                        final item = state.cartItems.items[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SizedBox(
                            height: 100,
                            width: context.width,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: NetWorkImageCashed(
                                      url: item.image,
                                      height: 100,

                                      raduis: 10,
                                      width: 100,
                                      boxFit: BoxFit.cover,
                                    ),
                                  ),

                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Text(
                                          'Price: ${item.price.toStringAsFixed(2)} SAR',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed:
                                            () => context
                                                .read<CartCubit>()
                                                .deleteItemFromCart(item.id),
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),

                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              if (item.quantity > 1) {
                                                context
                                                    .read<CartCubit>()
                                                    .updateItemCart(
                                                      item.copyWith(
                                                        quantity:
                                                            item.quantity - 1,
                                                      ),
                                                    );
                                              }
                                            },
                                            icon: const Icon(Icons.remove),
                                          ),
                                          Text(
                                            item.quantity.toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              context
                                                  .read<CartCubit>()
                                                  .updateItemCart(
                                                    item.copyWith(
                                                      quantity:
                                                          item.quantity + 1,
                                                    ),
                                                  );
                                            },
                                            icon: const Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
              },
            ),
          ),

          Container(
            height: 150,
            width: context.width,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Text(
                      'Total: ${state.totalPrice.toStringAsFixed(2)} SAR',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                    );
                  },
                ),
                const SizedBox(height: 12),
                "Checkout".toEelevatedButton(
                  context,
                  () {},
                  colortext: ColorManager.primaryColor,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 50,
                  width: 150,
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  String title;
  double price;
  int quantity;
  String imageUrl;

  CartItem({
    required this.title,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}
