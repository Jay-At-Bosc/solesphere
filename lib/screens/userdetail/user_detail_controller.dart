import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserDetailsController extends GetxController {
  static UserDetailsController get instance => Get.find();

  final Map<String, dynamic> args = Get.arguments;
  String get username => args['username'];
  String get useremail => args['useremail'];

  // Builder Id
  static String get userDetailScreenId => "UserDetailScreen";
  static String get userProfilePictureId => "UserProfilePicture";
  static String get userDetailFormId => "UserDetailForm";
  static String get saveButtonId => "SaveButtonId";

  Rx<File?> selectedImage = Rx(null);
  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
    update([userProfilePictureId]);
  }

  // saveUserData() {}
}
