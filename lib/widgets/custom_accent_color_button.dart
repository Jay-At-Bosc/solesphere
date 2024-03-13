
import 'package:flutter/material.dart';

import '../utils/theme/widget_themes/elevated_button_theme.dart';
import 'custom_label.dart';

class CustomAccentColorButton extends StatelessWidget {
  const CustomAccentColorButton({
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
      style: SElevatedButtonTheme.elevatedButtonStyle,
      child: CustomLabelText(labelText: buttonLabel),
    );
  }
}
