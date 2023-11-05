import 'package:campus_eats_flutter/src/pages/product_detail_page.dart';
import 'package:campus_eats_flutter/src/routes/routes.dart';
import 'package:flutter/material.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Eats App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/product",
      routes: getApplicationRoutes(),
      // Ruta a la que va por defecto
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProductDetailPage());
      },
    );
  }
}
