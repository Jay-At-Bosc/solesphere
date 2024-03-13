import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signin_controller.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/labels.dart';
import '../../utils/constants/sizes.dart';
import '../../widgets/custom_label.dart';

class SignInToHomeScreen extends GetView<SignInController> {
  const SignInToHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: controller.skipSignIn,
          child: CustomLabelText(
            labelText: SLabels.skip,
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
