import 'package:campus_eats_flutter/src/models/product_detail.dart';
import 'package:campus_eats_flutter/src/pages/favourite_products_page.dart';
import 'package:campus_eats_flutter/src/pages/product_detail_page.dart';
import 'package:campus_eats_flutter/src/pages/products_page.dart';
import 'package:campus_eats_flutter/src/routes/pages.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    Pages.productsList: (context) =>  ProductsPage(),
    Pages.productDetail: (context) => ProductDetailPage(productDetail:ProductDetail()),

    Pages.favourites: (context) => const FavouriteProductsPage(),
  };
}
