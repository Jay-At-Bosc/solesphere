import 'dart:convert';

class Brands {
  final String id;
  final String brand;
  final String brandIcon;
  Brands({
    required this.id,
    required this.brand,
    required this.brandIcon,
  });

  Brands copyWith({
    String? id,
    String? brand,
    String? brandIcon,
  }) {
    return Brands(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      brandIcon: brandIcon ?? this.brandIcon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'brand': brand,
      'brandIcon': brandIcon,
    };
  }

  factory Brands.fromMap(Map<String, dynamic> map) {
    return Brands(
      id: map['_id'] as String,
      brand: map['brand'] as String,
      brandIcon: map['brandIcon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Brands.fromJson(String source) => Brands.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Brands(_id: $id, brand: $brand, brandIcon: $brandIcon)';

  @override
  bool operator ==(covariant Brands other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.brand == brand &&
      other.brandIcon == brandIcon;
  }

  @override
  int get hashCode => id.hashCode ^ brand.hashCode ^ brandIcon.hashCode;
}