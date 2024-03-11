import 'package:flutter/material.dart';
import 'package:solesphere/widgets/custom_label.dart';

import '../../utils/constants/labels.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          // style: Theme.of(context).buttonTheme.copyWith(),
          child: const CustomLabelText(labelText: SLabels.register),
        ),
      ],
    );
  }
}
