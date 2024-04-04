import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:solesphere/utils/exceptions/custom_exception.dart';

class NetworkController extends GetxController {
  static NetworkController get instance => Get.find();

  Connectivity connection = Connectivity();

  Future<void> checkInternetConnection() async {
    log("check connection");
    try {
      final connectivityResult = await connection.checkConnectivity();

      log("status from method : ${connectivityResult.first.toString()}");

      if (connectivityResult.first == ConnectivityResult.none) {
        log("Condition is check ");
        throw CustomException(
          title: "No Internet Connection",
          message: "Please check your internet connection and try again.",
        );
      } else if (connectivityResult.first == ConnectivityResult.vpn) {
        log("condition not done");
        throw CustomException(
            title: "VPN Founded",
            message:
                "Insecure connection detected. Please disable any active VPN connections");
      } else if (connectivityResult.first == ConnectivityResult.other) {
        throw CustomException(
            title: "Unsecure Connection",
            message: "Please connect using a secure internet connection");
      } else {
        return;
      }
    } catch (e) {
      rethrow;
    }
  }

  

}
