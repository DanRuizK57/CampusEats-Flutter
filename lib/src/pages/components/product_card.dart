import 'package:campus_eats_flutter/src/pages/products_page.dart';
import 'package:campus_eats_flutter/src/routes/pages.dart';
import 'package:flutter/material.dart';

Widget addCard(BuildContext context, String text, int price, String image,
    bool isFavourite) {
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
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Alinea los íconos a la derecha
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.0), // Margen izquierdo
              child: Icon(
                Icons.circle_outlined,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: getColorFavourite(isFavourite),
              ),
            ),
          ],
        ),
        GestureDetector(
          child: CircleAvatar(
            backgroundImage: NetworkImage("$image"),
            radius: 75.0,
            backgroundColor: Color.fromRGBO(224, 224, 224, 1),
          ),
          onTap: () {
            Navigator.pushNamed(context, Pages.productDetail);
          },
        ),
        SizedBox(height: 10.0),
        Text(
          text,
          style: TextStyle(
              color: Color.fromRGBO(73, 73, 73, 1),
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Alinea el botón a la derecha
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 20.0), // Margen izquierdo del precio
              child: Text(
                "\$ $price",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              onPressed: () {
                addProduct = true;
                print(addProduct);
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
