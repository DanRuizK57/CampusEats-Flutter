import 'package:flutter/material.dart';

Widget getNavbar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _navbarElement(context, Icon(Icons.home), "/list"),
      _navbarElement(context, Icon(Icons.favorite), "/favourites"),
      _navbarElement(context, Icon(Icons.filter_alt), ""),
      _navbarElement(context, Icon(Icons.shopping_cart), ""),
    ],
  );
}

Widget _navbarElement(BuildContext context, Icon icono, String route) {
  return Card(
    // Sombra de los bordes
    elevation: 10.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0), side: BorderSide()),
    margin: EdgeInsets.only(right: 30.0),
    child: Column(
      children: [
        IconButton(
            icon: icono,
            color: Color.fromARGB(255, 117, 117, 117),
            onPressed: () {
              Navigator.pushNamed(context, route);
            })
      ],
    ),
  );
}
