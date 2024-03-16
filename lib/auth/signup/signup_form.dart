import 'package:solesphere/auth/auth_exports.dart';

import 'package:solesphere/utils/constants/labels.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';
import 'package:solesphere/utils/validators/validations.dart';
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
            enable: !controller.isMainLoading(),
            hintText: SLabels.username,
            keyboardType: TextInputType.text,
            validator: (value) => SValidator.validateUsername(value),
            maxLength: 1,
          ),
          SizedBox(
            height: 1.0.getHeight(),
          ),

          /// Email label & input Field
          CustomLabelText(
            labelText: SLabels.email,
            labelStyle: Theme.of(context).textTheme.labelLarge,
          ),
          CustomSimpleInput(
            controller: controller.email,
            hintText: SLabels.email,
            enable: !controller.isMainLoading(),
            keyboardType: TextInputType.emailAddress,
            validator: (value) => SValidator.validateEmail(value),
            maxLength: 1,
          ),
          SizedBox(
            height: 1.0.getHeight(),
          ),

          /// Password label & input Field
          CustomLabelText(
            labelText: SLabels.password,
            labelStyle: Theme.of(context).textTheme.labelLarge,
          ),
          GetBuilder<SignUpController>(
              id: SignUpController.passwordId,
              builder: (controller) {
                return CustomPasswordInput(
                  controller: controller.password,
                  hintText: SLabels.password,
                  enable: !controller.isMainLoading(),
                  keyboardType: TextInputType.text,
                  validator: (value) => SValidator.validatePassword(value),
                  isObsecure: controller.ispasswordVisible,
                  onIconTap: controller.togglePasswordVisibility,
                );
              }),
          SizedBox(
            height: 1.0.getHeight(),
          ),

          /// Confirm Password label & input Field
          CustomLabelText(
            labelText: SLabels.confirmPassword,
            labelStyle: Theme.of(context).textTheme.labelLarge,
          ),
          GetBuilder<SignUpController>(
              id: SignUpController.confirmpasswordId,
              builder: (controller) {
                return CustomPasswordInput(
                  controller: controller.confirmPassword,
                  hintText: SLabels.confirmPassword,
                  enable: !controller.isMainLoading(),
                  keyboardType: TextInputType.text,
                  validator: (value) => SValidator.validatePassword(value),
                  isObsecure: controller.isconfirmpasswordVisible,
                  onIconTap: controller.toggleConfirmPasswordVisibility,
                );
              }),
        ],
      ),
    );
  }
}
