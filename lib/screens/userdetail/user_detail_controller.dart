import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserDetailsController extends GetxController
    with GetTickerProviderStateMixin {
  static UserDetailsController get instance => Get.find();

  final Map<String, dynamic> args = Get.arguments;
  String get username => args['username'];
  String get useremail => args['useremail'];

  // Builder Id
  static String get userDetailScreenId => "UserDetailScreen";
  static String get userProfilePictureId => "UserProfilePicture";
  static String get userDetailFormId => "UserDetailForm";
  static String get saveButtonId => "SaveButtonId";

  // Controller
  TextEditingController phoneNo = TextEditingController();
  TextEditingController addressLine1 = TextEditingController();
  TextEditingController addressLine2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zipcode = TextEditingController();

  late TabController? controller;

  @override
  onInit() {
    super.onInit();
    controller = TabController(length: 3, vsync: this);
  }

  Rx<File?> selectedImage = Rx(null);
  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
    update([userProfilePictureId]);
  }

  void skip() {}

  saveUserData() {}
}
