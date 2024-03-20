import 'dart:developer';

import 'package:solesphere/auth/auth_exports.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find<OrderController>();
  RxInt activeStep = 0.obs;
  var selectedOption = ''.obs;

  void setSelectedOption(String value) {
    selectedOption.value = value;
    log('selected: ${selectedOption.value}');
    update(['address']);
  }

  void setActiveStep(int index) {
    if (index < 3) {
      activeStep.value = index; // Update active step
      log(activeStep.toString());
      update(['stepper', 'pageContent', 'btn', 'title']);
    }
  }
}
