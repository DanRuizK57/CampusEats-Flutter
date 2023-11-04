import 'dart:ui';

import 'package:campus_eats_flutter/src/pages/components/navbar.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _HomePageState();
}

class _HomePageState extends State<ProductsPage> {
  String _cafeteriaName = "Casino Los Notros";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.list_outlined),
            onPressed: () => {},
          ),
          backgroundColor: Colors.white,
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 97, 97, 97)),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Acción cuando se presiona el icono derecho
                },
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titulo(),
            _subtitulo(),
            const SizedBox(height: 20.0),
            getNavbar(context),
            const SizedBox(height: 20.0),
            _showCards(),
            _showCards()
          ],
        ),
      ),
    );
  }

  Widget _titulo() {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 20.0, start: 20.0),
      child: const Text(
        "Productos",
        style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 97, 97, 97)),
      ),
    );
  }

  Widget _subtitulo() {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 20.0, top: 10.0),
      child: Text(
        _cafeteriaName,
        style: const TextStyle(
            fontSize: 16.0, color: Color.fromARGB(255, 97, 97, 97)),
      ),
    );
  }

  Widget _showCards() {
    return Table(
      children: [
        TableRow(children: [
          _addCard('Pedazo de torta', 2000,
              "https://tofuu.getjusto.com/orioneat-prod-resized/pRKafvYDckbMYP3nG-1200-1200.webp"),
          _addCard('Café de máquina', 1200,
              "https://saludos.cualtis.com/wp-content/uploads/2022/05/Cafe-en-vaso-de-papel.jpg"),
        ]),
      ],
    );
  }

  Widget _addCard(String text, int price, String image) {
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
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Alinea los íconos a la derecha
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0), // Margen izquierdo
                child: Icon(
                  Icons.circle_outlined,
                  color: Color.fromARGB(255, 102, 190, 1),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Color.fromRGBO(165, 164, 164, 1),
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundImage: NetworkImage("$image"),
            radius: 75.0,
            backgroundColor: Color.fromRGBO(224, 224, 224, 1),
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
                      color: const Color.fromARGB(255, 102, 190, 1),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/product");
                },
                icon: Icon(
                  Icons.add_circle_rounded,
                  color: const Color.fromARGB(255, 102, 190, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
