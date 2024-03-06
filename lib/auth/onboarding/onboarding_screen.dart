import 'package:flutter/material.dart';
import 'package:solesphere/auth/auth_exports.dart';

import 'onboarding_controller.dart';
import 'onboarding_page.dart';
import 'onbording_dotnavigation.dart';

import 'package:solesphere/utils/constants/labels.dart';
import '../../utils/extensions/responsive_extension.dart';

import '../../utils/constants/images.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          Expanded(
            child: PageView(
              controller: OnBoardingController.instance.pageController,
              onPageChanged: OnBoardingController.instance.updatePageIndicator,
              children: [
                OnBoardingPage(
                  imagePath: SImages.onboardingImage_1,
                  onboardingTitle: SLabels.onBoardingTitle1,
                  onboardingSubTitle: SLabels.onBoardingSubTitle1,
                  xheight: 80.0.getHeight(),
                  xwidth: 100.0.getWidth(),
                ),
                OnBoardingPage(
                  imagePath: SImages.onboardingImage_2,
                  onboardingTitle: SLabels.onBoardingTitle2,
                  onboardingSubTitle: SLabels.onBoardingSubTitle2,
                  xheight: 80.0.getHeight(),
                  xwidth: 100.0.getWidth(),
                ),
                OnBoardingPage(
                  imagePath: SImages.onboardingImage_3,
                  onboardingTitle: SLabels.onBoardingTitle3,
                  onboardingSubTitle: SLabels.onBoardingSubTitle3,
                  xheight: 90.0.getHeight(),
                  xwidth: 100.0.getWidth(),
                ),
              ],
            ),
          ),

          // Child 2: Row with Two Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Page Navigation Dots
                  const OnBoardingDotNavigation(),
            
                  ElevatedButton(
                    onPressed: () => OnBoardingController.instance.nextPage(),
                    child:
                        OnBoardingController.instance.currentIndex.value == 2
                            ? const Text(SLabels.getStarted)
                            : const Text(SLabels.next),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


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