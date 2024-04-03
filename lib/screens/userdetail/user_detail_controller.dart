// ignore_for_file: unused_local_variable

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:solesphere/services/routes/app_pages.dart';

import '../../services/models/user_data_model.dart';
import '../../services/repositories/db_authentication.dart';
import '../../utils/constants/enums.dart';
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

  /// Button Loader
  bool isSaveLoading = false;
  bool isAcceptPolicies = false;

  late TabController? controller;
  XFile selectedImage = XFile(
      "https://res.cloudinary.com/dz9ga1vmp/image/upload/v1711712801/xhd9shno8fzua1iqrnaa.png");

  @override
  onInit() {
    super.onInit();
    controller = TabController(length: 3, vsync: this);
  }

  /// Getters
  void get checkFormValidation =>
      !userdetailKey.currentState!.validate() ? throw "" : null;

  void get acceptPolicies =>
      !isAcceptPolicies ? throw "Please accept the terms and conditions" : null;
  bool get isMainLoading => isSaveLoading;

  Future<void> pickImage() async {
    try {
      checkPermission(); // check for permission

      // Image
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image != null) {
        await DbAuthentication.instance.uploadImage(image).then((isUpload) =>
            selectedImage =
                isUpload.isNotEmpty ? XFile(isUpload) : selectedImage);
        log(selectedImage.path);
        update([userProfilePictureId]);
      } else {
        throw "Image Not Selected";
      }
    } catch (e) {
      showMessage("Error", e.toString());
    }
  }

  checkPermission() async {
    Map<Permission, PermissionStatus> permissionStatus = await [
      Permission.camera,
      Permission.storage,
    ].request();

    log('asked for permission');

    if (permissionStatus[Permission.camera] != PermissionStatus.granted ||
        permissionStatus[Permission.storage] != PermissionStatus.granted) {
      throw "Your Permission Required";
    }
  }

  void skip() {}

  Future<void> saveUserData() async {
    final String id = FirebaseAuth.instance.currentUser!.uid;
    try {
      checkFormValidation; // Checks All Fields Validations

      acceptPolicies; // Check For accepting Policies

      isSaveLoading = true;
      update([userDetailScreenId]);

      final user = UserDataModel(
        id: id,
        name: username,
        email: useremail,
        phone: phoneNo.text,
        addressType: getStringRepresentation(controller!.index),
        area: addressLine2.text,
        city: city.text,
        pincode: zipcode.text,
        house: addressLine1.text,
        state: state.text,
      );

      final userDetailAdded = await DbAuthentication.instance
          .createUserDetails(user, selectedImage);

      isSaveLoading = false;
      update([userDetailScreenId]);

      Get.offAllNamed(Routes.home);
    } catch (e) {
      isSaveLoading = false;
      update([userDetailScreenId]);
      showMessage(SLabels.error, e.toString());
    }
  }

  showMessage(String title, String message) {
    return Get.snackbar(title, message,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM);
  }
}
