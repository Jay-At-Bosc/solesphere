import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/constants/labels.dart';
import '../../utils/extensions/responsive_extension.dart';
import '../../widgets/custom_accent_color_button.dart';
import '../../widgets/custom_primary_color_button.dart';
import '../auth_exports.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0.getWidth()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
              width: double.maxFinite,
              child: CustomAccentColorButton(buttonLabel: SLabels.signIn)),
          SizedBox(
            height: 1.5.getHeight(),
          ),
          const CustomPrimaryColorButton(buttonLabel: SLabels.signInWithGooogle)
        ],
      ),
    );
  }
}
