class Products {
  List<Product> items = [];

  Products();

  Products.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (final item in jsonList) {
      final product = new Product.fromJsonMap(item);
      items.add(product);
    }
  }
}

class Product {
  bool? isFavourite;
  String? id;
  String? cafeteria;
  String? name;
  String? description;
  String? quantity;
  int? price;
  String? photo;

  Product({
    this.isFavourite,
    this.id,
    this.cafeteria,
    this.name,
    this.description,
    this.quantity,
    this.price,
    this.photo,
  });

  Product.fromJsonMap(Map<String, dynamic> json) {
    isFavourite = json['isFavourite'];
    id = json['_id'];
    cafeteria = json['cafeteria'];
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    photo = json['photo'];
  }
}
