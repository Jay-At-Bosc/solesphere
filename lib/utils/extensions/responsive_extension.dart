import 'package:get/get.dart';

// extension ResponsiveInt on int {
//   double getWidth() {
//     final double getWidth = Get.width;

//     return (this * getWidth) / 100;
//   }

//   double getHeight() {
//     final double getHeight = Get.height;

//     return (this * getHeight) / 100;
//   }
// }

extension ResponsiveDouble on double {
  double getWidth() {
    final double getWidth = Get.width;

    return (this * getWidth) / 100;
  }

  double getHeight() {
    final double getHeight = Get.height;

    return (this * getHeight) / 100;
  }
}
