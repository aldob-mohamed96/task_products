import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products/app/production.dart';
import 'package:task_products/core/di/locator.dart';
import 'package:task_products/core/enum/enums.dart' show FlowStateApp;
import 'package:task_products/core/extension/context.dart';
import 'package:task_products/core/extension/data_type.dart';
import 'package:task_products/core/resources_manager/color.dart';
import 'package:task_products/core/widgets/font.dart';
import 'package:task_products/core/widgets/image_network.dart';
import 'package:task_products/features/home/domain/entity/product.dart';
import 'package:task_products/features/home/presentation/view/home/show_product_details.dart';

class CartProductView extends StatelessWidget {
  final Product product;
  CartProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width / 2 - 40,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image with badge and favorite icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: NetWorkImageCashed(
                    url: product.image,
                    height: 150,
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

            // Title and Price
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      product.title,
                      maxLines: 2,

                      style: TextStyle(
                        fontSize: 14,

                        fontWeight: FontWeight.w500,

                        overflow: TextOverflow.ellipsis,
                        color: ColorManager.blackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${product.price} SAR",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.primaryColor,
                        ),
                      ),

                      // cart icon
                      GestureDetector(
                        onTap: () async {
                          await showCustomModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return ShowProductDetails(product: product);
                            },
                          );
                        },
                        child: Icon(
                          Icons.add_shopping_cart_outlined,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
