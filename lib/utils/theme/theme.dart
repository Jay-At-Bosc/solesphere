import 'package:flutter/material.dart';


import '../constants/colors.dart';
<<<<<<< HEAD
import 'widget_themes/elevated_button_theme.dart';
=======
import 'widget_themes/appbar_theme.dart';
>>>>>>> c87f241e056c228e76a1731abd1b9cff5f0e564f
import 'widget_themes/text_theme.dart';

class SAppTheme {
  SAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'AirbnbCereal',
    scaffoldBackgroundColor: SColors.lightBackground,
    // disabledColor: TColors.grey,
    // brightness: Brightness.light,
    // primaryColor: TColors.primary,
    textTheme: STextTheme.lightTextTheme,
    // chipTheme: TChipTheme.lightChipTheme,
    // scaffoldBackgroundColor: TColors.white,
    appBarTheme: SAppBarTheme.lightAppBarTheme,
    // checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    // bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
    // outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    // inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'AirbnbCereal',
    scaffoldBackgroundColor: SColors.darkBackground,
    // disabledColor: TColors.grey,
    // brightness: Brightness.dark,
    // primaryColor: TColors.primary,
    textTheme: STextTheme.darkTextTheme,
    // chipTheme: TChipTheme.darkChipTheme,
    // scaffoldBackgroundColor: TColors.black,
    appBarTheme: SAppBarTheme.darkAppBarTheme,
    // checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    // bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
    // outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    // inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
