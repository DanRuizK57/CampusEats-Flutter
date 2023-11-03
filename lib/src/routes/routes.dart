import 'package:campus_eats_flutter/src/pages/favourite_products_page.dart';
import 'package:campus_eats_flutter/src/pages/product_detail_page.dart';
import 'package:campus_eats_flutter/src/pages/products_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "/list": (context) => const ProductsPage(),
    "/product": (context) => const ProductDetailPage(),
    "/favourites": (context) => const FavouriteProductsPage(),
  };
}
