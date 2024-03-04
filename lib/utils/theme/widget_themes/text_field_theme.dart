import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import 'text_theme.dart';


class STextFormFieldTheme {
  STextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    alignLabelWithHint: true,
    contentPadding: const EdgeInsets.all(SSizes.lg),
    iconColor: SColors.primaryIcon,
    filled: true,
    fillColor: SColors.primary,
    prefixIconColor: SColors.primaryIcon,
    suffixIconColor: SColors.primaryIcon,
    labelStyle: STextTheme.lightTextTheme.labelLarge,
    hintStyle: STextTheme.lightTextTheme.labelMedium ,
    errorStyle: STextTheme.lightTextTheme.labelSmall,
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
      borderSide: const BorderSide(width: SSizes.borderWidth, color: SColors.error),
    ),
  );

  // static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  //   errorMaxLines: 2,
  //   prefixIconColor: SColors.darkGrey,
  //   suffixIconColor: SColors.darkGrey,
  //   // constraints: const BoxConstraints.expand(height: SSizes.inputFieldHeight),
  //   labelStyle: const TextStyle()
  //       .copyWith(fontSize: SSizes.fontSizeMd, color: SColors.white),
  //   hintStyle: const TextStyle()
  //       .copyWith(fontSize: SSizes.fontSizeSm, color: SColors.white),
  //   floatingLabelStyle:
  //       const TextStyle().copyWith(color: SColors.white.withOpacity(0.8)),
  //   border: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
  //     borderSide: const BorderSide(width: 1, color: SColors.darkGrey),
  //   ),
  //   enabledBorder: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
  //     borderSide: const BorderSide(width: 1, color: SColors.darkGrey),
  //   ),
  //   focusedBorder: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
  //     borderSide: const BorderSide(width: 1, color: SColors.white),
  //   ),
  //   errorBorder: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
  //     borderSide: const BorderSide(width: 1, color: SColors.warning),
  //   ),
  //   focusedErrorBorder: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
  //     borderSide: const BorderSide(width: 2, color: SColors.warning),
  //   ),
  // );
}
