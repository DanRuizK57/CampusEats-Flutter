// Manejo del archivo JSON

// Se usa show para sólo cargar 1 elemento y no todo el paquete completo
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _ProductsProvider {
  List<dynamic> products = [];

  _ProductsProvider() {
    loadData();
  }

  // Cargar datos del json
  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/products.json');
    /* Se obtiene un string de data, con lo cual se necesita transformar a Map
      para poder obtener los datos */
    Map dataMap = jsonDecode(resp);
    products = dataMap["products"];

    return products;
  }
}

// Esta clase sólo devuelve esta instancia
final productsProvider = _ProductsProvider();
