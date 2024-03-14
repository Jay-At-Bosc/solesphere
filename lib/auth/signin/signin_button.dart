import 'package:solesphere/auth/signin/signin_controller.dart';

import '../../utils/constants/labels.dart';
import '../../utils/extensions/responsive_extension.dart';
import '../../widgets/custom_accent_color_button.dart';
import '../../widgets/custom_primary_color_button.dart';
import '../auth_exports.dart';

class SignInButton extends GetView<SignInController> {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0.getWidth()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: double.maxFinite,
              child: GetBuilder<SignInController>(
                  id: controller.signinButtonId,
                  builder: (controller) {
                    return CustomAccentColorButton(
                      buttonLabel: SLabels.signIn,
                      isLoading: controller.isMainLoading,
                      onPressed: () async {
                        await controller.signinWithEmailPassword();
                      },
                    );
                  })),
          SizedBox(
            height: 1.5.getHeight(),
          ),
          //const CustomPrimaryColorButton(buttonLabel: SLabels.signInWithGooogle)
          SizedBox(
              width: double.maxFinite,
              child: GetBuilder<SignInController>(
                  id: controller.signinWithGoogleButtonId,
                  builder: (controller) {
                    return CustomPrimaryColorButton(
                      buttonLabel: SLabels.signInWithGooogle,
                      onPressed: () async {
                        await controller.signInWithGoogle();
                      },
                      isLoading: controller.isMainLoading,
                    );
                  })),
        ],
      ),
    );
  }
}
