import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lottie/lottie.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/resources_manager/strings.dart';
import 'package:task_products/core/widgets/image_network.dart';

import '../resources_manager/color.dart';
import '../resources_manager/constant.dart';
import '../resources_manager/values.dart';
import '../widgets/loading.dart';

import 'widget.dart';

extension StringExtensions on String? {
  bool get isEnglish {
    final hasArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(this ?? "");
    final hasEnglishOnly = RegExp(r'^[\x00-\x7F]+$').hasMatch(this ?? "");
    return !hasArabic && hasEnglishOnly;
  }
}

extension RemoveDecimal on String {
  String removeDecimal() {
    if (contains('.') && split('.')[1] == '00') {
      return split('.')[0]; // Return only the integer part if decimal is .00
    }
    return this; // Otherwise, return the string as is
  }
}

// extension PriceExtension on String {
//   // Extension method to format the price
//   String formatPrice() {
//     // If price has no decimal part, return it as an integer, otherwise keep the decimal
//     return this % 1 == 0 ? toIntValue().toString() : toString();
//   }
// }
String formatDateWithSuffix(DateTime date, bool isArabic) {
  if (isArabic) {
    // Localized month name in Arabic
    final month = intl.DateFormat('MMMM', 'ar').format(date);

    // Convert day and year to Arabic numerals
    final day = _convertToArabicNumbers(date.day);
    final year = _convertToArabicNumbers(date.year);

    return 'اليوم $day $month $year'; // Arabic format: "اليوم ٣ مارس ٢٠٢٣"
  } else {
    // Localized month name in English
    final month = intl.DateFormat('MMMM', 'en').format(date);

    final day = date.day; // Day remains in English numerals
    final year = date.year; // Year remains in English numerals

    return 'Today, $month $day, $year'; // English format: "Today, March 3, 2023"
  }
}

// Helper function to convert numbers to Arabic numerals
String _convertToArabicNumbers(int number) {
  const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  return number
      .toString()
      .split('')
      .map((digit) => arabicNumbers[int.parse(digit)])
      .join();
}

String getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th'; // Handle 11th, 12th, and 13th
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

extension ResponseData on Response {
  bool isOperationSucceededApi() =>
      statusCode == null ? false : statusCode! >= 200 && statusCode! < 300;

  bool isOperationFailedApi() =>
      statusCode == null
          ? false
          : statusCode! > 300 || statusCode! < 200 || data == null;

  bool isOperationFailedWith401() =>
      statusCode == null ? false : statusCode! == 401;
}

extension NonNullStringData on String {
  DateTime toDateTime() => DateTime.tryParse(this) ?? DateTime.now();

  double toDoubleValue() {
    return double.tryParse(toString()) ?? 0.0;
  }

  //toiint
  int toIntValue() {
    return int.tryParse(toString()) ?? 0;
  }

  getLocale() {
    switch (this) {
      case AppConstants.englishLanguageCode:
        return AppConstants.englishLocal;
      case AppConstants.arabicLanguageCode:
        return AppConstants.arabicLocal;
      default:
        return AppConstants.defaultLocal;
    }
  }

  String getNamedLocation() {
    if (startsWith('/') && length > 1) {
      return substring(1);
    } else if (this == '/') {
      return 'splash';
    }
    return this;
  }

  int toIntger() {
    return int.tryParse(this) ?? 0;
  }

  String concantanate({required String value}) => '$this $value';

  String toPhoneInputStlyle() {
    if (length == 10 && startsWith('09')) {
      return substring(1);
    } else if (length == 13 && startsWith('+966')) {
      return substring(4);
    }
    if (length == 12 && startsWith('+966')) {
      return substring(3);
    }
    return this;
  }

  String toPhoneStyle() {
    if (length == 9 && startsWith('9')) {
      return '+966$this';
    } else if (startsWith('+966')) {
      return this;
    } else if (length == 10 && startsWith('09')) {
      return '+966$this';
    } else if (length == 12 && startsWith('966')) {
      return '+$this';
    } else if (length == 13 && startsWith('+966')) {
      return this;
    }
    return this;
  }

  String toHidePhoneNumber() {
    if (length > 6) {
      return replaceRange(0, 7, "****");
    }
    return "**********";
  }
}

extension NonNullString on String {
  String orEmptyString({
    String defaultValue = AppConstants.defaultEmptyString,
  }) => (this == null) ? defaultValue : this;

  DateTime toDateTime() {
    return DateTime.tryParse(orEmptyString()) ?? DateTime.now();
  }

  double toDoubleValue() {
    return double.tryParse(orEmptyString()) ?? 0.0;
  }

  int toIntValue() {
    return int.tryParse(orEmptyString()) ?? 0;
  }

  Widget toAssetLottie({
    double height = AppSize.appSize200,
    BoxFit fit = BoxFit.cover,
    Alignment alignment = Alignment.center,
    double width = AppSize.appSize200,
  }) => Lottie.asset(
    this,
    height: height,
    width: width,
    alignment: alignment,
    errorBuilder:
        (context, error, stackTrace) =>
            const Icon(Icons.error, color: ColorManager.whiteColor),
    fit: fit,
  );

  Widget toEelevatedButton(
    BuildContext context,
    Function()? onPressed, {
    double height = AppSize.appSize45,
    double width = AppSize.appSize100,
    double radius = AppSize.appSize8,
    Color color = ColorManager.primaryColor,
    FontWeight? fontWeight = FontWeight.w600,
    double? fontSize = AppSize.appSize18,
    Color? colortext = ColorManager.blackColor,
    String? fontFamily,
    TextAlign? textAlign = TextAlign.start,
    bool? softWrap = true,
    TextOverflow overflow = TextOverflow.clip,
    int? maxLines,
    StrutStyle? strutStyle,
    TextWidthBasis? textWidthBasis = TextWidthBasis.parent,
    bool isLoading = false,
    Color loadingColor = ColorManager.whiteColor,
    Widget? icon,
  }) => ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      alignment: Alignment.center,
      disabledBackgroundColor: ColorManager.primaryColor.withAlpha(180),
      elevation: 0,
      padding: const EdgeInsets.all(AppSize.appSize4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
    child:
        isLoading
            ? DottedLoading(loadingColor: loadingColor)
            : toText(
              context,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: colortext,
              overflow: overflow,
              textAlign: textAlign,
              softWrap: softWrap,
              maxLines: maxLines,
              strutStyle: strutStyle,
              textWidthBasis: textWidthBasis,
            ),
  ).toSizedBox(width: width, height: height);

  Widget toEelevatedButtonWithBorder(
    BuildContext context,
    Function()? onPressed, {
    double height = AppSize.appSize45,
    double width = AppSize.appSize100,
    double raduis = AppSize.appSize4,
    Color color = ColorManager.primaryColor,
    Color borderColor = const Color(0xffD9D9D9),
    FontWeight? fontWeight = FontWeight.normal,
    double? fontSize = AppSize.appSize16,
    Color? colortext = ColorManager.blackColor,
    String? fontFamily,
    TextAlign? textAlign = TextAlign.start,
    bool? softWrap = true,
    TextOverflow overflow = TextOverflow.clip,
    int? maxLines,
    StrutStyle? strutStyle,
    TextWidthBasis? textWidthBasis = TextWidthBasis.parent,
  }) => ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      alignment: Alignment.center,
      elevation: 0,
      padding: const EdgeInsets.all(AppSize.appSize4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(raduis),
        side: BorderSide(color: borderColor, width: AppSize.appSize1),
      ),
    ),
    child: toText(
      context,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: colortext,
      overflow: overflow,
      textAlign: textAlign,
      softWrap: softWrap,
      maxLines: maxLines,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
    ),
  ).toSizedBox(width: width, height: height);

  Widget toSvgAssetImage({
    double height = AppSize.appSize200,
    BoxFit fit = BoxFit.contain,
    bool fromLogin = false,
    Alignment alignment = Alignment.center,
    double width = AppSize.appSize200,
    Color color = ColorManager.primaryColor,
  }) => SvgPicture.asset(
    this,
    height: height,
    width: width,
    alignment: alignment,
    matchTextDirection: fromLogin ? false : true,
    fit: fit,
    theme: const SvgTheme(currentColor: ColorManager.backgroundColor),
  );

  Widget toSvgAssetImageWithoutColor({
    double height = AppSize.appSize200,
    BoxFit fit = BoxFit.contain,
    bool fromLogin = false,
    Alignment alignment = Alignment.center,
    double width = AppSize.appSize200,
  }) => SvgPicture.asset(
    this,
    height: height,
    width: width,
    alignment: alignment,
    matchTextDirection: fromLogin ? false : true,
    fit: fit,
    theme: const SvgTheme(currentColor: ColorManager.backgroundColor),
  );

  Widget toAssetImage({
    double height = AppSize.appSize200,
    BoxFit fit = BoxFit.contain,
    Color color = ColorManager.whiteColor,
    Alignment alignment = Alignment.center,
    double width = AppSize.appSize200,
  }) => Image.asset(
    this,
    height: height,
    width: width,
    alignment: alignment,
    color: color,
    fit: fit,
  );

  Widget toAssetImageWithoutColor({
    double height = AppSize.appSize200,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    double width = AppSize.appSize200,
  }) => Image.asset(
    this,
    height: height,
    width: width,
    alignment: alignment,
    fit: fit,
  );

  Widget toNetWorkImage({
    double height = AppSize.appSize200,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    double width = AppSize.appSize200,
  }) => NetWorkImageCashed(url: this).toSizedBox(height: height, width: width);

  //circle image with network image
  Widget toCircleNetWorkImage({
    double height = 60,
    double width = 60,
    BoxFit fit = BoxFit.cover,
    Alignment alignment = Alignment.center,
    double radius = 30,
    Widget? placeholder,
    Widget? errorWidget,
  }) => CircleAvatar(
    radius: radius,
    backgroundColor: ColorManager.whiteColor,
    child: NetWorkImageCashed(
      url: this,
      height: height,
      width: width,
      placeholder: placeholder,
      errorWidget: errorWidget,
    ),
  );

  Text toText(
    BuildContext context, {
    FontWeight? fontWeight = FontWeight.normal,
    double? fontSize = AppSize.appSize16,
    Color? color = ColorManager.blackColor,
    String? fontFamily,
    TextAlign? textAlign = TextAlign.start,
    bool? softWrap = true,
    TextDecoration decoration = TextDecoration.none,
    TextOverflow overflow = TextOverflow.clip,
    int? maxLines,
    StrutStyle? strutStyle,
    double? lineHeight,
    TextWidthBasis? textWidthBasis = TextWidthBasis.parent,
    TextHeightBehavior? textHeightBehavior,
    TextDirection? textDirection,
    Color? decorationColor = ColorManager.transparentColor,
    TextDecorationStyle? decorationStyle = TextDecorationStyle.solid,
  }) {
    return Text(
      this ?? AppConstants.defaultEmptyString,
      style: TextStyle(
        letterSpacing: 0.4,
        fontFamily: "Cabin",
        decoration: decoration,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        height: lineHeight,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      overflow: overflow,
      textDirection: textDirection,
      textAlign: textAlign,
      softWrap: softWrap,
      maxLines: maxLines,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }

  String get toBearerTokenStyle => 'Bearer $this';

  double convertToDouble({
    double defaultValue = AppConstants.defaultEmptyDouble,
  }) => double.tryParse(this) ?? defaultValue;
  int convertToInteger({int defaultValue = AppConstants.defaultEmptyInteger}) =>
      int.tryParse(this) ?? defaultValue;

  Locale toLocale() {
    switch (this) {
      case AppConstants.englishLanguageCode:
        return AppConstants.englishLocal;
      case AppConstants.arabicLanguageCode:
        return AppConstants.arabicLocal;
      default:
        return AppConstants.defaultLocal;
    }
  }

  ThemeMode toThemeMode() {
    switch (this) {
      case AppConstants.lightTheme:
        return ThemeMode.light;
      case AppConstants.darkTheme:
        return ThemeMode.dark;
      case AppConstants.systemTheme:
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }
}

extension NonNullInteger on int? {
  int orZeroInteger({int defaultValue = AppConstants.defaultEmptyInteger}) =>
      (this == null) ? defaultValue : this ?? defaultValue;

  bool operationSucceeded() => this! >= 200 && this! < 300;

  bool operationFailed() => (this! > 300 || this! < 200);
}

extension NonNullMap on Map? {
  Map orEmptyMap({Map defaultValue = AppConstants.defaultEmptyMap}) =>
      (this == null) ? defaultValue : this ?? defaultValue;
}

extension NonNullList<T> on List? {
  List orEmptyList({
    List defaultValue = AppConstants.defaultEmptyGenericList,
  }) => (this == null) ? defaultValue : this ?? defaultValue;
}

extension NonNullDouble on double? {
  double orZeroDouble({
    double defaultValue = AppConstants.defaultEmptyDouble,
  }) => (this == null) ? defaultValue : this ?? defaultValue;

  double doubleTwoDigit({
    double defaultValue = AppConstants.defaultEmptyDoubleWithTwoDigit,
  }) => (this == null) ? defaultValue : double.parse(this!.toStringAsFixed(2));
}

extension NonNullBool on bool? {
  bool orBoolDefaultFalseValue({
    bool defaultValue = AppConstants.defaultEmptyBoolFalse,
  }) => (this == null) ? defaultValue : this ?? defaultValue;

  bool orBoolDefaultTrueValue({
    bool defaultValue = AppConstants.defaultEmptyBoolTrue,
  }) => (this == null) ? defaultValue : this ?? defaultValue;
}

extension NonNullBoolData on Future<bool> {}

extension SizedBoxValuesHeightOrWidth on num {
  SizedBox get heightSizedBox => SizedBox(height: toDouble());

  SizedBox get widthSizedBox => SizedBox(width: toDouble());

  String toDoubleNumber(int digit) => toStringAsFixed(digit);

  int get toIntegerNumber => toInt();

  // 6.1 => 7

  int get toIntegerNumberCeil => ceil();

  double get toDoubleNumberCeil => ceilToDouble();
}

// extension NPhoneNumber on PhoneNumber {
//   bool isValidPhoneNumber() {
//     try {
//       return isValidNumber();
//     } catch (e) {
//       return false;
//     }
//   }
// }
