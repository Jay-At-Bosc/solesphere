
import 'package:solesphere/auth/signup/signup_controller.dart';

import '../../utils/constants/labels.dart';
import '../../utils/extensions/responsive_extension.dart';

import '../../widgets/custom_accent_color_button.dart';
import '../../widgets/custom_primary_color_button.dart';
import '../auth_exports.dart';

class SignUpButton extends GetView<SignUpController> {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0.getWidth()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: GetBuilder<SignUpController>(
                id: controller.registerButtonId,
                builder: (context) {
                  return CustomAccentColorButton(
                    buttonLabel: SLabels.register,
                    onPressed: () async {
                     
                      await controller.signupWithEmailPassword();
                      
                    },
                    isLoading: controller.isRegisterLoading,
                  );
                }),
          ),
          SizedBox(
            height: 1.5.getHeight(),
          ),
          SizedBox(
            width: double.maxFinite,
            child: GetBuilder<SignUpController>(
                id: controller.signupWithGoogleButtonId,
                builder: (controller) {
                  return CustomPrimaryColorButton(
                    buttonLabel: SLabels.signUpWithGooogle,
                    onPressed: () async {
                      await controller.signupWithGoogle();
                    },
                    isLoading: controller.isGoogleLoading,
                  );
                }),
          )
        ],
      ),
    );
  }
}
