import 'dart:convert';

import 'package:flutter/foundation.dart';

class ViewOrderModel {
  final String id;
  final String transactionId;
  final String signature;
  final String user;
  final List<Product> products;
  final String totalAmount;
  final String totalDiscount;
  final String orderStatus;
  final bool paymentMethod;
  final String paymentStatus;
  final String createdAt;
  final String updatedAt;
  final int v;
  ViewOrderModel({
    required this.id,
    required this.transactionId,
    required this.signature,
    required this.user,
    required this.products,
    required this.totalAmount,
    required this.totalDiscount,
    required this.orderStatus,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  ViewOrderModel copyWith({
    String? id,
    String? transactionId,
    String? signature,
    String? user,
    List<Product>? products,
    String? totalAmount,
    String? totalDiscount,
    String? orderStatus,
    bool? paymentMethod,
    String? paymentStatus,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return ViewOrderModel(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      signature: signature ?? this.signature,
      user: user ?? this.user,
      products: products ?? this.products,
      totalAmount: totalAmount ?? this.totalAmount,
      totalDiscount: totalDiscount ?? this.totalDiscount,
      orderStatus: orderStatus ?? this.orderStatus,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'transaction_id': transactionId,
      'signature': signature,
      'user': user,
      'products': products.map((x) => x.toMap()).toList(),
      'totalAmount': totalAmount,
      'totalDiscount': totalDiscount,
      'orderStatus': orderStatus,
      'paymentMethod': paymentMethod,
      'paymentStatus': paymentStatus,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }

  factory ViewOrderModel.fromMap(Map<String, dynamic> map) {
    return ViewOrderModel(
      id: map['_id'] as String,
      transactionId: map['transaction_id'] as String,
      signature: map['signature'] as String,
      user: map['user'] as String,
      products: List<Product>.from(
        (map['products'] as List<dynamic>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalAmount: map['totalAmount'] as String,
      totalDiscount: map['totalDiscount'] as String,
      orderStatus: map['orderStatus'] as String,
      paymentMethod: map['paymentMethod'] as bool,
      paymentStatus: map['paymentStatus'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      v: map['__v'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ViewOrderModel.fromJson(String source) =>
      ViewOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ViewOrderModel(_id: $id, transaction_id: $transactionId, signature: $signature, user: $user, products: $products, totalAmount: $totalAmount, totalDiscount: $totalDiscount, orderStatus: $orderStatus, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, createdAt: $createdAt, updatedAt: $updatedAt, __v: $v)';
  }

  @override
  bool operator ==(covariant ViewOrderModel other) {
    if (identical(this, other)) return true;
    // final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.transactionId == transactionId &&
        other.signature == signature &&
        other.user == user &&
        listEquals(other.products, products) &&
        other.totalAmount == totalAmount &&
        other.totalDiscount == totalDiscount &&
        other.orderStatus == orderStatus &&
        other.paymentMethod == paymentMethod &&
        other.paymentStatus == paymentStatus &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        transactionId.hashCode ^
        signature.hashCode ^
        user.hashCode ^
        products.hashCode ^
        totalAmount.hashCode ^
        totalDiscount.hashCode ^
        orderStatus.hashCode ^
        paymentMethod.hashCode ^
        paymentStatus.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}

class Product {
  final String productId;
  final String productName;
  final String imageUrl;
  final String color;
  final int size;
  final int quantity;
  final int actualPrice;
  final int discountedPrice;
  final String id;
  Product({
    required this.productId,
    required this.productName,
    required this.imageUrl,
    required this.color,
    required this.size,
    required this.quantity,
    required this.actualPrice,
    required this.discountedPrice,
    required this.id,
  });

  Product copyWith({
    String? productId,
    String? productName,
    String? imageUrl,
    String? color,
    int? size,
    int? quantity,
    int? actualPrice,
    int? discountedPrice,
    String? id,
  }) {
    return Product(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      imageUrl: imageUrl ?? this.imageUrl,
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
      'image_url': imageUrl,
      'color': color,
      'size': size,
      'quantity': quantity,
      'actual_price': actualPrice,
      'discounted_price': discountedPrice,
      '_id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['product_id'] as String,
      productName: map['productName'] as String,
      imageUrl: map['image_url'] as String,
      color: map['color'] as String,
      size: map['size'] as int,
      quantity: map['quantity'] as int,
      actualPrice: map['actual_price'] as int,
      discountedPrice: map['discounted_price'] as int,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(product_id: $productId, productName: $productName, image_url: $imageUrl, color: $color, size: $size, quantity: $quantity, actual_price: $actualPrice, discounted_price: $discountedPrice, _id: $id)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.productId == productId &&
        other.productName == productName &&
        other.imageUrl == imageUrl &&
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
        imageUrl.hashCode ^
        color.hashCode ^
        size.hashCode ^
        quantity.hashCode ^
        actualPrice.hashCode ^
        discountedPrice.hashCode ^
        id.hashCode;
  }
}
