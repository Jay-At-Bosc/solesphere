import 'dart:convert';

import 'package:flutter/foundation.dart';

class OrderSummaryModel {
  final Address address;
  final String paymentMethod;
  final int totalActualAmount;
  final int totalDiscountedAmount;
  final int totalDiscount;
  final int deliveryCharge;
  final List<CartItem> cartItems;
  OrderSummaryModel({
    required this.address,
    required this.paymentMethod,
    required this.totalActualAmount,
    required this.totalDiscountedAmount,
    required this.totalDiscount,
    required this.deliveryCharge,
    required this.cartItems,
  });

  OrderSummaryModel copyWith({
    Address? address,
    String? paymentMethod,
    int? totalActualAmount,
    int? totalDiscountedAmount,
    int? totalDiscount,
    int? deliveryCharge,
    List<CartItem>? cartItems,
  }) {
    return OrderSummaryModel(
      address: address ?? this.address,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      totalActualAmount: totalActualAmount ?? this.totalActualAmount,
      totalDiscountedAmount:
          totalDiscountedAmount ?? this.totalDiscountedAmount,
      totalDiscount: totalDiscount ?? this.totalDiscount,
      deliveryCharge: deliveryCharge ?? this.deliveryCharge,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address.toMap(),
      'paymentMethod': paymentMethod,
      'TotalActualAmount': totalActualAmount,
      'TotalDiscountedAmount': totalDiscountedAmount,
      'totalDiscount': totalDiscount,
      'deliveryCharge': deliveryCharge,
      'cartItems': cartItems.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderSummaryModel.fromMap(Map<String, dynamic> map) {
    return OrderSummaryModel(
      address: Address.fromMap(map['address'] as Map<String, dynamic>),
      paymentMethod: map['paymentMethod'] as String,
      totalActualAmount: map['TotalActualAmount'].toInt() as int,
      totalDiscountedAmount: map['TotalDiscountedAmount'].toInt() as int,
      totalDiscount: map['totalDiscount'].toInt() as int,
      deliveryCharge: map['deliveryCharge'].toInt() as int,
      cartItems: (map['cartItems'] as List<dynamic>)
          .map<CartItem>(
              (item) => CartItem.fromMap(item as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderSummaryModel.fromJson(String source) =>
      OrderSummaryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderSummaryModel(address: $address, paymentMethod: $paymentMethod, TotalActualAmount: $totalActualAmount, TotalDiscountedAmount: $totalDiscountedAmount, totalDiscount: $totalDiscount, deliveryCharge: $deliveryCharge, cartItems: $cartItems)';
  }

  @override
  bool operator ==(covariant OrderSummaryModel other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.paymentMethod == paymentMethod &&
        other.totalActualAmount == totalActualAmount &&
        other.totalDiscountedAmount == totalDiscountedAmount &&
        other.totalDiscount == totalDiscount &&
        other.deliveryCharge == deliveryCharge &&
        listEquals(other.cartItems, cartItems);
  }

  @override
  int get hashCode {
    return address.hashCode ^
        paymentMethod.hashCode ^
        totalActualAmount.hashCode ^
        totalDiscountedAmount.hashCode ^
        totalDiscount.hashCode ^
        deliveryCharge.hashCode ^
        cartItems.hashCode;
  }
}

class Address {
  final String house;
  final String area;
  final int pincode;
  final String town;
  final String state;
  final String adType;
  final String id;
  Address({
    required this.house,
    required this.area,
    required this.pincode,
    required this.town,
    required this.state,
    required this.adType,
    required this.id,
  });

  Address copyWith({
    String? house,
    String? area,
    int? pincode,
    String? town,
    String? state,
    String? adType,
    String? id,
  }) {
    return Address(
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

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
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

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(house: $house, area: $area, pincode: $pincode, town: $town, state: $state, adType: $adType, _id: $id)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;

    return other.house == house &&
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

class CartItem {
  final String productId;
  final String productName;
  final String imgUrl;
  final String color;
  final int size;
  final int quantity;
  final int actual_price;
  final int discounted_price;
  final String id;
  CartItem({
    required this.productId,
    required this.productName,
    required this.imgUrl,
    required this.color,
    required this.size,
    required this.quantity,
    required this.actual_price,
    required this.discounted_price,
    required this.id,
  });

  CartItem copyWith({
    String? productId,
    String? productName,
    String? imgUrl,
    String? color,
    int? size,
    int? quantity,
    int? actual_price,
    int? discounted_price,
    String? id,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      imgUrl: imgUrl ?? this.imgUrl,
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
      'product_id': productId,
      'productName': productName,
      'image_url': imgUrl,
      'color': color,
      'size': size,
      'quantity': quantity,
      'actual_price': actual_price,
      'discounted_price': discounted_price,
      '_id': id,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      productId: map['product_id'] as String,
      productName: map['productName'] as String,
      imgUrl: map['image_url'] as String,
      color: map['color'] as String,
      size: map['size'].toInt() as int,
      quantity: map['quantity'].toInt() as int,
      actual_price: map['actual_price'].toInt() as int,
      discounted_price: map['discounted_price'].toInt() as int,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartItem(product_id: $productId, productName: $productName, image_url: $imgUrl, color: $color, size: $size, quantity: $quantity, actual_price: $actual_price, discounted_price: $discounted_price, _id: $id)';
  }

  @override
  bool operator ==(covariant CartItem other) {
    if (identical(this, other)) return true;

    return other.productId == productId &&
        other.productName == productName &&
        other.imgUrl == imgUrl &&
        other.color == color &&
        other.size == size &&
        other.quantity == quantity &&
        other.actual_price == actual_price &&
        other.discounted_price == discounted_price &&
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
        actual_price.hashCode ^
        discounted_price.hashCode ^
        id.hashCode;
  }
}
