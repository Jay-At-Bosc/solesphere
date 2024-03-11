import 'package:get_storage/get_storage.dart';


Future<void> getXStorageInit() async {
  await GetStorage.init();
}

class AppStorage {
  // ignore: prefer_function_declarations_over_variables
  final _storageBox = () => GetStorage(StorageKey.kAppStorageKey);

   Future<void> initStorage() async {
    await GetStorage.init(StorageKey.kAppStorageKey);
  }


   dynamic read(String key) {
    return _storageBox().read(key);
  }

  Future<void> write(String key,dynamic value) async {
    return await _storageBox().write(key, value);
  }

  
}

class StorageKey {
  static const String kAppStorageKey = "kAppStorageKey";

}





















/*


  Future<void> initStorage() async {
    await GetStorage.init(StorageKey.kAppStorageKey);
  }

  Future<void> appLogout() async {
    await storageBox().remove(StorageKey.kLoggedInUser);
    await NotificationService.instance.reGenerateFCMToken();
    await storageBox().remove(StorageKey.jwtToken);
    await storageBox().remove(StorageKey.recentSearchModels);
    await storageBox().remove(StorageKey.kBaseUrlKey);
    await removeQuizUnSubmittedId();
    await FirebaseAnalytics.instance.setUserId(id: null);
    return;
  }

  dynamic read(String key) {
    return storageBox().read(key);
  }

  Future<void> _write(String key, value) async {
    return await storageBox().write(key, value);
  }
*/