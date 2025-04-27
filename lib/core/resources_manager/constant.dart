import 'package:flutter/material.dart';

import 'api_codes.dart';
import 'api_messages.dart';
import 'color.dart';
import 'strings.dart';

final class AppConstants {
  static final AppConstants _instance = AppConstants._internal();

  factory AppConstants() {
    return _instance;
  }

  AppConstants._internal();


  // base url 
  static const String baseUrl = 'https://dummyjson.com';
  // default value of primitive
  static const String defaultEmptyString = '';
  static const int defaultEmptyInteger = 0;
  static const double defaultEmptyDouble = 0;
  static const double defaultEmptyDoubleWithTwoDigit = 0;
  static const bool defaultEmptyBoolFalse = false;
  static const bool defaultEmptyBoolTrue = true;
  static const List<String> defaultEmptyListString = [];
  static const List defaultEmptyGenericList = [];
  static const Map defaultEmptyMap = {};
  //default core Setting theme ...
  static const String defaultThemeModeApp = 'light';
  static const String lightTheme = 'light';
  static const String darkTheme = 'dark';
  static const String systemTheme = 'system';
  static const ThemeMode defaultTheme = ThemeMode.light;
  static const ThemeMode theme = ThemeMode.light;

  //default core Setting language
  static const String defaultLanguageAppCode = 'ar';
  static const String arabicLanguageCode = 'ar';
  static const String englishLanguageCode = 'en';

  static const Locale englishLocal = Locale('en', '');

  static const Locale arabicLocal = Locale('ar', '');
  static const Locale defaultLocal = Locale('ar', '');
  static const Iterable<Locale> supportedLocales = [englishLocal, arabicLocal];

  //default core Setting version
  static const String appVersion = '1.0.0';
  static const String iosVersion = '1.0.0';
  static const bool forceUpdateVersion = true;
  static const String enableVersion = '1';
  static const String appName = AppStrings.appName;

  static const String assetImagesPath = 'assets/img';
  static const String assetJsonPath = 'assets/json';

  static const String assetTranslationPath = 'assets/translations';

  // ---------------------auth api extension urls---------------------
  static const List<String> apiWithoutToken = [apiLogin];

  // ---------------------auth api extension urls---------------------
  static const String apiLogin = 'login';
  static const String apiHome = '/home';
  static const String apiLogout = '/auth/logout';
}
