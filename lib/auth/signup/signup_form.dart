import 'package:solesphere/auth/auth_exports.dart';

import 'package:solesphere/utils/constants/labels.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';
import 'package:solesphere/widgets/custom_label.dart';
import 'package:solesphere/widgets/custom_simple_input.dart';

import '../../widgets/custom_password_input.dart';
import 'signup_controller.dart';

class SignUpForm extends GetView<SignUpController> {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// UserName label & input Field
          CustomLabelText(
            labelText: SLabels.username,
            labelStyle: Theme.of(context).textTheme.labelLarge,
          ),
          CustomSimpleInput(
            controller: controller.username,
            node: controller.userNode,
            hintText: SLabels.username,
            keyboardType: TextInputType.text,
            maxLength: 1,
          ),
          SizedBox(
            height: 1.5.getHeight(),
          ),

          /// Email label & input Field
          CustomLabelText(
            labelText: SLabels.email,
            labelStyle: Theme.of(context).textTheme.labelLarge,
          ),
          CustomSimpleInput(
            controller: controller.email,
            node: controller.emailNode,
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
          GetBuilder<SignUpController>(
              id: controller.passwordId,
              builder: (controller) {
                return CustomPasswordInput(
                  controller: controller.password,
                  node: controller.passwordNode,
                  hintText: SLabels.password,
                  keyboardType: TextInputType.text,
                  isObsecure: controller.ispasswordVisible,
                  onIconTap: controller.togglePasswordVisibility,
                );
              }),
          SizedBox(
            height: 1.5.getHeight(),
          ),

          /// Confirm Password label & input Field
          CustomLabelText(
            labelText: SLabels.confirmPassword,
            labelStyle: Theme.of(context).textTheme.labelLarge,
          ),
          GetBuilder<SignUpController>(
              id: controller.confirmpasswordId,
              builder: (controller) {
                return CustomPasswordInput(
                  controller: controller.confirmPassword,
                  node: controller.confirmPasswordNode,
                  hintText: SLabels.confirmPassword,
                  keyboardType: TextInputType.text,
                  isObsecure: controller.isconfirmpasswordVisible,
                  onIconTap: controller.toggleConfirmPasswordVisibility,
                );
              }),
        ],
      ),
    );
  }
}
