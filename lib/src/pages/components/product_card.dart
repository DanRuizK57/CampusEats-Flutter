import 'package:campus_eats_flutter/src/pages/products_page.dart';
import 'package:campus_eats_flutter/src/routes/pages.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String text;
  final int price;
  final String image;
  final bool isFavourite;

  final Function(bool) showCard;

  ProductCard({
    required this.text,
    required this.price,
    required this.image,
    required this.isFavourite,
    required this.showCard,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(224, 224, 224, 1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.circle_outlined,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: getColorFavourite(widget.isFavourite),
                ),
              ),
            ],
          ),
          GestureDetector(
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.image),
              radius: 75.0,
              backgroundColor: Color.fromRGBO(224, 224, 224, 1),
            ),
            onTap: () {
              Navigator.pushNamed(context, Pages.productDetail);
            },
          ),
          SizedBox(height: 10.0),
          Text(
            widget.text,
            style: TextStyle(
              color: Color.fromRGBO(73, 73, 73, 1),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "\$ ${widget.price}",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.showCard(true);
                  });
                },
                icon: Icon(
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

  Color getColorFavourite(bool isFavourite) {
    if (isFavourite) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}
