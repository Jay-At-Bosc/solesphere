import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:solesphere/auth/onboarding/onboarding_controller.dart';

import '../../utils/theme/widget_themes/expanding_dot_effect.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: OnBoardingController.instance.pageController,
      onDotClicked: OnBoardingController.instance.dotNavigationClick,
      count: 3,
      effect: OnBoardingController.instance.isDark
          ? SExpandingDotEffect.darkEffect
          : SExpandingDotEffect.lightEffect,
    );
  }
}
