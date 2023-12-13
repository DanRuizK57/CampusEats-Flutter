import 'package:campus_eats_flutter/src/pages/components/product_card.dart';
import 'package:campus_eats_flutter/src/pages/product_detail_page.dart';
import 'package:flutter/material.dart';

class ProductDetail {
  String? id;
  String? name;
  String? description;
  String? quantity;
  int? price;
  String? photo;
  bool? isFavourite;

  ProductDetail({
    this.id,
    this.name,
    this.description,
    this.quantity,
    this.price,
    this.photo,
    this.isFavourite,
  });

  void updateShowCard(bool value, int price) {
    print('Show card updated - Value: $value, Price: $price');
  }

  List<Widget> _productList(List<dynamic> data, BuildContext context) {
    final List<Widget> products = [];

    data.forEach((product) {
      final tempProduct = ProductCard(
        id: product._id,
        text: product.name,
        price: product.price,
        image: product.photo,
        isFavourite: product.isFavourite,
        showCard: updateShowCard,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                productDetail: product.toProductDetail(),
              ),
            ),
          );
        },
      );
      products.add(tempProduct);
    });
    return products;
  }
}
