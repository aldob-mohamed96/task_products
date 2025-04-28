import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_products/core/extension/context.dart';
import 'package:task_products/core/extension/data_type.dart';
import 'package:task_products/core/extension/widget.dart';
import 'package:task_products/core/resources_manager/color.dart';
import 'package:task_products/core/resources_manager/constant.dart';
import 'package:task_products/core/resources_manager/strings.dart';
import 'package:task_products/core/resources_manager/values.dart';
import 'package:task_products/core/widgets/font.dart';
import 'package:task_products/core/widgets/input_border.dart';

class LabelText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final double? width;
  final double? letterSpacing;
  final FontStyle? fontStyle;
  final TextBaseline? textBaseline;
  const LabelText({
    super.key,
    required this.text,
    this.textStyle,
    this.textAlign,
    this.padding,
    this.margin,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.height,
    this.width,
    this.letterSpacing,
    this.fontStyle,
    this.textBaseline,
  });
  @override
  Widget build(BuildContext context) {
    return text.toText(
      context,
      textAlign: textAlign ?? TextAlign.start,
      color: color ?? ColorManager.lableInputColor,
      fontSize: fontSize ?? FontSize.fontSize14,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontFamily: fontFamily,
      softWrap: softWrap,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}

class EmailInputView extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;

  final ValueChanged<String> onChanged;
  final Color? fillColor;
  final String? initialValue;
  //border

  //optional
  const EmailInputView({
    super.key,
    this.fillColor,
    this.padding,
    this.contentPadding,
    this.margin,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.error,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: width ?? double.infinity,
      height: error != null ? null : AppSize.appSize65,
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: TextInputType.emailAddress,
        cursorColor: cursorColor ?? ColorManager.primaryColor,
        cursorHeight: cursorHeight ?? AppSize.appSize20,
        cursorWidth: cursorWidth ?? AppSize.appSize2,
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        style: textStyle ?? getTextStyle(),
        decoration: InputDecoration(
          fillColor: fillColor ?? ColorManager.greyColor,
          errorMaxLines: 1,
          border: getInputBorder(),
          focusedBorder: focusedBorder ?? getInputBorder(),
          enabledBorder: enabledBorder ?? getInputBorder(),
          errorBorder: erorrBorder ?? getInputBorderError(),
          disabledBorder: disabledBorder ?? getInputBorderError(),
          errorStyle: errorStyle ?? getErrorStyle(),
          counterText: AppConstants.defaultEmptyString,
          contentPadding:
              contentPadding ??
              const EdgeInsets.symmetric(
                vertical: AppPadding.appPadding8,
                horizontal: AppPadding.appPadding16,
              ),
          // isDense: true,
          prefixIcon: preffuixIcon,
          hintText: "Enter your email",
          hintStyle: hintStyle ?? getHintStyle(),
          errorText: error != null ? error! : null,
        ),
      ),
    );
  }
}

class PasswordInputView extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;

  final ValueChanged<String> onChanged;
  final Function()? hidePassword;
  final bool? visiable;
  final Widget? suffixIcon;
  final String? initialValue;
  final bool? isReadOnly;
  final Color? fillColor;
  //border

  //optional
  const PasswordInputView({
    super.key,
    this.padding,
    this.fillColor,
    this.contentPadding,
    this.margin,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.error,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.visiable,
    this.hidePassword,
    this.suffixIcon,
    this.initialValue,
    this.isReadOnly,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: width ?? double.infinity,
      height: error != null ? null : AppSize.appSize65,
      child: TextFormField(
        readOnly: isReadOnly ?? false,
        initialValue: initialValue,
        onChanged: onChanged,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: TextInputType.text,
        cursorColor: cursorColor ?? ColorManager.primaryColor,
        cursorHeight: cursorHeight ?? AppSize.appSize20,
        cursorWidth: cursorWidth ?? AppSize.appSize2,
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        obscureText: visiable ?? true,
        maxLength: length ?? AppValue.appValue60,
        style: textStyle ?? getTextStyle(),
        decoration: InputDecoration(
          fillColor: fillColor ?? ColorManager.greyColor,
          border: getInputBorder(),
          focusedBorder: focusedBorder ?? getInputBorder(),
          enabledBorder: enabledBorder ?? getInputBorder(),
          errorBorder: erorrBorder ?? getInputBorderError(),
          disabledBorder: disabledBorder ?? getInputBorderError(),
          errorStyle: errorStyle ?? getErrorStyle(),
          counterText: AppConstants.defaultEmptyString,
          contentPadding:
              contentPadding ??
              const EdgeInsets.symmetric(
                vertical: AppPadding.appPadding8,
                horizontal: AppPadding.appPadding16,
              ),
          //isDense: true,
          prefixIcon: preffuixIcon,
          suffixIcon:
              suffixIcon ??
              IconButton(
                icon: Icon(
                  visiable ?? true ? Icons.visibility_off : Icons.visibility,
                  color: ColorManager.primaryColor,
                ),
                onPressed: hidePassword,
              ),
          hintText: "Enter your password",
          hintStyle: hintStyle ?? getHintStyle(),
          errorText: error != null ? error ?? "" : null,
        ),
      ),
    );
  }
}
