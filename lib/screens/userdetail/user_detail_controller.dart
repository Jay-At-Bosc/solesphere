// ignore_for_file: unused_local_variable

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../services/models/user_data_model.dart';
import '../../services/repositories/db_authentication.dart';
import '../../utils/constants/labels.dart';

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

  GlobalKey<FormState> userdetailKey = GlobalKey<FormState>();

  late TabController? controller;

  @override
  onInit() {
    super.onInit();
    controller = TabController(length: 3, vsync: this);
  }

  Rx<XFile?> selectedImage = Rx(null);
  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = XFile(image.path);
    }

    update([userProfilePictureId]);
  }

  checkPermission() async {
    Map<Permission, PermissionStatus> permissionStatus = await [
      Permission.camera,
      Permission.storage,
    ].request();

    log('asked for permission');

    if (permissionStatus[Permission.camera] != PermissionStatus.granted ||
        permissionStatus[Permission.storage] != PermissionStatus.granted) {
      return;
    }
  }

  void skip() {}

  Future<void> saveUserData() async {
    log("save method called");
    final String id = FirebaseAuth.instance.currentUser!.uid;
    try {
      log("inside try");
      final user = UserDataModel(
        id: id,
        name: username,
        email: useremail,
        phone: phoneNo.text,
        addressType: "Home", //getStringRepresentation(controller!.index),
        area: addressLine2.text,
        city: city.text,
        pincode: zipcode.text,
        house: addressLine1.text,
        state: state.text,
      );

      log(user.phone.toString());

      final userDetailAdded = await DbAuthentication.instance
          .createUserDetails(user, selectedImage.value);

      // Get.offAllNamed(Routes.home);
    } catch (e) {
      showMessage(SLabels.error, e.toString());
    }
  }

  showMessage(String title, String message) {
    return Get.snackbar(title, message,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM);
  }
}
