import 'package:flutter/material.dart';
import 'package:task_products/core/extension/context.dart';
import 'package:task_products/core/extension/data_type.dart';
import 'package:task_products/core/resources_manager/assets.dart';
import 'package:task_products/core/resources_manager/color.dart';
import 'package:task_products/core/resources_manager/strings.dart';
import 'package:task_products/core/resources_manager/values.dart';

class EmptyContent extends StatelessWidget {
  final String message;
  final String subtitleMessage;
  final VoidCallback? onRefresh;
  final bool showButton;
  final bool showIcon;
  final Widget? iconWidget;

  const EmptyContent({
    super.key,
    this.onRefresh,
    this.iconWidget,
    this.message = "No Data",
    this.showButton = false,
    this.showIcon = false,
    this.subtitleMessage = "",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 125,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.assetsJsonEmpty.toAssetLottie(
              height: AppSize.appSize50,
              width: 80,
            ),
            SizedBox(height: 30),
            message.toText(
              context,
              fontSize: AppSize.appSize18,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              color: ColorManager.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
