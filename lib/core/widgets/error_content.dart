import 'package:flutter/material.dart';
import 'package:task_products/core/extension/data_type.dart';
import 'package:task_products/core/extension/widget.dart';
import 'package:task_products/core/resources_manager/assets.dart';
import 'package:task_products/core/resources_manager/strings.dart';
import 'package:task_products/core/resources_manager/values.dart';

import '../resources_manager/color.dart';

class ErrorContent extends StatelessWidget {
  final String message;

  final VoidCallback? onRefresh;
  const ErrorContent({
    super.key,
    this.onRefresh,
    this.message = "Error Ocurred",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.assetsJsonError.toAssetLottie(
            height: AppSize.appSize100,
            width: AppSize.appSize100,
          ),
          AppSize.appSize20.heightSizedBox,
          (message.isEmpty ? "Error Ocurred" : message).toText(
            context,
            fontSize: AppSize.appSize16,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            color: ColorManager.blackColor,
          ),
          AppSize.appSize10.heightSizedBox,
          if (onRefresh != null)
            "Retry Again".toEelevatedButton(
              context,
              onRefresh,
              colortext: ColorManager.white,
            ),
        ],
      ),
    );
  }
}
