import 'package:flutter/material.dart';
import 'package:fnotes/utils/themes/widgets_themes/text_formfield_theme.dart';
import 'package:fnotes/utils/themes/widgets_themes/text_themes.dart';
class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme);
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TTextTheme.darkTextTheme,
      inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme);
}
