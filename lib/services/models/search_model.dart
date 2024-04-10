import 'dart:convert';

import 'package:flutter/foundation.dart';

class SearchModel {
  final List<ResponseData> responseData;
  final int totalProducts;
  SearchModel({
    required this.responseData,
    required this.totalProducts,
  });

  SearchModel copyWith({
    List<ResponseData>? responseData,
    int? totalProducts,
  }) {
    return SearchModel(
      responseData: responseData ?? this.responseData,
      totalProducts: totalProducts ?? this.totalProducts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'responseData': responseData.map((x) => x.toMap()).toList(),
      'totalProducts': totalProducts,
    };
  }

  factory SearchModel.fromMap(Map<String, dynamic> map) {
    return SearchModel(
      responseData: List<ResponseData>.from((map['responseData'] as List<int>).map<ResponseData>((x) => ResponseData.fromMap(x as Map<String,dynamic>),),),
      totalProducts: map['totalProducts'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchModel.fromJson(String source) => SearchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SearchModel(responseData: $responseData, totalProducts: $totalProducts)';

  @override
  bool operator ==(covariant SearchModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.responseData, responseData) &&
      other.totalProducts == totalProducts;
  }

  @override
  int get hashCode => responseData.hashCode ^ totalProducts.hashCode;

  void clear() {}
}

class ResponseData {
  final String id;
  final String productName;
  final int actualPrice;
  final int size;
  final int discountedPrice;
  final int colors;
  final String category;
  final String brand;
  final String shortDescription;
  final double avgRating;
  final String image;
  final int totalReview;
  ResponseData({
    required this.id,
    required this.productName,
    required this.actualPrice,
    required this.size,
    required this.discountedPrice,
    required this.colors,
    required this.category,
    required this.brand,
    required this.shortDescription,
    required this.avgRating,
    required this.image,
    required this.totalReview,
  });

  ResponseData copyWith({
    String? id,
    String? productName,
    int? actualPrice,
    int? size,
    int? discountedPrice,
    int? colors,
    String? category,
    String? brand,
    String? shortDescription,
    double? avgRating,
    String? image,
    int? totalReview,
  }) {
    return ResponseData(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      actualPrice: actualPrice ?? this.actualPrice,
      size: size ?? this.size,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      colors: colors ?? this.colors,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      shortDescription: shortDescription ?? this.shortDescription,
      avgRating: avgRating ?? this.avgRating,
      image: image ?? this.image,
      totalReview: totalReview ?? this.totalReview,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'productName': productName,
      'actual_price': actualPrice,
      'size': size,
      'discounted_price': discountedPrice,
      'colors': colors,
      'category': category,
      'brand': brand,
      'shortDescription': shortDescription,
      'avgRating': avgRating,
      'image': image,
      'totalReview': totalReview,
    };
  }

  factory ResponseData.fromMap(Map<String, dynamic> map) {
    return ResponseData(
      id: map['_id'] as String,
      productName: map['productName'] as String,
      actualPrice: map['actual_price'].toInt() as int,
      size: map['size'].toInt() as int,
      discountedPrice: map['discounted_price'].toInt() as int,
      colors: map['colors'].toInt() as int,
      category: map['category'] as String,
      brand: map['brand'] as String,
      shortDescription: map['shortDescription'] as String,
      avgRating: map['avgRating'].toDouble() as double,
      image: map['image'] as String,
      totalReview: map['totalReview'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseData.fromJson(String source) => ResponseData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResponseData(_id: $id, productName: $productName, actual_price: $actualPrice, size: $size, discounted_price: $discountedPrice, colors: $colors, category: $category, brand: $brand, shortDescription: $shortDescription, avgRating: $avgRating, image: $image, totalReview: $totalReview)';
  }

  @override
  bool operator ==(covariant ResponseData other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.productName == productName &&
      other.actualPrice == actualPrice &&
      other.size == size &&
      other.discountedPrice == discountedPrice &&
      other.colors == colors &&
      other.category == category &&
      other.brand == brand &&
      other.shortDescription == shortDescription &&
      other.avgRating == avgRating &&
      other.image == image &&
      other.totalReview == totalReview;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      productName.hashCode ^
      actualPrice.hashCode ^
      size.hashCode ^
      discountedPrice.hashCode ^
      colors.hashCode ^
      category.hashCode ^
      brand.hashCode ^
      shortDescription.hashCode ^
      avgRating.hashCode ^
      image.hashCode ^
      totalReview.hashCode;
  }
}