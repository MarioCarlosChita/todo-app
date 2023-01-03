import 'package:flutter/material.dart';
import 'package:solid_principles/src/core/utils/constants.dart';

class ThemeDataUi {
  static ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: backgroundAppColor,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: floatingButtonColor));
}
