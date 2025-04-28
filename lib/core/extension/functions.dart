import 'package:flutter/material.dart';

import 'package:task_products/core/extension/data_type.dart';
import 'package:task_products/core/resources_manager/strings.dart';

import '../resources_manager/color.dart';
import '../resources_manager/values.dart';

extension VoidCallbackEx on VoidCallback? {
  Widget toElevetatedButton(
    BuildContext context, {
    Color color = ColorManager.primaryColor,
    String text = "Retry Again",
  }) =>
      this == null
          ? const SizedBox()
          : ElevatedButton(
            onPressed: this,
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.appSize40),
              ),
            ),
            child: text.toText(
              context,
              fontSize: AppSize.appSize16,
              fontWeight: FontWeight.w700,
              color: ColorManager.whiteColor,
            ),
          );
}

extension SizedBoxExtension on Widget {
  SizedBox addSizedBox({
    double width = AppSize.appSize100,
    double height = AppSize.appSize100,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    Color backgroundColor = ColorManager.whiteColor,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(color: backgroundColor),
        child: Padding(padding: padding, child: this),
      ),
    );
  }
}

// extension container without container jush padding color without container widget
