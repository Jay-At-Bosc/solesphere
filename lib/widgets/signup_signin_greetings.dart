import 'package:flutter/material.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../widgets/custom_label.dart';

class SignUpSignInGreetings extends StatelessWidget {
  const SignUpSignInGreetings({super.key, required this.titleText, required this.subTitleText});

  final String titleText;
  final String subTitleText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomLabelText(
            labelText: titleText,
            labelStyle: Theme.of(context).textTheme.headlineLarge),
        SizedBox(
          height: 1.0.getHeight(),
        ),
        CustomLabelText(
          labelText: subTitleText,
          labelStyle: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
