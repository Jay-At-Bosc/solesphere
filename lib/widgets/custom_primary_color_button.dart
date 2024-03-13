
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/icons.dart';
import '../utils/theme/widget_themes/elevated_button_theme.dart';
import 'custom_label.dart';

class CustomPrimaryColorButton extends StatelessWidget {
  const CustomPrimaryColorButton({
    super.key,
    required this.buttonLabel,
    this.onPressed,
  });

  final String buttonLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: SElevatedButtonTheme.elevatedButtonStyle.copyWith(
              backgroundColor:
                  const MaterialStatePropertyAll(SColors.primary),
              foregroundColor:
                  MaterialStatePropertyAll(SColors.textPrimaryWith80)),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                SIcons.googleIcon,
                height: 24,
                width: 24,
              ),
              SizedBox(
                width: 2.0.getWidth(),
              ),
              CustomLabelText(labelText: buttonLabel),
            ],
          ),
    );
  }
}
