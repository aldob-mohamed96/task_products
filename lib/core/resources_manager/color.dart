import 'package:flutter/material.dart';

class ColorManager {
  static final ColorManager _instance = ColorManager._internal();

  factory ColorManager() {
    return _instance;
  }

  ColorManager._internal();

  static const Color primaryColor = Color(0xFF31427B);
  static const Color secondaryColor = Color(0xFF77B7B);
  static const Color secondColor = Color.fromARGB(255, 255, 255, 255);
  static Color primaryColorDark = const Color.fromARGB(255, 2, 2, 2);

  static const Color focusColor = Color(0xFFF6F4F4);
  static const Color fillcolor = Color(0xFF2D4568);
  static const Color secondColorApp = Color(0xFFff914d);

  static const Color hintGrayColor = Color(0xFFC3C3C3);
  static const Color greyBackgroundColor = Color(0xffF8F8F8);
  static const Color focusColorDark = Color(0xFFF6F1F1);
  static const Color subtitleColor = Color(0xFF979797);
  static const Color textBlack = Color(0xFF2C2C2C);
  static const Color greyColor = Color(0xFFF6F6F6);
  static const Color newGreyColor = Color(0xFFE8E8E8);
  static const Color drwaerIconsTextColor = Color(0xFFA3A3A3);
  static const Color borderColor = Color(0xFFD7D5D7);
  static const Color forgetPasswordBackgroundButtonColor = Color(0xFFF3F3F3);

  static const Color circleColorIndicator = Color(0xFFD9D9D9);

  static const Color hintColor = Color.fromARGB(255, 184, 181, 181);
  static const Color hintColorDark = Color.fromARGB(255, 254, 255, 254);

  static const Color pendingColor = Color.fromARGB(255, 150, 149, 138);
  static const Color dividerColorDark = Color(0xFFD6D6D6);

  static const Color descriptionColor = Color(0xFF292929);

  static const Color lightThemeColor = Color(0xffffffff);
  static const Color darkThemeColor = Color(0xFF000000);
  static const Color backgroundColor = Color(0xfff1efef);
  static const Color borderInputColor = Color(0xffCCCCCC);
  static const Color lableInputColor = Color(0xff2C2C2C);
  static const Color hintInputColor = Color(0xff797979);
  static const Color dateColor = Color(0xff6C6C6C);
  static const Color semiGreyColor = Color(0xff7D7D7D);
  static const Color lightGreyColor = Color(0xffE3E3E3);
  static const Color darkGreyColor = Color(0xffE8E8E8);
  static const Color transparentColor = Colors.transparent;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Color(0xFF1D1B1C);
  static const Color semiBlackColor = Color(0xFF2E2E2E);
  static const Color darkBlackColor = Color(0xFF1D1B1C);
  static const Color darkerBlackColor = Color(0xFF242424);
  static const Color semiGrayBlackColor = Color(0xFF676767);
  static const Color inputTextColor = Color.fromARGB(255, 34, 32, 32);
  static const Color redColor = Color(0xFF641027);
  static const Color errorColor = Color(0xFF641027);

  static Color mainColor = Color(0xffF2F1F6);
  static const Color accentColor = Color(0xffE62E04);
  static const Color accentColorShadow = Color.fromRGBO(
    229,
    65,
    28,
    .40,
  ); // this color is a dropshadow of
  static Color softAccentColor = Color.fromRGBO(254, 234, 209, 1);
  static Color splash_screen_color = Color.fromRGBO(
    230,
    46,
    4,
    1,
  ); // if not sure , use the same color as accent color
  /*configurable colors ends*/
  /*If you are not a developer, do not change the bottom colors*/
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static Color noColor = Color.fromRGBO(255, 255, 255, 0);
  static Color cardBackgroundColor = Color.fromRGBO(242, 242, 244, 1);
  static Color light_grey = Color.fromRGBO(239, 239, 239, 1);
  static Color darkGrey = Color.fromRGBO(107, 115, 119, 1);
  static Color mediumgrey = Color.fromRGBO(167, 175, 179, 1);
  static Color blue_grey = Color.fromRGBO(168, 175, 179, 1);
  static Color mediumGrey50 = Color.fromRGBO(167, 175, 179, .5);
  static const Color grey153 = Color.fromRGBO(153, 153, 153, 1);
  static Color darkFontGrey = Color.fromRGBO(62, 68, 71, 1);
  static const Color fontGrey = Color.fromRGBO(107, 115, 119, 1);
  static const Color textfield_grey = Color.fromRGBO(209, 209, 209, 1);
  static const Color fontGreyLight = Color(0xff6B7377);
  static Color golden = Color.fromRGBO(255, 168, 0, 1);
  static Color amber = Color.fromRGBO(254, 234, 209, 1);
  static Color amber_medium = Color.fromRGBO(254, 240, 215, 1);
  static Color goldenShadow = Color.fromRGBO(255, 168, 0, .4);
  static Color green = Colors.green;
  static Color? green_light = Colors.green[200];
  static Color shimmer_base = Colors.grey.shade50;
  static Color shimmer_highlighted = Colors.grey.shade200;

  static const Color backgroundColorCircularLoading = Colors.black26;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
