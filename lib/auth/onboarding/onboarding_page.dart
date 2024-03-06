import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/images.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {super.key,
      required this.imagePath,
      required this.onboardingTitle,
      required this.onboardingSubTitle,
      required this.xheight,
      required this.xwidth});

  final String imagePath;
  final String onboardingTitle;
  final String onboardingSubTitle;
  final double xheight;
  final double xwidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: xheight,
            width: xwidth,
            child: Stack(
              children: [
                /// ring code start
                Positioned(
                  left: 48.0.getWidth(),
                  bottom: 56.0.getHeight(),
                  child: Container(
                    width: 50.0.getHeight(),
                    height: 50.0.getHeight(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0.getHeight()),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            SColors.gradiantStatingColor,
                            SColors.gradiantEndingColor
                          ]),
                    ),
                  ),
                ),
                Positioned(
                  left: 70.0.getWidth(),
                  top: -16.0.getHeight(),
                  child: Container(
                    width: 32.0.getHeight(),
                    height: 30.0.getHeight(),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0.getHeight()),
                    ),
                  ),
                ),

                /// ring code end

                // main image code start
                Positioned(
                  top: 20.0.getHeight(),
                  left: 20,
                  right: 20,
                  child: SvgPicture.asset(
                    SImages.onboardingImageDots,
                    height: 100.0.getWidth(),
                  ),
                ),
                // Positioned(
                //   top: 35.0.getHeight(),
                //   left: 18.0.getWidth(),
                //   right: 16.0.getWidth(),
                //   child: Container(
                //     height: 60.0.getWidth(),
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         colors: [
                //           SColors.lightBackground,
                //           Colors.grey.withOpacity(0.1),
                //           SColors.lightBackground,
                //           SColors.lightBackground,
                //           SColors.lightBackground,
                //         ],
                //         begin: const AlignmentDirectional(0, 0.6),
                //         end: const AlignmentDirectional(0.2, 1.5),
                //       ),
                //     ),
                //   ),
                // ),

                Positioned(
                  top: 20.0.getHeight(),
                  left: 20,
                  right: 20,
                  height: 100.0.getWidth(),
                  child: Image.asset(
                    imagePath,
                  ),
                ),

                /// Onboarding Title
                // Positioned(
                //   top: 20.0.getHeight() + 100.0.getWidth(),
                //   left: 20,
                //   right: 20,
                //   height: 100.0.getWidth(),
                //   child: const Text("ram"),
                // ),

                // /// Onboarding SubTitle
                // Positioned(
                //   top: 20.0.getHeight() + 100.0.getWidth() + 16,
                //   left: 20,
                //   right: 20,
                //   height: 100.0.getWidth(),
                //   child:
                // ),
              ],
            ),
          ),
          Text(onboardingTitle),
          Text(onboardingSubTitle),
        ],
      ),
    );
  }
}
