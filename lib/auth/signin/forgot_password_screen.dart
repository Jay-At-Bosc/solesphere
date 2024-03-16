import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/auth/signin/signin_controller.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../utils/constants/labels.dart';
import '../../utils/validators/validations.dart';
import '../../widgets/custom_accent_color_button.dart';
import '../../widgets/custom_label.dart';
import '../../widgets/custom_simple_input.dart';

class ForgotPasswordScreen extends GetView<SignInController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forgot Password",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 15.0.getHeight(),
          left: 5.0.getWidth(),
          right: 5.0.getWidth(),
        ),
        child: Column(
          children: [
            GetBuilder<SignInController>(
              id: controller.signInForm,
              builder: (_) {
                return Form(
                  key: controller.forgetPasswordFormKey,
                  child: Column(
                    children: [
                      /// Email label & input Field
                      CustomLabelText(
                        labelText: SLabels.email,
                        labelStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      CustomSimpleInput(
                        controller: controller.email,
                        hintText: SLabels.email,
                        enable: !controller.isMainLoading,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => SValidator.validateEmail(value),
                        maxLength: 1,
                      ),
                      SizedBox(
                        height: 1.5.getHeight(),
                      ),

                      GetBuilder<SignInController>(
                        id: controller.signinButtonId,
                        builder: (controller) {
                          return CustomAccentColorButton(
                            buttonLabel: "Send a link",
                            isLoading: controller.isMainLoading,
                            onPressed: () async {
                              await controller.forgotPassword();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
