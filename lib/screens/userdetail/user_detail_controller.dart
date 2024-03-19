import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserDetailsController extends GetxController{
  static UserDetailsController get instance => Get.find();

  Rx<File?> selectedImage = Rx(null);
   Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }
}