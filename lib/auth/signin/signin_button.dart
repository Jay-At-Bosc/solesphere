import 'package:solesphere/auth/signin/signin_controller.dart';

import '../../utils/constants/labels.dart';
import '../../utils/extensions/responsive_extension.dart';
import '../../widgets/custom_accent_color_button.dart';
import '../../widgets/custom_primary_color_button.dart';
import '../auth_exports.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0.getWidth()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: double.maxFinite,
              child: GetBuilder<SignInController>(
                  id: "SignInButton",
                  builder: (controller) {
                    return CustomAccentColorButton(
                        buttonLabel: SLabels.signIn,
                        isLoading: controller.isLoad);
                  })),
          SizedBox(
            height: 1.5.getHeight(),
          ),
          //const CustomPrimaryColorButton(buttonLabel: SLabels.signInWithGooogle)
          SizedBox(
              width: double.maxFinite,
              child: GetBuilder<SignInController>(
                  id: "SignInButton",
                  builder: (controller) {
                    return CustomPrimaryColorButton(
                        buttonLabel: SLabels.signIn,
                        isLoading: controller.isLoad
                      );
                  })),
        ],
      ),
    );
  }
}
