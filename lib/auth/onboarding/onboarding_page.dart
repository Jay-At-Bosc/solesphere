import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../utils/constants/colors.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.imagePath,
    required this.onboardingTitle,
    required this.onboardingSubTitle,
    required this.xheight,
    required this.xwidth,
  });

  final String imagePath;
  final String onboardingTitle;
  final String onboardingSubTitle;
  final double xheight;
  final double xwidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: xheight,
      width: xwidth,
      child: Stack(
        children: [
          /// ring code start
          /// outer ring
          Positioned(
            left: 50.0.getWidth(),
            bottom: 71.0.getHeight(),
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

          // inner ring
          Positioned(
            left: 69.0.getWidth(),
            top: -17.0.getHeight(),
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
            top: 15.0.getHeight(),
            left: 20,
            right: 20,
            child: Image.asset(
              SImages.onboardingImageDots,
              height: 100.0.getWidth(),
            ),
          ),

          Positioned(
            top: 15.0.getHeight(),
            left: 20,
            right: 20,
            height: 100.0.getWidth(),
            child: Image.asset(
              imagePath,
            ),
          ),
        ],
      ),
    );
  }
}
