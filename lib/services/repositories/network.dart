import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:solesphere/utils/exceptions/custom_exception.dart';

class NetworkController extends GetxController {
  static NetworkController get instance => Get.find();

  Connectivity connection = Connectivity();

  Future<void> checkInternetConnection() async {
    try {
      final connectivityResult = await connection.checkConnectivity();

      if (connectivityResult.first == ConnectivityResult.none) {
        throw CustomInternetException(
          title: "No Internet Connection",
          message: "Please check your internet connection and try again.",
        );
      } else if (connectivityResult.first == ConnectivityResult.vpn) {
        throw CustomInternetException(
            title: "VPN Founded",
            message:
                "Insecure connection detected. Please disable any active VPN connections");
      } else if (connectivityResult.first == ConnectivityResult.other) {
        throw CustomInternetException(
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
