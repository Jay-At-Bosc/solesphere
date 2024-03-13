import 'package:get/get.dart';
import 'package:solesphere/screens/notification/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NotificationController>(NotificationController());
  }
}
