import 'dart:convert';

class Products {
  final String id;
  final String productName;
  final int actualPrice;
  final int discountedPrice;
  final int colors;
  final int size;
  final Category category;
  final Brand brand;
  final String shortDescription;
  final double avgRating;
  final String image;
  final int totalReview;
  Products({
    required this.id,
    required this.productName,
    required this.actualPrice,
    required this.discountedPrice,
    required this.colors,
    required this.size,
    required this.category,
    required this.brand,
    required this.shortDescription,
    required this.avgRating,
    required this.image,
    required this.totalReview,
  });

  Products copyWith({
    String? id,
    String? productName,
    int? actualPrice,
    int? discountedPrice,
    int? colors,
    int? size,
    Category? category,
    Brand? brand,
    String? shortDescription,
    double? avgRating,
    String? image,
    int? totalReview,
  }) {
    return Products(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      actualPrice: actualPrice ?? this.actualPrice,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      colors: colors ?? this.colors,
      size: size ?? this.size,
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
      'discounted_price': discountedPrice,
      'colors': colors,
      'size': size,
      'category': category.toMap(),
      'brand': brand.toMap(),
      'shortDescription': shortDescription,
      'avgRating': avgRating,
      'image': image,
      'totalReview': totalReview,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      id: map['_id'] as String,
      productName: map['productName'] as String,
      actualPrice: map['actual_price'] is int
          ? map['actual_price'] as int
          : int.tryParse(map['actual_price'].toString()) ?? 0,
      discountedPrice: map['discounted_price'] is int
          ? map['discounted_price'] as int
          : int.tryParse(map['discounted_price'].toString()) ?? 0,
      colors: map['colors'] is int
          ? map['colors'] as int
          : int.tryParse(map['colors'].toString()) ?? 0,
      size: map['size'] is int
          ? map['size'] as int
          : int.tryParse(map['size'].toString()) ?? 0,
      category:
          map['category'] != null && map['category'] is Map<String, dynamic>
              ? Category.fromMap(map['category'] as Map<String, dynamic>)
              : Category(id: '', category: ''),
      brand: map['brand'] != null && map['brand'] is Map<String, dynamic>
          ? Brand.fromMap(map['brand'] as Map<String, dynamic>)
          : Brand(id: '', brand: ''),
      shortDescription: map['shortDescription'] as String,
      avgRating: map['avgRating'] is double
          ? double.parse(map['avgRating'].toStringAsFixed(1))
          : double.tryParse(map['avgRating'].toString()) ?? 0,
      image: map['image'] as String,
      totalReview: map['totalReview'] is int
          ? map['totalReview'] as int
          : int.tryParse(map['totalReview'].toString()) ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Products(_id: $id, productName: $productName, actual_price: $actualPrice, discounted_price: $discountedPrice, colors: $colors,size: $size, category: $category, brand: $brand, shortDescription: $shortDescription, avgRating: $avgRating, image: $image, totalReview: $totalReview)';
  }

  @override
  bool operator ==(covariant Products other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.productName == productName &&
        other.actualPrice == actualPrice &&
        other.discountedPrice == discountedPrice &&
        other.colors == colors &&
        other.size == size &&
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
        discountedPrice.hashCode ^
        colors.hashCode ^
        size.hashCode ^
        category.hashCode ^
        brand.hashCode ^
        shortDescription.hashCode ^
        avgRating.hashCode ^
        image.hashCode ^
        totalReview.hashCode;
  }
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
  Brand({
    required this.id,
    required this.brand,
  });

  Brand copyWith({
    String? id,
    String? brand,
  }) {
    return Brand(
      id: id ?? this.id,
      brand: brand ?? this.brand,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'brand': brand,
    };
  }

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      id: map['_id'] as String,
      brand: map['brand'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Brand.fromJson(String source) =>
      Brand.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Brand(_id: $id, brand: $brand)';

  @override
  bool operator ==(covariant Brand other) {
    if (identical(this, other)) return true;

    return other.id == id && other.brand == brand;
  }

  @override
  int get hashCode => id.hashCode ^ brand.hashCode;
}
