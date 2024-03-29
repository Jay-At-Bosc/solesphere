import 'dart:convert';

import 'package:flutter/foundation.dart';

class ViewOrderModel {
  final String id;
  final String transaction_id;
  final String user;
  final List<Product> products;
  final String totalAmount;
  final String orderStatus;
  final bool paymentMethod;
  final String paymentStatus;
  final String createdAt;
  final String updatedAt;
  final int v;
  ViewOrderModel({
    required this.id,
    required this.transaction_id,
    required this.user,
    required this.products,
    required this.totalAmount,
    required this.orderStatus,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  ViewOrderModel copyWith({
    String? id,
    String? transaction_id,
    String? user,
    List<Product>? products,
    String? totalAmount,
    String? orderStatus,
    bool? paymentMethod,
    String? paymentStatus,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return ViewOrderModel(
      id: id ?? this.id,
      transaction_id: transaction_id ?? this.transaction_id,
      user: user ?? this.user,
      products: products ?? this.products,
      totalAmount: totalAmount ?? this.totalAmount,
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
      'transaction_id': transaction_id,
      'user': user,
      'products': products.map((x) => x.toMap()).toList(),
      'totalAmount': totalAmount,
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
      transaction_id: map['transaction_id'] as String,
      user: map['user'] as String,
      products: List<Product>.from(
        (map['products'] as List<dynamic>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalAmount: map['totalAmount'] as String,
      orderStatus: map['orderStatus'] as String,
      paymentMethod: map['paymentMethod'] as bool,
      paymentStatus: map['paymentStatus'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      v: map['__v'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ViewOrderModel.fromJson(String source) =>
      ViewOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ViewOrderModel(_id: $id, transaction_id: $transaction_id, user: $user, products: $products, totalAmount: $totalAmount, orderStatus: $orderStatus, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, createdAt: $createdAt, updatedAt: $updatedAt, __v: $v)';
  }

  @override
  bool operator ==(covariant ViewOrderModel other) {
    if (identical(this, other)) return true;
    // final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.transaction_id == transaction_id &&
        other.user == user &&
        listEquals(other.products, products) &&
        other.totalAmount == totalAmount &&
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
        transaction_id.hashCode ^
        user.hashCode ^
        products.hashCode ^
        totalAmount.hashCode ^
        orderStatus.hashCode ^
        paymentMethod.hashCode ^
        paymentStatus.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}

class Product {
  final String product_id;
  final String productName;
  final String image_url;
  final String color;
  final int size;
  final int quantity;
  final int actual_price;
  final int discounted_price;
  final String id;
  Product({
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

  Product copyWith({
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
    return Product(
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

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
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

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(product_id: $product_id, productName: $productName, image_url: $image_url, color: $color, size: $size, quantity: $quantity, actual_price: $actual_price, discounted_price: $discounted_price, _id: $id)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.product_id == product_id &&
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
