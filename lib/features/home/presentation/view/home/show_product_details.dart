import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products/app/production.dart';
import 'package:task_products/core/di/locator.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/extension/context.dart';
import 'package:task_products/core/resources_manager/color.dart';
import 'package:task_products/core/widgets/font.dart';
import 'package:task_products/core/widgets/image_network.dart';
import 'package:task_products/core/widgets/loading.dart';
import 'package:task_products/core/widgets/show_dialog_snackbar.dart';
import 'package:task_products/features/cart/data/response/cart_response.dart';
import 'package:task_products/features/cart/presentation/logic/cart/cart_cubit.dart';
import 'package:task_products/features/home/domain/entity/product.dart';

Future<T?> showCustomModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isScrollControlled = true,
  bool showDragHandle = true,
  bool isDismissible = true,
  Duration duration = const Duration(milliseconds: 300),
  Curve curve = Curves.easeInOut,
  Curve reverseCurve = Curves.easeInOut,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    showDragHandle: showDragHandle,
    isDismissible: isDismissible,
    sheetAnimationStyle: AnimationStyle(
      curve: curve,
      reverseCurve: reverseCurve,
      duration: duration,
      reverseDuration: duration,
    ),
    transitionAnimationController: AnimationController(
      duration: duration,
      vsync: Navigator.of(context),
    )..forward(),
    builder: builder,
  );
}

class ShowProductDetails extends StatelessWidget {
  final Product product;
  const ShowProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .8,
      width: context.width,
      child: ColoredBox(
        color: ColorManager.white,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: NetWorkImageCashed(
                    url: product.image,
                    height: 200,
                    boxFit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),

                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(Icons.favorite_border, color: ColorManager.white),
                ),

                // posstion rate
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          product.rating.rate.toString(),
                          style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.white,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.star, color: ColorManager.white, size: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // title
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: context.width - 32,

                    child: Text(
                      product.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: FontSize.fontSize18,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.blackColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    product.category,
                    style: TextStyle(
                      fontSize: FontSize.fontSize14,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.blackColor,
                    ),
                  ),
                ),
              ],
            ),

            // description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                product.description,
                maxLines: 7,
                style: TextStyle(
                  fontSize: FontSize.fontSize14,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                  color: ColorManager.blackColor.withAlpha(222),
                ),
              ),
            ),

            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Price " + product.price.toString() + " SAR",
                    style: TextStyle(
                      fontSize: FontSize.fontSize18,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.blackColor,
                    ),
                  ),
                ),
              ],
            ),

            // increment and decrement circle button
            IncrementAndDecrmentView(product: product),
          ],
        ),
      ),
    );
  }
}

class IncrementAndDecrmentView extends StatefulWidget {
  final Product product;
  const IncrementAndDecrmentView({super.key, required this.product});

  @override
  State<IncrementAndDecrmentView> createState() =>
      _IncrementAndDecrmentViewState();
}

class _IncrementAndDecrmentViewState extends State<IncrementAndDecrmentView> {
  int _quntity = 1;
  bool isExist = false;
  @override
  void initState() {
    super.initState();
    checkItemExist();
  }

  void checkItemExist() async {
    final result = await context.read<CartCubit>().getItemFromCart(
      widget.product.id.toString(),
    );

    result.fold(
      (failure) {
        setState(() {
          isExist = false;
        });
      },
      (item) {
        if (item.id.isNotEmpty) {
          setState(() {
            isExist = true;
            _quntity = item.quantity;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: context.width,
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      if (_quntity > 1) {
                        setState(() {
                          _quntity--;
                        });
                      }
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorManager.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(Icons.remove, color: ColorManager.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: Text(
                      _quntity.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: FontSize.fontSize24,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.blackColor,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _quntity++;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorManager.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(Icons.add, color: ColorManager.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // add to cart button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // total price
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Total Price: " +
                        (widget.product.price * _quntity).toStringAsFixed(2) +
                        " SAR",
                    style: TextStyle(
                      fontSize: FontSize.fontSize16,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.blackColor,
                    ),
                  ),
                ),

                BlocConsumer<CartCubit, CartState>(
                  listener: (context, state) {
                    if (state.flowStateApp == FlowStateApp.successInserting) {
                      navigator.pop();

                      instance<IShowAlertMessage>().showSnakeBarSuccess(
                        context,
                        isExist ? "Item Update in Cart" : "Item added to cart",
                      );
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        if (state.flowStateApp != FlowStateApp.loadingInsert)
                          context.read<CartCubit>().addItemToCart(
                            CartItem(
                              id: widget.product.id.toString(),
                              title: widget.product.title,
                              price: widget.product.price,
                              quantity: _quntity,
                              image: widget.product.image,
                            ),
                          );
                      },
                      label:
                          state.flowStateApp == FlowStateApp.loadingInsert
                              ? Center(
                                child: Text(
                                  isExist ? "Updating..." : "Adding...",
                                  style: TextStyle(
                                    fontSize: FontSize.fontSize16,
                                    fontWeight: FontWeight.w600,
                                    color: ColorManager.white,
                                  ),
                                ),
                              )
                              : Text(
                                isExist ? "Update in Cart" : "Add to cart",
                                style: TextStyle(
                                  fontSize: FontSize.fontSize14,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.white,
                                ),
                              ),
                      icon:
                          state.flowStateApp != FlowStateApp.loadingInsert
                              ? Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                              )
                              : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
