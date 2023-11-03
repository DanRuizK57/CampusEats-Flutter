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
      body: Column(
        children: [
          _titulo(),
          _subtitulo(),
        ],
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
      margin: const EdgeInsetsDirectional.only(start: 10.0, top: 10.0),
      child: Text(
        _cafeteriaName,
        style: const TextStyle(
            fontSize: 15.0, color: Color.fromARGB(255, 97, 97, 97)),
      ),
    );
  }
}
