import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';

class AnalyticsService extends GetxService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logEvent(String name, Map<String, dynamic>? parameters) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }
}
