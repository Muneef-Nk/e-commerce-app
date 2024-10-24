import 'dart:convert';
import 'package:ecommerce_app/api/api.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:http/http.dart' as http;

class GetProduct {
  static Future<List<ProductModel>> fetchProducts() async {
    var url = ApiConfig.baseUrl + ApiConfig.endPoint;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List decodedData = jsonDecode(response.body);

        return decodedData
            .map((product) => ProductModel.fromJson(product))
            .toList();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  static String getImage(String id) {
    return "https://picsum.photos/150/150?random=${id}";
  }
}
