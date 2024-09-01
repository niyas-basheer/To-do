import 'package:flutter/material.dart';
import 'package:to_do/utils/theme/appbar_theme.dart';
import 'package:to_do/utils/theme/bottom_sheet_theme.dart';
import 'package:to_do/utils/theme/checkbox_theme.dart';
import 'package:to_do/utils/theme/chip_theme.dart';
import 'package:to_do/utils/theme/elevated_button_theme.dart';
import 'package:to_do/utils/theme/outlined_button_theme.dart';
import 'package:to_do/utils/theme/text_filed_theme.dart';
import 'package:to_do/utils/theme/text_theme.dart';


class TAppTheme{
  TAppTheme._();

 // Light Theme
static ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  textTheme: TTextTheme.lightTextTheme,
  chipTheme: TChipTheme.lightChipTheme,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: TAppBarTheme.lightAppBarTheme,
  checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
  bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
  elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
  outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
  inputDecorationTheme: TTextFormFiledTheme.lightInputDecorationTheme,
);

// Dark Theme
static ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  textTheme: TTextTheme.darkTextTheme,
  chipTheme: TChipTheme.darkChipTheme,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: TAppBarTheme.darkAppBarTheme,
  checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
  bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
  elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
  outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
  inputDecorationTheme: TTextFormFiledTheme.darkInputDecorationTheme,
);

}

