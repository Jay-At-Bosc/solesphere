import 'dart:convert';

class UserDataModel {
  String id;
  String name;
  String email;
  String? phone;
  String? house;
  String? addressType; // Home, Office, Other
  String? city;
  String? state;
  String? area;
  String? pincode;

  UserDataModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.house,
    this.addressType,
    this.city,
    this.state,
    this.area,
    this.pincode,
  });

  static UserDataModel? fromJson(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return UserDataModel(
      id: jsonMap['id'],
      name: jsonMap['name'],
      email: jsonMap['email'],
      phone: jsonMap['phone'],
      house: jsonMap['house'],
      addressType: jsonMap['addressType'],
      city: jsonMap['city'],
      state: jsonMap['state'],
      area: jsonMap['area'],
      pincode: jsonMap['pincode'],
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'house': house,
      'addresstype': addressType,
      'city': city,
      'state': state,
      'area': area,
      'pincode': pincode,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String?,
      house: map['address'] as String?,
      addressType: map['addressType'] as String?,
      city: map['city'] as String?,
      state: map['state'] as String?,
      area: map['area'] as String?,
      pincode: map['pincode'] as String?,
    );
  }
}
