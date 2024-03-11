import '../auth_exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return const Scaffold(
            body: Center(
              child: CustomImage(imgPath: SImages.splasgImage),
            ),
          );
        });
  }
}
