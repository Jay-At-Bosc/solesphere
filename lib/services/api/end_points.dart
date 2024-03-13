class EndPoints {
  static const String authBaseUrl = "";
  static const String dbBaseUrl =
      "https://solesphere-backend.onrender.com/api/v1/";

  static const String onboard = "$dbBaseUrl/onboard";
  static const String productDetail =
      "$dbBaseUrl/products/product-detail?product_id";

//return URL of Detailed Product
  static String getDetailedProduct({required String productID}) =>
      "$productDetail=$productID";
}
