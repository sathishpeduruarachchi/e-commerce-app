import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<List> getAllProducts() async {
    var url = Uri.https('fakestoreapi.com', 'products');
    var response = await http.get(url);
    return jsonDecode(response.body);
  }

  static Future<List> getCategories() async {
    var url = Uri.https('fakestoreapi.com', 'products/categories');
    var response = await http.get(url);
    return jsonDecode(response.body);
  }

  static Future<List> getProductsByCategory({required String category}) async {
    var url = Uri.https('fakestoreapi.com', 'products/category/$category');
    var response = await http.get(url);
    return jsonDecode(response.body);
  }
}
