import 'dart:convert';

class CartModel {
  final String product_id;
  final String productName;
  final String image_url;
  final String color;
  final int size;
   int quantity;
  final int actual_price;
  final int discounted_price;
  final String id;
  CartModel({
    required this.product_id,
    required this.productName,
    required this.image_url,
    required this.color,
    required this.size,
    required this.quantity,
    required this.actual_price,
    required this.discounted_price,
    required this.id,
  });

  CartModel copyWith({
    String? product_id,
    String? productName,
    String? image_url,
    String? color,
    int? size,
    int? quantity,
    int? actual_price,
    int? discounted_price,
    String? id,
  }) {
    return CartModel(
      product_id: product_id ?? this.product_id,
      productName: productName ?? this.productName,
      image_url: image_url ?? this.image_url,
      color: color ?? this.color,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
      actual_price: actual_price ?? this.actual_price,
      discounted_price: discounted_price ?? this.discounted_price,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_id': product_id,
      'productName': productName,
      'image_url': image_url,
      'color': color,
      'size': size,
      'quantity': quantity,
      'actual_price': actual_price,
      'discounted_price': discounted_price,
      '_id': id,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      product_id: map['product_id'] as String,
      productName: map['productName'] as String,
      image_url: map['image_url'] as String,
      color: map['color'] as String,
      size: map['size'].toInt() as int,
      quantity: map['quantity'].toInt() as int,
      actual_price: map['actual_price'].toInt() as int,
      discounted_price: map['discounted_price'].toInt() as int,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(product_id: $product_id, productName: $productName, image_url: $image_url, color: $color, size: $size, quantity: $quantity, actual_price: $actual_price, discounted_price: $discounted_price, _id: $id)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.product_id == product_id &&
      other.productName == productName &&
      other.image_url == image_url &&
      other.color == color &&
      other.size == size &&
      other.quantity == quantity &&
      other.actual_price == actual_price &&
      other.discounted_price == discounted_price &&
      other.id == id;
  }

  @override
  int get hashCode {
    return product_id.hashCode ^
      productName.hashCode ^
      image_url.hashCode ^
      color.hashCode ^
      size.hashCode ^
      quantity.hashCode ^
      actual_price.hashCode ^
      discounted_price.hashCode ^
      id.hashCode;
  }
}