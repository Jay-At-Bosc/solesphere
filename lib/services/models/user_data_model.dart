import 'dart:convert';

class UserDataModel {
  String id;
  String name;
  String email;
  String? phone;
  String? address;
  String? city;
  String? state;
  String? country;
  String? pincode;

  UserDataModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.country,
    this.pincode,
  });

  static UserDataModel? fromJson(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return UserDataModel(
      id: jsonMap['id'],
      name: jsonMap['name'],
      email: jsonMap['email'],
      phone: jsonMap['phone'],
      address: jsonMap['address'],
      city: jsonMap['city'],
      state: jsonMap['state'],
      country: jsonMap['country'],
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
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'pincode': pincode,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
  return UserDataModel(
    id: map['id'] as String,
    name: map['name'] as String,
    email: map['email'] as String,
    phone: map['phone'] as String?,
    address: map['address'] as String?,
    city: map['city'] as String?,
    state: map['state'] as String?,
    country: map['country'] as String?,
    pincode: map['pincode'] as String?,
  );
}
}
