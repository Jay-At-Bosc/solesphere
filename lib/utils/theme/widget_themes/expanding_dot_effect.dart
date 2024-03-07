import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constants/colors.dart';

class SExpandingDotEffect {
  SExpandingDotEffect._();

  // Light Theme Dot Style
  static const lightEffect = ExpandingDotsEffect(
      dotColor: SColors.lightDotColor,
      activeDotColor: SColors.accent,
      dotHeight: 5,
      dotWidth: 8,
      radius: 16,
      expansionFactor: 4);

  /// Dark Theme Dot Style
  static const darkEffect = ExpandingDotsEffect(
      dotColor: SColors.primary,
      activeDotColor: SColors.accent,
      dotHeight: 5,
      dotWidth: 8,
      radius: 16,
      expansionFactor: 4);
}
