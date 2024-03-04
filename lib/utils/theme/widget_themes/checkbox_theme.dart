import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';


/// Custom Class for Light & Dark Text Themes
class SCheckboxTheme {
  SCheckboxTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.xs)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return SColors.primary;
      } else {
        return SColors.secondary;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return SColors.accent;
      } else {
        return Colors.transparent;
      }
    }),
  );

  /// Customizable Dark Text Theme
  // static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
  //   shape:
  //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.xs)),
  //   checkColor: MaterialStateProperty.resolveWith((states) {
  //     if (states.contains(MaterialState.selected)) {
  //       return TColors.white;
  //     } else {
  //       return TColors.black;
  //     }
  //   }),
  //   fillColor: MaterialStateProperty.resolveWith((states) {
  //     if (states.contains(MaterialState.selected)) {
  //       return TColors.primary;
  //     } else {
  //       return Colors.transparent;
  //     }
  //   }),
  // );
}
