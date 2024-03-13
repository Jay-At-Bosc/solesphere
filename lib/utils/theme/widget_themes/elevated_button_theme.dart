import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import 'text_theme.dart';

class SElevatedButtonTheme {
  SElevatedButtonTheme._();


    static final elevatedButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SSizes.buttonRadius),
      ),
    ),
    backgroundColor: MaterialStateProperty.all(SColors.accent),
    elevation: MaterialStateProperty.all(SSizes.buttonElevation),
    foregroundColor: MaterialStateProperty.all(SColors.primary),
    textStyle: MaterialStateProperty.all(STextTheme.lightTextTheme.titleLarge),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: SSizes.buttonPadding,
        horizontal: SSizes.buttonPadding * 2,
      ),
    ),
);




  // Light Theme
  // static final lightElevatedButtonTheme = ElevatedButtonThemeData(
  //     style: ButtonStyle(
  //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(SSizes.buttonRadius))),
  //         backgroundColor: const MaterialStatePropertyAll(SColors.accent),
  //         elevation: const MaterialStatePropertyAll(SSizes.buttonElevation),
  //         foregroundColor: const MaterialStatePropertyAll(SColors.primary),
  //         textStyle:
  //             MaterialStatePropertyAll(STextTheme.lightTextTheme.titleLarge),
  //         padding: const MaterialStatePropertyAll(
  //           EdgeInsets.symmetric(
  //               vertical: SSizes.buttonPadding,
  //               horizontal: SSizes.buttonPadding * 2),
  //         ))

      // ElevatedButton.styleFrom(

      //   disabledForegroundColor: SColors.secondary,
      //   disabledBackgroundColor: SColors.buttonDisabled,

      //   shape: ,
      // ),
      // );

  // Dark Theme
  // static final darkElevatedButtonTheme = ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     elevation: SSizes.buttonElevation,
  //     foregroundColor: SColors.primary,
  //     backgroundColor: SColors.accent,
  //     disabledForegroundColor: SColors.secondary,
  //     disabledBackgroundColor: SColors.buttonDisabled,
  //     padding: const EdgeInsets.symmetric(
  //         vertical: SSizes.buttonPadding, horizontal: SSizes.buttonPadding * 2),
  //     textStyle: STextTheme.darkTextTheme.titleLarge,
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(SSizes.buttonRadius)),
  //   ),
  // );
}
