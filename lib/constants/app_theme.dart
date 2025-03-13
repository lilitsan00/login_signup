import 'package:flutter/material.dart';
import 'package:login_signup/constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColorScheme.background.light,
    brightness: Brightness.light,
    fontFamily: 'TTNormsPro',
    scaffoldBackgroundColor: AppColorScheme.background.light,
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColorScheme.background.dark,
    brightness: Brightness.dark,
    fontFamily: 'TTNormsPro',
    scaffoldBackgroundColor: AppColorScheme.background.dark,
  );
}
