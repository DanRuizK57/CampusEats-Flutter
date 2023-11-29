import 'dart:convert';

import 'package:campus_eats_flutter/src/models/product_model.dart';

import 'package:http/http.dart' as http;

class ProductsProvider {
  Future<List<Product>> getProducts() async {
    final url = Uri.http('172.40.196.77:3000', '/product/list');
    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final products = new Products.fromJsonList(decodedData["products"]);

    return products.items;
  }

  Future<List<Product>> getFavourites() async {
    final url = Uri.http('172.40.196.77:3000', '/product/favourites');
    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final products = new Products.fromJsonList(decodedData["products"]);

    return products.items;
  }
}
