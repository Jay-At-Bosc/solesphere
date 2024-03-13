import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/auth/signin/signin_controller.dart';
import 'package:solesphere/utils/constants/labels.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';
import 'package:solesphere/widgets/custom_label.dart';
import 'package:solesphere/widgets/custom_simple_input.dart';

import '../../widgets/custom_password_input.dart';


class SignInForm extends GetView<SignInController> {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Email label & input Field
          CustomLabelText(
            labelText: SLabels.email,
            labelStyle: Theme.of(context).textTheme.labelLarge,
          ),
          CustomSimpleInput(
            controller: controller.email,
           
            hintText: SLabels.email,
            keyboardType: TextInputType.emailAddress,
            maxLength: 1,
          ),
          SizedBox(
            height: 1.5.getHeight(),
          ),

          /// Password label & input Field
          CustomLabelText(
            labelText: SLabels.password,
            labelStyle: Theme.of(context).textTheme.labelLarge,
          ),
          GetBuilder<SignInController>(
            id: controller.passwordId,
            builder: (controller) {
              return CustomPasswordInput(
                controller: controller.password,
                
                hintText: SLabels.password,
                keyboardType: TextInputType.text,
                  isObsecure: controller.passwordVisible,
                    onIconTap: controller.togglePasswordVisibility,
              );
            }
          ),
         
        ],
      ),
    );
  }
}
