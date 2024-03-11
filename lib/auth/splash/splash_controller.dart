import 'dart:convert';

import 'package:solesphere/services/routes/app_pages.dart';

import '../../services/models/onboarding_model.dart';
import '../../utils/local_storage/app_storage.dart';
import '../auth_exports.dart';
import 'package:http/http.dart' as http;

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print("Hello From splash controller");
    Future.wait([
      fetchOnboardingItems(),
      Future.delayed(const Duration(seconds: 3)),
    ]).then((_) {
      Get.offAllNamed(Routes.onboard);
    });
    print("splash controller");
  }

  Future<void> fetchOnboardingItems() async {
    const apiUrl =
        'https://solesphere-backend.onrender.com/api/v1/splashScreen';
    final storageBox = Get.find<AppStorage>();
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> data = responseData['data'];
        final jsonString = json.encode(data);
        storageBox.write('onboardingItems', jsonString);
       // print(storageBox.read('onboardingItems'));

        // Convert JSON items to a JSON string

        // storageBox.write('onboardingData', jsonString);
      } else {
        storageBox.write('onboardingData', Null);
        print('Failed to load onboarding items: ${response.statusCode}');
      }
    } catch (e) {
      storageBox.write('onboardingData', Null);
      print('Error fetching onboarding items: $e');
    }
  }
}
