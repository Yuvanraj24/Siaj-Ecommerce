import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/utils/theme/custom_themes/appbar_theme.dart';
import 'package:siaj_ecommerce/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:siaj_ecommerce/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:siaj_ecommerce/utils/theme/custom_themes/chip_theme.dart';
import 'package:siaj_ecommerce/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:siaj_ecommerce/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:siaj_ecommerce/utils/theme/custom_themes/text_field_theme.dart';
import 'package:siaj_ecommerce/utils/theme/custom_themes/text_theme.dart';

class SiajAppTheme {
  SiajAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: SiajAppbarTheme.lightAppBarTheme,
    bottomSheetTheme: SiajBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: SiajCheckboxTheme.lightCheckboxTheme,
    chipTheme: SiajChipTheme.lightChipTheme,

    elevatedButtonTheme: SiajElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: SiajOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: SiajTextFormFieldTheme.lightInputDecorationTheme,
    textTheme: SiajTextTheme.lightTextTheme,

  );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
    appBarTheme: SiajAppbarTheme.darkAppBarTheme,
    bottomSheetTheme: SiajBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: SiajCheckboxTheme.darkCheckboxTheme,
    chipTheme: SiajChipTheme.darkChipTheme,

    elevatedButtonTheme: SiajElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: SiajOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: SiajTextFormFieldTheme.darkInputDecorationTheme,
    textTheme: SiajTextTheme.darkTextTheme,
  );
}

