import 'dart:convert';


import 'package:http/http.dart' as http;


class CartRepository {
  var url = "https://solesphere-backend.onrender.com/api/v1/products/get-cart";

  loadCartFromApi() async {
    final response = await http.get(Uri.parse(url), headers: {
      'auth-token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWUxODJmMGE0ODRlNjcwYzY4ODcwNTciLCJlbWFpbCI6ImtpcnRhbmRhdmVAYm9zY3RlY2hsYWJzLmNvbSIsImlhdCI6MTcwOTI3NzkzNn0.apiL-taCwpQs_6KFYYbgMx-ATLNd3RMQQG8YjlHzC68'
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> cartItemsJson = jsonResponse['data']['cartItems'];
     
      return cartItemsJson;
    }
    // var cartData = json.decode(response.body);
    // log(cartData);
  }

  // getProductFromApi(productId) async {
  //   var response = await http.get(Uri.parse(url + productId.toString()));
  //   return json.decode(response.body);
  // }
}
