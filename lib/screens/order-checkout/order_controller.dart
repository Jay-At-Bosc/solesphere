import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solesphere/auth/auth_exports.dart';

import '../../services/api/end_points.dart';
import '../../services/models/user_address_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find<OrderController>();
  RxInt activeStep = 0.obs;
  var selectedOption = ''.obs;
  // final List<Useraddress> addressList = [];
  RxBool isAddressLoading = false.obs;
  List<Useraddress> userAddresses = <Useraddress>[].obs;

  @override
  void onInit() async {
    await getUserAddress();
    super.onInit();
  }

  bool isMainLoading() {
    if (isAddressLoading.value) {
      return true;
    } else {
      return false;
    }
  }

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

  Future<void> getUserAddress() async {
    try {
      isAddressLoading.value = true;
      update(['pageContent']);
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      var headers = {'auth-token': token, 'Content-Type': 'application/json'};
      var dio = Dio();
      var response = await dio.request(
        EndPoints.getUser,
        options: Options(method: 'GET', headers: headers),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic> addressList = responseData['data']['address'];
        userAddresses =
            addressList.map((address) => Useraddress.fromMap(address)).toList();
        // for (final address in userAddresses) {
        //   addressList.add(address);
        // }

        log("Okkkk");
        log("length : ${addressList.length}");
        isAddressLoading.value = false;
        update(['pageContent']);
      }
    } catch (e) {
      log(e.toString());
      isAddressLoading.value = false;
      update(['pageContent']);
    }
  }
}
