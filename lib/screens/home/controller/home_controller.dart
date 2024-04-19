import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // final categories = RxList<Categories>([]);
  RxInt selectedItem = (-1).obs;
  RxString city = ''.obs;
  RxString state = ''.obs;

  // final AnalyticsService _analyticsService = Get.find();

  @override
  void onInit() {
    // categories.addAll(categoryList);
    analytics.setAnalyticsCollectionEnabled(true);
    fetchLocation();

    super.onInit();
  }

  void onItemClick(int index) {
    selectedItem.value = index;
    update();
  }

  Future<LocationPermission> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  Future<Position> _getCurrentLocation() async {
    LocationPermission permission = await _checkLocationPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } else {
      // Handle permission denied case (e.g., show a snackbar)
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
  }

  Future<List<Placemark>> _getAddressFromLocation(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    return placemarks;
  }

  Future<void> fetchLocation() async {
    Position position = await _getCurrentLocation();
    // ignore: unnecessary_null_comparison
    if (position != null) {
      List<Placemark> placemarks = await _getAddressFromLocation(position);
      if (placemarks.isNotEmpty) {
        city.value = placemarks[0].locality ?? ''; // Check for null
        state.value = placemarks[0].administrativeArea ?? ''; // Check for null
      }
    }

    update(['location']);
  }
}
