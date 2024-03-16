import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:solesphere/app.dart';
import 'package:solesphere/firebase_options.dart';
import 'package:solesphere/services/repositories/authentication.dart';
import 'package:solesphere/services/repositories/db_authentication.dart';

import 'package:solesphere/utils/local_storage/app_storage.dart';

Future<void> main() async {
  /// Widgets Bindings
  WidgetsFlutterBinding.ensureInitialized();

  /// Device orientation setttings
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// Initilize local storage
  await Get.put(AppStorage()).initStorage();

  /// Firebase Initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => {
        Get.put(AuthenticationRepository()),
        Get.put(DbAuthentication()),
        // Get.put(NetworkManager()),
      });

  runApp(const App());
}
