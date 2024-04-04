import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/auth/onboarding/onboarding_controller.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../utils/constants/labels.dart';
import '../../utils/theme/widget_themes/elevated_button_theme.dart';
import '../../widgets/custom_label.dart';
import 'onboarding_image.dart';
import 'onbording_dotnavigation.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: Get.mediaQuery.padding.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.onboardingItems.length,
                physics: const AlwaysScrollableScrollPhysics(),
                onPageChanged: controller.updatePageIndicator,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        flex: 6,
                        child: OnBordingImage(
                          imageUrl: controller.onboardingItems[index].image,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3.0.getWidth(),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomLabelText(
                                labelText:
                                    controller.onboardingItems[index].title,
                                labelStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                maxLines: 2,
                              ),
                              CustomLabelText(
                                labelText:
                                    controller.onboardingItems[index].subtitle,
                                labelStyle:
                                    Theme.of(context).textTheme.displayMedium,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            /// Page Indicator with button
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.getWidth()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OnBoardingDotNavigation(
                      count:
                          OnBoardingController.instance.onboardingItems.length,
                    ),
                    Obx(
                      () => ElevatedButton(
                        onPressed: () =>
                            OnBoardingController.instance.nextPage(),
                        style: SElevatedButtonTheme.elevatedButtonStyle,
                        child:
                            OnBoardingController.instance.currentIndex.value ==
                                    OnBoardingController
                                            .instance.onboardingItems.length -
                                        1
                                ? const Text(SLabels.getStarted)
                                : const Text(SLabels.next),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
