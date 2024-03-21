import 'dart:convert';

class Useraddress {
  final String house;
  final String area;
  final int pincode;
  final String town;
  final String state;
  final String adType;
  final String id;
  Useraddress({
    required this.house,
    required this.area,
    required this.pincode,
    required this.town,
    required this.state,
    required this.adType,
    required this.id,
  });

  Useraddress copyWith({
    String? house,
    String? area,
    int? pincode,
    String? town,
    String? state,
    String? adType,
    String? id,
  }) {
    return Useraddress(
      house: house ?? this.house,
      area: area ?? this.area,
      pincode: pincode ?? this.pincode,
      town: town ?? this.town,
      state: state ?? this.state,
      adType: adType ?? this.adType,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'house': house,
      'area': area,
      'pincode': pincode,
      'town': town,
      'state': state,
      'adType': adType,
      '_id': id,
    };
  }

  factory Useraddress.fromMap(Map<String, dynamic> map) {
    return Useraddress(
      house: map['house'] as String,
      area: map['area'] as String,
      pincode: map['pincode'].toInt() as int,
      town: map['town'] as String,
      state: map['state'] as String,
      adType: map['adType'] as String,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Useraddress.fromJson(String source) => Useraddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Useraddress(house: $house, area: $area, pincode: $pincode, town: $town, state: $state, adType: $adType, _id: $id)';
  }

  @override
  bool operator ==(covariant Useraddress other) {
    if (identical(this, other)) return true;
  
    return 
      other.house == house &&
      other.area == area &&
      other.pincode == pincode &&
      other.town == town &&
      other.state == state &&
      other.adType == adType &&
      other.id == id;
  }

  @override
  int get hashCode {
    return house.hashCode ^
      area.hashCode ^
      pincode.hashCode ^
      town.hashCode ^
      state.hashCode ^
      adType.hashCode ^
      id.hashCode;
  }
}