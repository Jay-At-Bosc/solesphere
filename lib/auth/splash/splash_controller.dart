import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:solesphere/services/models/user_data_model.dart';
import 'package:solesphere/services/routes/app_pages.dart';

import '../../utils/local_storage/app_storage.dart';
import '../auth_exports.dart';

class SplashController extends GetxController {
  final appStorage = Get.find<AppStorage>();

  @override
  void onInit() {
    super.onInit();
    Future.wait([
      getUserData(),
      fetchOnboardingItems(),
      Future.delayed(const Duration(seconds: 3)),
    ]).then((_) {
      bool hasOnboardCompleted = appStorage.hasOnBoardingCompleted;
      if (hasOnboardCompleted) {
        UserDataModel? loggedInUser = appStorage.getUserData();
        if (loggedInUser != null) {
          Get.offAllNamed(Routes.home);
        } else {
          Get.offAllNamed(Routes.signin);
        }
      } else {
        Get.offAllNamed(Routes.onboard);
      }
    });
  }

  Future<bool> fetchOnboardingItems() async {
    bool hasOnboardCompleted = appStorage.hasOnBoardingCompleted;
    if (hasOnboardCompleted) {
      return true;
    }
    const apiUrl =
        'https://solesphere-backend.onrender.com/api/v1/splashScreen';
    // TODO: make this private and reuse from single instance, same for the API call
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> data = responseData['data'];
        final jsonString = json.encode(data);
        await appStorage.setOnboardingItems(jsonString);
        return true;
      } else {
        log('Failed to load onboarding items: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      log('Error fetching onboarding items: $e');
      return false;
    }
  }

  Future<bool> getUserData() async {
    // TODO: add api call to fetch user data
    await Future.delayed(const Duration(seconds: 0));
    return true;
  }
}
