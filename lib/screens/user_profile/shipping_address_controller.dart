import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
import 'package:solesphere/screens/order-checkout/order_controller.dart';
import 'package:solesphere/services/api/end_points.dart';
import 'package:solesphere/utils/constants/enums.dart';

import '../../services/models/user_address_model.dart';

class ShippingAdddressController extends GetxController
    with GetTickerProviderStateMixin {
  static ShippingAdddressController get instance => Get.find();

  TextEditingController addressLine1 = TextEditingController();
  TextEditingController addressLine2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  GlobalKey<FormState> address = GlobalKey<FormState>();
  OrderController controller = Get.put(OrderController());

  late TabController? adType =
      TabController(length: 3, vsync: this, initialIndex: 0);

  bool isAddressLoading = false;
  List<Useraddress> user = <Useraddress>[];

  @override
  void onInit() async {
    await getUserAddress(); // Call getUserAddress on init

    super.onInit();
  }

  void get checkFormValidation =>
      !address.currentState!.validate() ? throw "" : null;

  void setInitialValue(int index) {
    if (index != -1) {
      adType = TabController(length: 3, vsync: this, initialIndex: index);
      addressLine1.text = user[index].house.toString();
      addressLine2.text = user[index].area.toString();
      city.text = user[index].town.toString();
      state.text = user[index].state.toString();
      zipcode.text = user[index].pincode.toString();
    } else {
      adType = TabController(length: 3, vsync: this, initialIndex: 0);
      addressLine1.text = "";
      addressLine2.text = '';
      city.text = '';
      state.text = '';
      zipcode.text = '';
    }
  }

  Future<void> getUserAddress() async {
    try {
      isAddressLoading = true;
      update(['user_address']); // Update once before fetching data

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
        user =
            addressList.map((address) => Useraddress.fromMap(address)).toList();
        update([
          'user_address',
          'update_btn'
        ]); // Update again after data is fetched
      }

      isAddressLoading = false;
      update([
        'user_address',
        'update_btn'
      ]); // Update once more after setting loading state
    } catch (e) {
      isAddressLoading = false;
      update(['user_address', 'update_btn']);
    }
  }

  String fullAddress(int index) {
    var data = user[index];
    String address =
        '${data.house},${data.area},${data.town},${data.state} - ${data.pincode}';
    return address;
  }

  Future<void> updateAddress(int index) async {
    // https://solesphere-backend.onrender.com/api/v1/users/update-address
    try {
      addressLine1.text =
          addressLine1.text.trim().replaceAll(RegExp(r'\s+'), ' ');
      addressLine2.text =
          addressLine2.text.trim().replaceAll(RegExp(r'\s+'), ' ');
      zipcode.text = zipcode.text.trim().replaceAll(RegExp(r'\s+'), ' ');
      city.text = city.text.trim().replaceAll(RegExp(r'\s+'), ' ');
      state.text = state.text.trim().replaceAll(RegExp(r'\s+'), ' ');
      !address.currentState!.validate() ? throw "" : null;
      // address.currentState!.validate() ? throw "" : null;
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      var headers = {'auth-token': token, 'Content-Type': 'application/json'};
      var data = json.encode({
        "newAddress": {
          "house": addressLine1.text,
          "area": addressLine2.text,
          "pincode": zipcode.text,
          "town": city.text,
          "state": state.text,
          "adType": getStringRepresentation(adType!.index),
        },
        "index": index != -1 ? index.toString() : user.length.toString()
      });
      var dio = Dio();
      var response = await dio.request(EndPoints.updateAddress,
          options: Options(method: 'PUT', headers: headers), data: data);

      if (response.statusCode == 200) {
        Get.back();
        await getUserAddress();
        await controller.getUserAddress();
      } else {
        TLoaders.errorSnackBar(title: "Opps", message: response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAddress(int index) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      var headers = {'auth-token': token, 'Content-Type': 'application/json'};
      var data = json.encode({"index": index.toString()});
      var dio = Dio();
      var response = await dio.request(EndPoints.deleteAddress,
          options: Options(method: 'DELETE', headers: headers), data: data);

      if (response.statusCode == 200) {
        log("Deleted");
        await getUserAddress();
        await controller.getUserAddress();
      } else {
        TLoaders.errorSnackBar(
            title: "Opps!!", message: response.statusMessage);
      }
    } catch (e) {
      log(e.toString());
      TLoaders.errorSnackBar(title: "Opps!!", message: e);
    }
  }
}
