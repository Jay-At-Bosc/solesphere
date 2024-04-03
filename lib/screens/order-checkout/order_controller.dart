import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
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
  late Razorpay _razorpay;

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
    _razorpay = Razorpay();

    _initializePackageInfo();
    super.onInit();
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }

  void _initializePackageInfo() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      // You can log the appName or other details to ensure the plugin is working
      log('App Name: ${packageInfo.appName}');
    } catch (e) {
      log('Error initializing package_info_plus: $e');
    }
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

      Get.dialog(
        AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Lottie.asset(SJsons.cartLoader,
              width: 60.0.getWidth(), height: 60.0.getWidth()),
        ),
        barrierDismissible: false,
      );
//-----
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      var headers = {'auth-token': token, 'Content-Type': 'application/json'};

      var dio = Dio();
      final Map<String, dynamic> data = {
        'totalAmount': orderSummary[0]
            .totalActualAmount, // Replace with actual total amount
        'discount':
            orderSummary[0].totalDiscount, // Replace with actual discount value
      };

      if (selectedPaymentMode.value == '0') {
        var response = await dio.request(
          EndPoints.razorpayOrder,
          options: Options(
            method: 'POST',
            headers: headers,
          ),
          data: jsonEncode(data),
        );
        if (response.statusCode == 200) {
//-----
          log(response.data.toString());
          final Map<String, dynamic> responseData =
              response.data['data'] as Map<String, dynamic>;

          PackageInfo packageInfo = await PackageInfo.fromPlatform();

          Map<String, dynamic> options = {
            "key": "rzp_test_rA1Ir43322K9yU",
            "order_id": responseData['id'],
            "amount": responseData['amount'],
            "currency": responseData['currency'],
            "attempts": 0,
            "name": packageInfo.appName,
            'timeout': 120,
            'description': "Buy",
            'prefill': {
              "email": user!.email,
            }
          };
//-----

          _razorpay.open(options);

          _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
              (PaymentSuccessResponse response) async {
            log("Payment Success: ${response.paymentId}");
            TLoaders.successSnackBar(
                title: "Success", message: "Payment success");
            await createOrder(
                selectedPaymentMode.value,
                response.paymentId,
                (responseData['amount'] / 100).toString(),
                true,
                orderSummary[0].totalDiscount.toString());

            Get.offAllNamed(Routes.viewOrder);
          });

          _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
              (PaymentFailureResponse response) {
            log("Payment Error: ${response.code} - ${response.message}");
            Get.back();
            TLoaders.errorSnackBar(
                title: "Failed",
                message: "Payment Failed. Please Try Again..!");
          });

          _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
              (ExternalWalletResponse response) {
            log("External Wallet: ${response.walletName}");
            // Handle external wallet selection here
          });
          isOrderProcessLoading.value = false;
        }
      } else {
        await createOrder(selectedPaymentMode.value, null, null, false,
            orderSummary[0].totalDiscount.toString());
        isOrderProcessLoading.value = false;
        Get.offAllNamed(Routes.viewOrder);
      }
    } catch (e) {
      isOrderProcessLoading.value = false;
      Get.back();
      log("Error in processOrder: ${e.toString()}");
      TLoaders.errorSnackBar(
          title: "Error", message: "An error occurred. Please try again.");
    } finally {
      isOrderProcessLoading.value = false;
      Get.back();
    }
  }

  Future<void> createOrder(String paymentMethod, String? transactionId,
      String? amount, bool status, String? discount) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      if (token == null) {
        log('User token is null');
        return;
      }

      var headers = {
        'auth-token': token,
        'Content-Type': 'application/json',
      };

      var dio = Dio();
      var response = await dio.request(
        EndPoints.placeOrder,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: {
          'paymentMethod': paymentMethod,
          'transaction_id': transactionId,
          'paymentStatus': status,
          'totalAmount': amount,
          'totalDiscount': discount
        },
      );

      if (response.statusCode == 201) {
        Get.offAllNamed(Routes.viewOrder);
        TLoaders.successSnackBar(
            title: "Congratulations!", message: "Your Order Has Been Placed");
      } else {
        log('Failed to create order. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error creating order: $e');
      TLoaders.errorSnackBar(
          title: "Error",
          message: "An error occurred while placing your order.");
    }
  }
}
