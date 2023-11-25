import 'dart:convert';

import 'package:campus_eats_flutter/src/models/product_model.dart';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

class ProductsProvider {
  final dio = Dio();

  Future<List<Product>> getProducts() async {
    final url = Uri.http('192.168.56.1:3000', '/product/list');
    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final products = new Products.fromJsonList(decodedData["products"]);

    return products.items;
  }

  Future<List<Product>> getFavourites() async {
    final url = Uri.http('192.168.56.1:3000', '/product/favourites');
    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final products = new Products.fromJsonList(decodedData["products"]);

    return products.items;
  }
}
