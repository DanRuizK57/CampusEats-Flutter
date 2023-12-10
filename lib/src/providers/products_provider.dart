import 'dart:convert';

import 'package:campus_eats_flutter/src/models/product_model.dart';

import 'package:http/http.dart' as http;

class ProductsProvider {
  final String ip = "192.168.1.13";

  Future<List<Product>> getProducts() async {
    final url = Uri.http('$ip:3000', '/product/list');
    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final products = new Products.fromJsonList(decodedData["products"]);

    return products.items;
  }

  Future<List<Product>> getFavourites() async {
    final url = Uri.http('$ip:3000', '/product/favourites');
    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final products = new Products.fromJsonList(decodedData["products"]);

    return products.items;
  }
  
  void setFavourite(String productId) async {
    final url =
        Uri.http('$ip:3000', '/product/set-favourite/$productId');
    final response = await http.post(url);
  }

  String getPhotoUrl(String photoId) {
    return "http://$ip:3000/product/photo/$photoId";
  }
}
