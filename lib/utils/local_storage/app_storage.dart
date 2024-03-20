// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:solesphere/services/models/onboarding_model.dart';
import 'package:solesphere/services/models/user_data_model.dart';

Future<void> getXStorageInit() async {
  await GetStorage.init();
}

class AppStorage {
  // ignore: prefer_function_declarations_over_variables
  final _storageBox = () => GetStorage(StorageKey.kAppStorageKey);

  Future<void> initStorage() async {
    await GetStorage.init(StorageKey.kAppStorageKey);
  }

  dynamic _read(String key) {
    return _storageBox().read(key);
  }

  Future<void> _write(String key, dynamic value) async {
    return await _storageBox().write(key, value);
  }

  Future<void> remove(String key) async {
    return await _storageBox().remove(key);
  }

  Future<void> erase() async {
    return await _storageBox().erase();
  }

  bool getBool(String key) {
    return _read(key) ?? false;
  }

  String? getString(String key) {
    return _read(key);
  }

  Future<void> setBool(String key, bool value) {
    return _write(key, value);
  }

  Future<void> setString(String key, String value) {
    return _write(key, value);
  }

  UserDataModel? getUserData() {
    final jsonString = _read(StorageKey.kUserData);
    if (jsonString != null) {
      return UserDataModel.fromMap(jsonString);
    }
    return null;
  }

  setUserData(UserDataModel? userData) {
    if (userData == null) {
      return _write(StorageKey.kUserData, null);
    }
    return _write(StorageKey.kUserData, userData.toJson());
  }

  bool get hasOnBoardingCompleted =>
      getBool(StorageKey.kHasOnBoardingCompleted);
  set hasOnBoardingCompleted(bool value) =>
      setBool(StorageKey.kHasOnBoardingCompleted, value);

  // onboardingItems
  // Future<void> setOnboardingItems(List<OnboardingItem> items) {
  //   final jsonString = jsonEncode(items);
  //   return setString(StorageKey.kOnBoardingItems, jsonString);
  // }

  Future<void> setOnboardingItems(String jsonString) {
    // final jsonString = jsonEncode(items);
    return setString(StorageKey.kOnBoardingItems, jsonString);
  }

  List<OnboardingItem> getOnboardingItems() {
    final jsonString = getString(StorageKey.kOnBoardingItems);
    if (jsonString != null) {
      final List<dynamic> decodedData = jsonDecode(jsonString);
      return decodedData.map((item) => OnboardingItem.fromMap(item)).toList();
    }
    return [];
  }
}

class StorageKey {
  static const String kAppStorageKey = "kAppStorageKey";

  static const String kHasOnBoardingCompleted = "hasOnBoardingCompleted";
  static const String kUserData = "userData";
  static const String kOnBoardingItems = "onBoardingItems";
  static const String kAuthToken = "AuthToken";
}
