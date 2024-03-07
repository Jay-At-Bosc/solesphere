import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class SAppBarTheme {
  SAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: SColors.textSecondary, size: SSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: SColors.textSecondary, size: SSizes.iconMd),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: SColors.textSecondary, size: SSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: SColors.textSecondary, size: SSizes.iconMd),
  );
}
