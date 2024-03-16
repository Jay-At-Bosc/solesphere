// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:solesphere/auth/onboarding/onboarding_controller.dart';


import '../../utils/theme/widget_themes/expanding_dot_effect.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    
    return SmoothPageIndicator(
      controller: OnBoardingController.instance.pageController,
      onDotClicked: OnBoardingController.instance.dotNavigationClick,
      count: count,
      effect: SExpandingDotEffect.lightEffect,
    );
  }
}
