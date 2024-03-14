import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/widgets/custom_animation_loader.dart';

class SCustomFullScreenLoader {
  static void openLoadDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible:
          false, // Dialog can't be dismissed by tapping outside it.
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: SColors.accent,
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            const SizedBox(height: 250),
            CustomAnimationLoader(text: text, animation: animation),
          ]),
        ),
      ),
    );
  }

  static stopLoading() {
    Get.back(closeOverlays: true);
  }
}
