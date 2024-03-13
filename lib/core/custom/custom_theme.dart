import 'package:demo/core/constant/z_file_constant.dart';
import 'package:flutter/material.dart';


class CustomTheme {
  static const MaterialColor primarySwatchColor = MaterialColor(
    0xFF009688,
    <int, Color>{
      50: Color(0xFFE0F2F1),
      100: Color(0xFFB2DFDB),
      200: Color(0xFF80CBC4),
      300: Color(0xFF4DB6AC),
      400: Color(0xFF26A69A),
      500: Color(0xFF009688),
      600: Color(0xFF00897B),
      700: Color(0xFF00796B),
      800: Color(0xFF00695C),
      900: Color(0xFF004D40),
    },
  );

  static final _appThemesData = {
    APP_THEMES.PURPLETHEME: ThemeData(
      useMaterial3: false,
      dialogBackgroundColor: Colors.white,
      primaryColor: AppColors.appTheme,
      primaryColorDark: AppColors.appTheme,
      hintColor: AppColors.appTheme,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatchColor)
          .copyWith(background: Colors.white),
    ),
  };

  static final selectedTheme = _appThemesData[APP_THEMES.PURPLETHEME];
}

enum APP_THEMES { PURPLETHEME }