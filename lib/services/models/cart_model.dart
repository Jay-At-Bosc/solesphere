import 'dart:convert';

class CartModel {
  final String productId;
  final String productName;
  final String imgUrl;
  final String color;
  final int size;
   int quantity;
  final int actualPrice;
  final int discountedPrice;
  final String id;
  CartModel({
    required this.productId,
    required this.productName,
    required this.imgUrl,
    required this.color,
    required this.size,
    required this.quantity,
    required this.actualPrice,
    required this.discountedPrice,
    required this.id,
  });

  CartModel copyWith({
    String? productId,
    String? productName,
    String? imgUrl,
    String? color,
    int? size,
    int? quantity,
    int? actualPrice,
    int? discountedPrice,
    String? id,
  }) {
    return CartModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      imgUrl: imgUrl ?? this.imgUrl,
      color: color ?? this.color,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
      actualPrice: actualPrice ?? this.actualPrice,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_id': productId,
      'productName': productName,
      'image_url': imgUrl,
      'color': color,
      'size': size,
      'quantity': quantity,
      'actual_price': actualPrice,
      'discounted_price': discountedPrice,
      '_id': id,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      productId: map['product_id'] as String,
      productName: map['productName'] as String,
      imgUrl: map['image_url'] as String,
      color: map['color'] as String,
      size: map['size'].toInt() as int,
      quantity: map['quantity'].toInt() as int,
      actualPrice: map['actual_price'].toInt() as int,
      discountedPrice: map['discounted_price'].toInt() as int,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(product_id: $productId, productName: $productName, image_url: $imgUrl, color: $color, size: $size, quantity: $quantity, actual_price: $actualPrice, discounted_price: $discountedPrice, _id: $id)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.productId == productId &&
      other.productName == productName &&
      other.imgUrl == imgUrl &&
      other.color == color &&
      other.size == size &&
      other.quantity == quantity &&
      other.actualPrice == actualPrice &&
      other.discountedPrice == discountedPrice &&
      other.id == id;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
      productName.hashCode ^
      imgUrl.hashCode ^
      color.hashCode ^
      size.hashCode ^
      quantity.hashCode ^
      actualPrice.hashCode ^
      discountedPrice.hashCode ^
      id.hashCode;
  }
}