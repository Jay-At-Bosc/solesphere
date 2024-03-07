class Product {
  final String imageUrl;
  final String name;
  final String description;
  final double price;
  final double? discountedPrice; // Optional discounted price
  final double? discountPercentage; // Optional discount percentage
  final double rating;
  final int reviews;
  final List<String> availableColors;
   bool isFavorite;

   Product({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    this.discountedPrice,
    this.discountPercentage,
    required this.rating,
    required this.reviews,
    required this.availableColors,
    this.isFavorite = false,
  });

  // Getters for calculating discounted price and discount percentage if not provided
  double get calculatedDiscountedPrice => discountedPrice ?? price;
  double get calculatedDiscountPercentage => discountPercentage ?? 0.0;

  // Helper method to check if product has a discount
  bool get hasDiscount => discountedPrice != null && discountPercentage != null;
}
