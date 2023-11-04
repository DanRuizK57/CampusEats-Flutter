import 'package:flutter/material.dart';

Widget getNavbar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _navbarElement(Icon(Icons.home)),
      _navbarElement(Icon(Icons.favorite)),
      _navbarElement(Icon(Icons.filter_alt)),
      _navbarElement(Icon(Icons.shopping_cart)),
    ],
  );
}

Widget _navbarElement(Icon icono) {
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
            color: Color.fromARGB(255, 97, 97, 97),
            onPressed: () {})
      ],
    ),
  );
}
