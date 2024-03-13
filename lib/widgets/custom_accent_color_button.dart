import 'package:flutter/material.dart';

import '../utils/theme/widget_themes/elevated_button_theme.dart';
import 'custom_label.dart';

class CustomAccentColorButton extends StatelessWidget {
  const CustomAccentColorButton({
    super.key,
    required this.buttonLabel,
    this.onPressed,
    required this.isLoading,
  });

  final String buttonLabel;
  final bool isLoading;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isLoading ? onPressed : null,
      style: SElevatedButtonTheme.elevatedButtonStyle,
      child: isLoading
          ? const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 1.8,
              ),
            )
          : CustomLabelText(labelText: buttonLabel),
    );
  }
}
