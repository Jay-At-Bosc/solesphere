import 'package:flutter/material.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../utils/constants/labels.dart';

import '../../widgets/custom_label.dart';

class SignUpGreetings extends StatelessWidget {
  const SignUpGreetings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomLabelText(
            labelText: SLabels.signUpTitle,
            labelStyle: Theme.of(context).textTheme.headlineLarge),
        SizedBox(
          height: 1.0.getHeight(),
        ),
        CustomLabelText(
          labelText: SLabels.signUpSubTitle,
          labelStyle: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
