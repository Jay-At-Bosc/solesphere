import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

class OnBordingImage extends StatelessWidget {
  const OnBordingImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
   

    return Stack(
      fit: StackFit.expand,
      children: [
        /// ring code start
        /// outer ring
        Positioned(
          left: 50.0.getWidth(),
          top: -50.0.getWidth(),
          child: Container(
            width: 100.0.getWidth(),
            height: 100.0.getWidth(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0.getWidth()),
              color: Get.isDarkMode ? SColors.darkDotColor : null,
              gradient: Get.isDarkMode ? null : SColors.lightLinearGradient,
            ),
          ),
        ),

        // inner ring
        Positioned(
          left: 75.0.getWidth(),
          top: -25.0.getWidth(),
          child: Container(
            width: 50.0.getWidth(),
            height: 50.0.getWidth(),
            decoration: BoxDecoration(
              color:SColors.primary,
              borderRadius: BorderRadius.circular(50.0.getWidth()),
            ),
          ),
        ),

        /// Ring code end

        /// 3 Dots Code start
        Positioned(
          left: 20.0.getWidth(),
          top: 40.0.getWidth(),
          child: Container(
            height: 4.0.getWidth(),
            width: 4.0.getWidth(),
            decoration: BoxDecoration(
                color: SColors.lightDotColor,
                borderRadius: BorderRadius.circular(5.0.getWidth())),
          ),
        ),

        Positioned(
          left: 10.0.getWidth(),
          bottom: 5.0.getWidth(),
          child: Container(
            height: 4.0.getWidth(),
            width: 4.0.getWidth(),
            decoration: BoxDecoration(
                color: SColors.accent,
                borderRadius: BorderRadius.circular(4.0.getWidth())),
          ),
        ),

        Positioned(
          right: 10.0.getWidth(),
          bottom: 10.0.getWidth(),
          child: Container(
            height: 4.0.getWidth(),
            width: 4.0.getWidth(),
            decoration: BoxDecoration(
                color: SColors.accent,
                borderRadius: BorderRadius.circular(4.0.getWidth())),
          ),
        ),

        /// 3 Dots code end

        /// Shoe Image code
        Padding(
          padding: EdgeInsets.only(
              top: 40.0.getWidth(),
              left: 10.0.getWidth(),
              right: 10.0.getWidth()),
          child: Image.network(imageUrl),
          //child: Text(imageUrl),
        ),
      ],
    );
  }
}
