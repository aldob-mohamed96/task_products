import 'package:flutter/material.dart';
import 'package:task_products/core/resources_manager/color.dart';
import 'package:task_products/core/resources_manager/values.dart';

OutlineInputBorder getInputBorder({
  double borderRaduis = AppSize.appSize4,
  Color colorBorder = const Color(0xffF6F6F6),
  double widthBorder = AppSize.appSize1,
}) => OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(borderRaduis)),
  borderSide: BorderSide(color: colorBorder, width: widthBorder),
);

OutlineInputBorder getInputBorderError({
  double borderRaduis = AppSize.appSize4,
  Color colorBorder = const Color.fromARGB(255, 244, 67, 54),
  double widthBorder = AppSize.appSize1,
}) => OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(borderRaduis)),
  borderSide: BorderSide(color: colorBorder, width: widthBorder),
);

//hint style
TextStyle getHintStyle({
  Color colorHint = ColorManager.hintColor,
  double fontSizeHint = AppSize.appSize16,
  FontWeight fontWeightHint = FontWeight.w500,
}) => TextStyle(
  color: colorHint.withOpacity(AppSize.appSize0_70),
  fontSize: fontSizeHint,
  fontWeight: fontWeightHint,
);

//text style
TextStyle getTextStyle({
  Color colorText = ColorManager.blackColor,
  double fontSizeText = AppSize.appSize16,
  FontWeight fontWeightText = FontWeight.w500,
}) => TextStyle(
  color: colorText,
  fontSize: fontSizeText,
  fontWeight: fontWeightText,
);

//error style
TextStyle getErrorStyle({
  Color colorError = ColorManager.redColor,
  double fontSizeError = AppSize.appSize14,
  TextOverflow overflow = TextOverflow.ellipsis,
  FontWeight fontWeightError = FontWeight.w400,
}) => TextStyle(
  color: colorError,
  fontSize: fontSizeError,
  overflow: overflow,
  fontWeight: fontWeightError,
);
