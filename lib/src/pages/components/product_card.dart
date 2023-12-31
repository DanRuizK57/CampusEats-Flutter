import 'package:campus_eats_flutter/src/providers/products_provider.dart';
import 'package:campus_eats_flutter/src/routes/pages.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String id;
  final String text;
  final int price;
  final String image;
  final bool isFavourite;

  void Function(bool, int) showCard;
  void Function() onTap;

  ProductCard({
    required this.id,
    required this.text,
    required this.price,
    required this.image,
    required this.isFavourite,
    required this.showCard,
    required this.onTap,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final productsProvider = new ProductsProvider();
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = new ProductsProvider();
    return Container(
      height: 320.0,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Color.fromARGB(0, 255, 255, 255),
          borderRadius: BorderRadius.circular(20.0),
          border:
              Border.all(color: Color.fromRGBO(224, 224, 224, 1), width: 2.0)),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: const Icon(
                  Icons.circle_outlined,
                  color: Colors.green,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: isFavourite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isFavourite = !isFavourite;
                    productsProvider.setFavourite(widget.id);
                  });
                },
              ),
            ],
          ),
          GestureDetector(
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(productsProvider.getPhotoUrl(widget.image)),
              radius: 75.0,
              backgroundColor: const Color.fromRGBO(224, 224, 224, 1),
            ),
            onTap: () {
              widget.onTap();
            },
          ),
          const SizedBox(height: 10.0),
          Text(widget.text,
              style: const TextStyle(
                color: Color.fromRGBO(73, 73, 73, 1),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "\$ ${widget.price}",
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.showCard(true, widget.price);
                  });
                },
                icon: const Icon(
                  Icons.add_circle_rounded,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
