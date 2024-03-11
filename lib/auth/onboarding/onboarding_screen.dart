import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/auth/onboarding/onboarding_controller.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';
import 'package:solesphere/utils/theme/theme.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/labels.dart';
import 'onboarding_image.dart';
import 'onbording_dotnavigation.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnBoardingController>(
        id: "Main Onboard",
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: SColors.accent),
            );
          } else {
            return Column(
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
                                  Text(
                                    controller.onboardingItems[index].title,
                                    //SLabels.onBoardingTitle1,
                                    style: Get.isDarkMode
                                        ? SAppTheme
                                            .darkTheme.textTheme.displayLarge
                                        : SAppTheme
                                            .lightTheme.textTheme.displayLarge,
                                  ),
                                  Text(
                                    controller.onboardingItems[index].subtitle,
                                    //SLabels.onBoardingSubTitle1,
                                    style: Get.isDarkMode
                                        ? SAppTheme
                                            .darkTheme.textTheme.displayMedium
                                        : SAppTheme
                                            .lightTheme.textTheme.displayMedium,
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
                    padding: EdgeInsets.symmetric(horizontal: 3.0.getWidth()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OnBoardingDotNavigation(
                          count: OnBoardingController
                              .instance.onboardingItems.length,
                        ),
                        Obx(
                          () => ElevatedButton(
                            onPressed: () =>
                                OnBoardingController.instance.nextPage(),
                            child: OnBoardingController
                                        .instance.currentIndex.value ==
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
            );
          }
        },
      ),
    );
  }
}

// Expanded(
                //   flex: 6,
                //   child: PageView(
                //     controller: OnBoardingController.instance.pageController,
                //     onPageChanged: OnBoardingController.instance.updatePageIndicator,
                //     children: [
                //       OnBoardingPage(
                //         imagePath: SImages.onboardingImage_1,
                //         onboardingTitle: SLabels.onBoardingTitle1,
                //         onboardingSubTitle: SLabels.onBoardingSubTitle1,
                //         xheight: 80.0.getHeight(),
                //         xwidth: 100.0.getWidth(),
                //       ),
                //       OnBoardingPage(
                //         imagePath: SImages.onboardingImage_2,
                //         onboardingTitle: SLabels.onBoardingTitle2,
                //         onboardingSubTitle: SLabels.onBoardingSubTitle2,
                //         xheight: 80.0.getHeight(),
                //         xwidth: 100.0.getWidth(),
                //       ),
                //       OnBoardingPage(
                //         imagePath: SImages.onboardingImage_3,
                //         onboardingTitle: SLabels.onBoardingTitle3,
                //         onboardingSubTitle: SLabels.onBoardingSubTitle3,
                //         xheight: 90.0.getHeight(),
                //         xwidth: 100.0.getWidth(),
                //       ),
                //     ],
                //   ),
                // ),

                // // Child 2: Row with Two Buttons
                










// PageView(
          //   children: [
          //   Stack(
          //     children: [
          //       /// ring code start
          //       Positioned(
          //         left: 48.0.getWidth(),
          //         bottom: 70.0.getHeight(),
          //         child: Container(
          //           width: 50.0.getHeight(),
          //           height: 50.0.getHeight(),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(50.0.getHeight()),
          //             gradient: LinearGradient(
          //                 begin: Alignment.topLeft,
          //                 end: Alignment.bottomRight,
          //                 colors: [
          //                   SColors.gradiantStatingColor,
          //                   SColors.gradiantEndingColor
          //                 ]),
          //           ),
          //         ),
          //       ),
          //       Positioned(
          //         left: 70.0.getWidth(),
          //         top: -16.0.getHeight(),
          //         child: Container(
          //           width: 32.0.getHeight(),
          //           height: 30.0.getHeight(),
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(50.0.getHeight()),
          //           ),
          //         ),
          //       ),

          //       /// ring code end

          //       // main image code start
          //       Positioned(
          //         top: 20.0.getHeight(),
          //         left: 20,
          //         right: 20,
          //         child: SvgPicture.asset(
          //           SImages.onboardingImageDots,
          //           height: 100.0.getWidth(),
          //         ),
          //       ),
          //       // Positioned(
          //       //   top: 35.0.getHeight(),
          //       //   left: 18.0.getWidth(),
          //       //   right: 16.0.getWidth(),
          //       //   child: Container(
          //       //     height: 60.0.getWidth(),
          //       //     decoration: BoxDecoration(
          //       //       gradient: LinearGradient(
          //       //         colors: [
          //       //           SColors.lightBackground,
          //       //           Colors.grey.withOpacity(0.1),
          //       //           SColors.lightBackground,
          //       //           SColors.lightBackground,
          //       //           SColors.lightBackground,
          //       //         ],
          //       //         begin: const AlignmentDirectional(0, 0.6),
          //       //         end: const AlignmentDirectional(0.2, 1.5),
          //       //       ),
          //       //     ),
          //       //   ),
          //       // ),

          //       Positioned(
          //         top: 20.0.getHeight(),
          //         left: 20,
          //         right: 20,
          //         height: 100.0.getWidth(),
          //         child: Image.asset(
          //           SImages.onboardingImage_1,
          //         ),
          //       ),

          //       /// Onboarding Title
          //       // Positioned(
          //       //   top: 20.0.getHeight() + 100.0.getWidth(),
          //       //   left: 20,
          //       //   right: 20,
          //       //   height: 100.0.getWidth(),
          //       //   child: const Text("ram"),
          //       // ),

          //       // /// Onboarding SubTitle
          //       // Positioned(
          //       //   top: 20.0.getHeight() + 100.0.getWidth() + 16,
          //       //   left: 20,
          //       //   right: 20,
          //       //   height: 100.0.getWidth(),
          //       //   child:
          //       // ),
          //     ],
          //   ),
          // ]),

          // const Text("ram"),
          // const Text("ram"),