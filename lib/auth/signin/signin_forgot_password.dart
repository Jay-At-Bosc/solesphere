import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/auth/signin/signin_controller.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/labels.dart';
import '../../utils/constants/sizes.dart';
import '../../widgets/custom_label.dart';

class SignInForgotPassword extends GetView<SignInController> {
  const SignInForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: !controller.isMainLoading ? controller.forgotPassword : null,
          child: CustomLabelText(
            labelText: SLabels.forgotPassword,
            labelStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: SColors.textPrimaryWith60,
                  fontSize: SSizes.fontSizeSm,
                ),
          ),
        ),
      ],
    );
  }
}
