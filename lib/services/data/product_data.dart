// import 'package:solesphere/utils/constants/images.dart';

// import '../models/product_model.dart';

// final List<Product> productsData = [
//   Product(
//     imageUrl: SImages.shoe1,
//     name: "Nike Club Max",
//     description: "Nike clube max",
//     price: 470,
//     discountedPrice: 599,
//     discountPercentage: 11.0,
//     rating: 3.9,
//     reviews: 230,
//     availableColors: ["Black", "White", "Blue"],
//     isFavorite: false,
//     catId: 0,
//   ),
//   Product(
//     imageUrl: SImages.shoe2,
//     name: "Nike Club Pro",
//     description: "Nike Club Pro",
//     price: 899,
//     discountedPrice: 599,
//     discountPercentage: 20.0,
//     rating: 4.2,
//     reviews: 150,
//     availableColors: ["Blue", "Black"],
//     isFavorite: true,
//     catId: 0,
//   ),
//   Product(
//     imageUrl: SImages.shoe3,
//     name: "Nike Air Force",
//     description: "Nike Air Force",
//     price: 699,
//     discountedPrice: 470,
//     discountPercentage: 20.0,
//     rating: 4,
//     reviews: 890,
//     availableColors: ["White", "Black", "Red"],
//     isFavorite: true,
//     catId: 0,
//   ),
//   Product(
//     imageUrl: SImages.shoe4,
//     name: "Nike Air Max",
//     description: "Nike Air Max",
//     price: 899,
//     discountedPrice: 599,
//     discountPercentage: 20.0,
//     rating: 4.3,
//     reviews: 420,
//     availableColors: ["Grey", "Blue", "Black"],
//     isFavorite: false,
//     catId: 0,
//   ),
//   Product(
//     imageUrl: SImages.shoe5,
//     name: "Nike Jordan",
//     description: "Nike Jordan",
//     price: 599,
//     discountedPrice: 470,
//     discountPercentage: 20.0,
//     rating: 4.8,
//     reviews: 370,
//     availableColors: ["Silver", "Black", "Gold"],
//     isFavorite: true,
//     catId: 0,
//   ),
//   Product(
//     imageUrl: SImages.shoe6,
//     name: "Nike Sports",
//     description: "Nike Sports",
//     price: 899,
//     discountedPrice: 599,
//     discountPercentage: 20.0,
//     rating: 4.1,
//     reviews: 180,
//     availableColors: ["Black", "Grey"],
//     isFavorite: false,
//     catId: 0,
//   ),
//   Product(
//     imageUrl: SImages.shoe7,
//     name: "Nike Sports 2",
//     description: "Nike Sports 2",
//     price: 699,
//     discountedPrice: 570,
//     discountPercentage: 20.0,
//     rating: 4.0,
//     reviews: 510,
//     availableColors: ["Black", "Blue", "White"],
//     isFavorite: false,
//     catId: 0,
//   ),
//   Product(
//     imageUrl: SImages.shoe8,
//     name: "Puma Sports Shoes",
//     description: "Puma Sports Shoes",
//     price: 129,
//     discountedPrice: 999,
//     discountPercentage: 20.0,
//     rating: 4.6,
//     reviews: 920,
//     availableColors: ["Black", "Grey", "Blue"],
//     isFavorite: true,
//     catId: 2,
//   ),
//   Product(
//     imageUrl: SImages.shoe9,
//     name: "Adidas Sports",
//     description: "Adidas Sports",
//     price: 999,
//     discountedPrice: 899,
//     discountPercentage: 20.0,
//     rating: 4.4,
//     reviews: 650,
//     availableColors: ["Black", "Brown"],
//     isFavorite: false,
//     catId: 1,
//   ),
//   Product(
//     imageUrl: SImages.shoe10,
//     name: "Reebok",
//     description: "Reebok",
//     price: 799,
//     discountedPrice: 699,
//     discountPercentage: 20.0,
//     rating: 4.9,
//     reviews: 200,
//     availableColors: [],
//     isFavorite: true,
//     catId: 3,
//   ),
// ];


// class Product {
//   final String imageUrl;
//   final String name;
//   final String description;
//   final double price;
//   final double? discountedPrice; // Optional discounted price
//   final double? discountPercentage; // Optional discount percentage
//   final double rating;
//   final int reviews;
//   final int catId;
//   final List<String> availableColors;
//   bool isFavorite;

//   Product( {
//     required this.imageUrl,
//     required this.name,
//     required this.catId,
//     required this.description,
//     required this.price,
//     this.discountedPrice,
//     this.discountPercentage,
//     required this.rating,
//     required this.reviews,
//     required this.availableColors,
//     this.isFavorite = false,
//   });

//   // Getters for calculating discounted price and discount percentage if not provided
//   double get calculatedDiscountedPrice => discountedPrice ?? price;
//   double get calculatedDiscountPercentage => discountPercentage ?? 0.0;

//   // Helper method to check if product has a discount
//   bool get hasDiscount => discountedPrice != null && discountPercentage != null;
// }
