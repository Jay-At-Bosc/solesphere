class EndPoints {
  static const String baseUrl =
      "https://solesphere-backend.onrender.com/api/v1/";

  static const String onboard = "${baseUrl}onboard";
  static const String createUser = "${baseUrl}auth/";
  static const String getUser = "${baseUrl}users/";
  static const String addToCart = "${baseUrl}products/add-to-cart/";
  static const String deleteToCart = "${baseUrl}products/delete-cart-item";
  static String orderSummary = "${baseUrl}products/order-summary";
  static String placeOrder = "${baseUrl}orders";
  static String razorpayOrder = "${baseUrl}payments/razorpay-orders";

  static const String productDetail =
      "${baseUrl}products/product-detail?product_id";

//return URL of Detailed Product
  static String getDetailedProduct({required String productID}) =>
      "$productDetail=$productID";
}
