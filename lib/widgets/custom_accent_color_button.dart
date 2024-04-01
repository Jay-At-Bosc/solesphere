import 'package:flutter/material.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../utils/theme/widget_themes/elevated_button_theme.dart';
import 'custom_label.dart';

class CustomAccentColorButton extends StatelessWidget {
  const CustomAccentColorButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
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
              height: 21,
              width: 21,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ))
          : CustomLabelText(
              labelText: buttonLabel,
              labelStyle: TextStyle(fontSize: 4.5.getWidth()),
            ),
    );
  }
}
