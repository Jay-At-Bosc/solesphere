class EndPoints {
  static const String baseUrl =
      "https://solesphere-backend.onrender.com/api/v1/";

  static const String onboard = "${baseUrl}onboard";
  static const String isUser = "${baseUrl}auth/isuser";
  static const String userDetail = "${baseUrl}users/";
  static const String addToFavorite = "${baseUrl}users/add-to-wishlist";
  static const String getFavorite = "${baseUrl}users/wishlist";
  static const String userProfilePicture = "${baseUrl}users/profile";
  static const String getUser = "${baseUrl}users/";
  static const String addToCart = "${baseUrl}products/add-to-cart/";
  static const String deleteToCart = "${baseUrl}products/delete-cart-item";
  static String orderSummary = "${baseUrl}products/order-summary";
  static String placeOrder = "${baseUrl}orders";
  static String razorpayOrder = "${baseUrl}payments/razorpay-orders";
  static String userOrders = "${baseUrl}orders";
  static String updateAddress = "${baseUrl}users/update-address";
  static String deleteAddress = "${baseUrl}users/address";
  static String search = "${baseUrl}products/search";
  static String review = "${baseUrl}products/reviews";

  static const String productDetail =
      "${baseUrl}products/product-detail?product_id";

//return URL of Detailed Product
  static String getDetailedProduct({required String productID}) =>
      "$productDetail=$productID";
}
