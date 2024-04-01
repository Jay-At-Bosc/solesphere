import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductDetailModel {
  // final Discount discount;
  final String id;
  final String productName;
  final String shortDescription;
  final String sizeType;
  final List<Variant> variants;
  final String closureType;
  final String material;
  final String longDescription;
  final bool giftPackaging;
  final String qr;
  final String gender;
  final List<Review> review;
  final Category category;
  final Brand brand;
  final bool deleted;
  final String createdAt;
  final String updatedAt;
  final int v;
  ProductDetailModel({
    // required this.discount,
    required this.id,
    required this.productName,
    required this.shortDescription,
    required this.sizeType,
    required this.variants,
    required this.closureType,
    required this.material,
    required this.longDescription,
    required this.giftPackaging,
    required this.qr,
    required this.gender,
    required this.review,
    required this.category,
    required this.brand,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  ProductDetailModel copyWith({
    // Discount? discount,
    String? id,
    String? productName,
    String? shortDescription,
    String? sizeType,
    List<Variant>? variants,
    String? closureType,
    String? material,
    String? longDescription,
    bool? giftPackaging,
    String? qr,
    String? gender,
    List<Review>? review,
    Category? category,
    Brand? brand,
    bool? deleted,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return ProductDetailModel(
      // discount: discount ?? this.discount,
      id: id ?? this.id,
      productName: productName ?? this.productName,
      shortDescription: shortDescription ?? this.shortDescription,
      sizeType: sizeType ?? this.sizeType,
      variants: variants ?? this.variants,
      closureType: closureType ?? this.closureType,
      material: material ?? this.material,
      longDescription: longDescription ?? this.longDescription,
      giftPackaging: giftPackaging ?? this.giftPackaging,
      qr: qr ?? this.qr,
      gender: gender ?? this.gender,
      review: review ?? this.review,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      deleted: deleted ?? this.deleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'discount': discount.toMap(),
      '_id': id,
      'productName': productName,
      'shortDescription': shortDescription,
      'sizeType': sizeType,
      'variants': variants.map((x) => x.toMap()).toList(),
      'closureType': closureType,
      'material': material,
      'longDescription': longDescription,
      'giftPackaging': giftPackaging,
      'qr': qr,
      'gender': gender,
      'review': review.map((x) => x.toMap()).toList(),
      'category': category.toMap(),
      'brand': brand.toMap(),
      'deleted': deleted,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }

  factory ProductDetailModel.fromMap(Map<String, dynamic> map) {
    return ProductDetailModel(
      // discount:
      //     Discount.fromMap(map['discount'] as Map<String, dynamic>? ?? {}),
      id: map['_id'] as String? ?? '',
      productName: map['productName'] as String? ?? '',
      shortDescription: map['shortDescription'] as String? ?? '',
      sizeType: map['sizeType'] as String? ?? '',
      variants: (map['variants'] as List<dynamic>?)
              ?.map<Variant>((x) => Variant.fromMap(x as Map<String, dynamic>))
              .toList() ??
          [],
      closureType: map['closureType'] as String? ?? '',
      material: map['material'] as String? ?? '',
      longDescription: map['longDescription'] as String? ?? '',
      giftPackaging: map['giftPackaging'] as bool? ?? false,
      qr: map['qr'] as String? ?? '',
      gender: map['gender'] as String? ?? '',
      review: (map['review'] as List<dynamic>?)
              ?.map<Review>((x) => Review.fromMap(x as Map<String, dynamic>))
              .toList() ??
          [],
      category:
          Category.fromMap(map['category'] as Map<String, dynamic>? ?? {}),
      brand: Brand.fromMap(map['brand'] as Map<String, dynamic>? ?? {}),
      deleted: map['deleted'] as bool? ?? false,
      createdAt: map['createdAt'] as String? ?? '',
      updatedAt: map['updatedAt'] as String? ?? '',
      v: map['__v']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetailModel.fromJson(String source) =>
      ProductDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductDetailModel( _id: $id, productName: $productName, shortDescription: $shortDescription, sizeType: $sizeType, variants: $variants, closureType: $closureType, material: $material, longDescription: $longDescription, giftPackaging: $giftPackaging, qr: $qr, gender: $gender, review: $review, category: $category, brand: $brand, deleted: $deleted, createdAt: $createdAt, updatedAt: $updatedAt, __v: $v)';
  }

  @override
  bool operator ==(covariant ProductDetailModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.productName == productName &&
        other.shortDescription == shortDescription &&
        other.sizeType == sizeType &&
        listEquals(other.variants, variants) &&
        other.closureType == closureType &&
        other.material == material &&
        other.longDescription == longDescription &&
        other.giftPackaging == giftPackaging &&
        other.qr == qr &&
        other.gender == gender &&
        listEquals(other.review, review) &&
        other.category == category &&
        other.brand == brand &&
        other.deleted == deleted &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productName.hashCode ^
        shortDescription.hashCode ^
        sizeType.hashCode ^
        variants.hashCode ^
        closureType.hashCode ^
        material.hashCode ^
        longDescription.hashCode ^
        giftPackaging.hashCode ^
        qr.hashCode ^
        gender.hashCode ^
        review.hashCode ^
        category.hashCode ^
        brand.hashCode ^
        deleted.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}

// class Discount {
//   final String startDate;
//   final int discount;
//   final String endDate;
//   Discount({
//     required this.startDate,
//     required this.discount,
//     required this.endDate,
//   });

//   Discount copyWith({
//     String? startDate,
//     int? discount,
//     String? endDate,
//   }) {
//     return Discount(
//       startDate: startDate ?? this.startDate,
//       discount: discount ?? this.discount,
//       endDate: endDate ?? this.endDate,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'startDate': startDate,
//       'discount': discount,
//       'endDate': endDate,
//     };
//   }

//   factory Discount.fromMap(Map<String, dynamic> map) {
//     return Discount(
//       startDate: map['startDate'] as String,
//       discount: map['discount'].toInt() as int,
//       endDate: map['endDate'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Discount.fromJson(String source) =>
//       Discount.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() =>
//       'Discount(startDate: $startDate, discount: $discount, endDate: $endDate)';

//   @override
//   bool operator ==(covariant Discount other) {
//     if (identical(this, other)) return true;

//     return other.startDate == startDate &&
//         other.discount == discount &&
//         other.endDate == endDate;
//   }

//   @override
//   int get hashCode => startDate.hashCode ^ discount.hashCode ^ endDate.hashCode;
// }

class Variant {
  final String color;
  final List<String> imageUrls;
  final List<Size> sizes;
  final String id;
  Variant({
    required this.color,
    required this.imageUrls,
    required this.sizes,
    required this.id,
  });

  Variant copyWith({
    String? color,
    List<String>? imageUrls,
    List<Size>? sizes,
    String? id,
  }) {
    return Variant(
      color: color ?? this.color,
      imageUrls: imageUrls ?? this.imageUrls,
      sizes: sizes ?? this.sizes,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'image_urls': imageUrls,
      'sizes': sizes.map((x) => x.toMap()).toList(),
      '_id': id,
    };
  }

  factory Variant.fromMap(Map<String, dynamic> map) {
    return Variant(
      color: map['color'] as String,
      imageUrls: List<String>.from(map['image_urls'] as List<dynamic>),
      sizes: List<Size>.from(
        (map['sizes'] as List<dynamic>).map<Size>(
          (size) => Size.fromMap(size as Map<String, dynamic>),
        ),
      ),
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Variant.fromJson(String source) =>
      Variant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Variant(color: $color, image_urls: $imageUrls, sizes: $sizes, _id: $id)';
  }

  @override
  bool operator ==(covariant Variant other) {
    if (identical(this, other)) return true;

    return other.color == color &&
        listEquals(other.imageUrls, imageUrls) &&
        listEquals(other.sizes, sizes) &&
        other.id == id;
  }

  @override
  int get hashCode {
    return color.hashCode ^ imageUrls.hashCode ^ sizes.hashCode ^ id.hashCode;
  }
}

class Size {
  final int size;
  final int actual_price;
  final int discounted_price;
  final int stock;
  final String id;
  Size({
    required this.size,
    required this.actual_price,
    required this.discounted_price,
    required this.stock,
    required this.id,
  });

  Size copyWith({
    int? size,
    int? actual_price,
    int? discounted_price,
    int? stock,
    String? id,
  }) {
    return Size(
      size: size ?? this.size,
      actual_price: actual_price ?? this.actual_price,
      discounted_price: discounted_price ?? this.discounted_price,
      stock: stock ?? this.stock,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'size': size,
      'actual_price': actual_price,
      'discounted_price': discounted_price,
      'stock': stock,
      '_id': id,
    };
  }

  factory Size.fromMap(Map<String, dynamic> map) {
    return Size(
      size: map['size'].toInt() as int,
      actual_price: map['actual_price'].toInt() as int,
      discounted_price: map['discounted_price'].toInt() as int,
      stock: map['stock'].toInt() as int,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Size.fromJson(String source) =>
      Size.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Size(size: $size, actual_price: $actual_price, discounted_price: $discounted_price, stock: $stock, _id: $id)';
  }

  @override
  bool operator ==(covariant Size other) {
    if (identical(this, other)) return true;

    return other.size == size &&
        other.actual_price == actual_price &&
        other.discounted_price == discounted_price &&
        other.stock == stock &&
        other.id == id;
  }

  @override
  int get hashCode {
    return size.hashCode ^
        actual_price.hashCode ^
        discounted_price.hashCode ^
        stock.hashCode ^
        id.hashCode;
  }
}

class Review {
  final String id;
  final User user;
  final int rating;
  final String review;
  final List<dynamic> images;
  Review({
    required this.id,
    required this.user,
    required this.rating,
    required this.review,
    required this.images,
  });

  Review copyWith({
    String? id,
    User? user,
    int? rating,
    String? review,
    List<dynamic>? images,
  }) {
    return Review(
      id: id ?? this.id,
      user: user ?? this.user,
      rating: rating ?? this.rating,
      review: review ?? this.review,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'user': user.toMap(),
      'rating': rating,
      'review': review,
      'images': images,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      id: map['_id'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      rating: map['rating'].toInt() as int,
      review: map['review'] as String,
      images: List<dynamic>.from(
        (map['images'] as List<dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) =>
      Review.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Review(_id: $id, user: $user, rating: $rating, review: $review, images: $images)';
  }

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.user == user &&
        other.rating == rating &&
        other.review == review &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user.hashCode ^
        rating.hashCode ^
        review.hashCode ^
        images.hashCode;
  }
}

class User {
  final String id;
  final String username;
  final String profilePic;
  User({
    required this.id,
    required this.username,
    required this.profilePic,
  });

  User copyWith({
    String? id,
    String? username,
    String? profilePic,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'username': username,
      'profilePic': profilePic,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      username: map['username'] as String,
      profilePic: map['profilePic'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(_id: $id, username: $username, profilePic: $profilePic)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.profilePic == profilePic;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ profilePic.hashCode;
}

class Category {
  final String id;
  final String category;
  Category({
    required this.id,
    required this.category,
  });

  Category copyWith({
    String? id,
    String? category,
  }) {
    return Category(
      id: id ?? this.id,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'category': category,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['_id'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Category(_id: $id, category: $category)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id && other.category == category;
  }

  @override
  int get hashCode => id.hashCode ^ category.hashCode;
}

class Brand {
  final String id;
  final String brand;
  final String brandIcon;
  Brand({
    required this.id,
    required this.brand,
    required this.brandIcon,
  });

  Brand copyWith({
    String? id,
    String? brand,
    String? brandIcon,
  }) {
    return Brand(
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

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      id: map['_id'] as String,
      brand: map['brand'] as String,
      brandIcon: map['brandIcon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Brand.fromJson(String source) =>
      Brand.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Brand(_id: $id, brand: $brand, brandIcon: $brandIcon)';

  @override
  bool operator ==(covariant Brand other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.brand == brand &&
        other.brandIcon == brandIcon;
  }

  @override
  int get hashCode => id.hashCode ^ brand.hashCode ^ brandIcon.hashCode;
}
