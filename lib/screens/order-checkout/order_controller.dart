import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';

import 'package:solesphere/services/models/order_summary.dart';
import 'package:solesphere/services/routes/app_pages.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../services/api/end_points.dart';
import '../../services/models/user_address_model.dart';

import '../../utils/constants/icons.dart';
import '../../utils/constants/labels.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find<OrderController>();

  final user = FirebaseAuth.instance.currentUser;

  RxInt activeStep = 0.obs;
  var selectedOption = '0'.obs;
  var selectedPaymentMode = '0'.obs;

  RxBool isAddressLoading = false.obs;
  RxBool isOrderProcessLoading = false.obs;

  // List of available use address
  List<Useraddress> userAddresses = <Useraddress>[].obs;

  // Order Summary
  List<OrderSummaryModel> orderSummary = <OrderSummaryModel>[].obs;

  // List of available payment method name
  List<String> paymentTitle = ['Razorpay', 'Cash On Delivery'];

  // List of checkout page titles
  List<String> pageTitle = [
    SLabels.selectAddress,
    SLabels.selectPaymentMethod,
    SLabels.checkout,
  ];

  //get full address of user
  String fullAddress(int index) {
    var data = userAddresses[index];
    String address =
        '${data.house},${data.area},${data.town},${data.state} - ${data.pincode}';
    return address;
  }

  @override
  void onInit() async {
    await getUserAddress();
    super.onInit();
  }

//check for api call in process
  bool isMainLoading() {
    if (isAddressLoading.value) {
      return true;
    } else {
      return false;
    }
  }

  // selected addresss
  void setSelectedOption(String value) {
    selectedOption.value = value;
    log('selected Address: ${selectedOption.value}');
    update(['address']);
  }

// selected payment method
  void setPaymentMode(String value) {
    selectedPaymentMode.value = value;
    log('selected Payment Mode: ${selectedPaymentMode.value}');
    update(['payment']);
  }

// set Active Step in stepper
  Future<void> setActiveStep(int index) async {
    if (index < 3) {
      activeStep.value = index; // Update active step
      log(activeStep.toString());
      update(['stepper', 'pageContent', 'btn', 'title']);
    }
  }

// get users all addresses
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
        update(
          ['pageContent', 'updateAddress'],
        );
      }
    } catch (e) {
      log(e.toString());
      isAddressLoading.value = false;
      update(['pageContent']);
    }
  }

// get full order summary before payment
  Future<void> getOrderSummary() async {
    try {
      orderSummary.clear();
      isAddressLoading.value = true;
      update(['pageContent']);
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      var headers = {'auth-token': token, 'Content-Type': 'application/json'};
      var dio = Dio();
      var response = await dio.request(EndPoints.orderSummary,
          options: Options(
            method: 'GET',
            headers: headers,
          ),
          queryParameters: {
            'index': selectedOption,
            'paymentMethod': selectedPaymentMode
          });
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response.data['data'] as Map<String, dynamic>;

        OrderSummaryModel order = OrderSummaryModel.fromMap(responseData);
        orderSummary = [order];

        log("Okkkk");
        log("length : ${orderSummary.length}");
        isAddressLoading.value = false;
        update(['pageContent']);
      }
    } catch (e) {
      log(e.toString());
      isAddressLoading.value = false;
      update(['pageContent']);
    }
  }

  Future<void> processOrder() async {
    try {
      isOrderProcessLoading.value = true;
      if (isOrderProcessLoading.value == true) {
        Get.dialog(
          AlertDialog(
            backgroundColor: Colors.white, // White background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Square shape
            ),
            icon: Lottie.asset(SJsons.cartLoader,
                width: 60.0.getWidth(), height: 60.0.getWidth()),
          ),
          barrierDismissible: false,
        );
      }
      if (selectedPaymentMode.value == '1') {
        String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

        var headers = {'auth-token': token, 'Content-Type': 'application/json'};
        var dio = Dio();
        var response = await dio.request(EndPoints.placeOrder,
            options: Options(
              method: 'POST',
              headers: headers,
            ),
            data: {
              'paymentMethod': selectedPaymentMode.value,
            });
        if (response.statusCode == 201) {
          isOrderProcessLoading.value = false;
          Get.back();
          await TLoaders.successSnackBar(
              title: "Congratulations!", message: "Your Order Has Been Placed");
          Get.offAllNamed(Routes.home);
        }
        isOrderProcessLoading.value = false;
        // if (isOrderProcessLoading.value == false) {
        //   Get.back();
        // }
      }
    } catch (e) {
      isOrderProcessLoading.value = false;
      Get.back();
      log(e.toString());
    }
  }
}
