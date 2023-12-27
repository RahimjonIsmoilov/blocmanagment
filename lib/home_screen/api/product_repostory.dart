import 'dart:convert';

import 'package:blocmanagment/home_screen/api/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<ProductModel>> getData() async {
    List<ProductModel> productlist = [];
    final url = Uri.parse("https://fakestoreapi.com/products");
    try { 
      final res = await http.get(url);
      final resData = json.decode(utf8.decode(res.bodyBytes));
      if (res.statusCode == 200) {
        for (final item in resData) {
          productlist.add(ProductModel.fromJson(item));
        }
      } else {
        throw Exception('server error error code ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('server error $e}');
    }
    return productlist;
  }
}
