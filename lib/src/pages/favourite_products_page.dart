import 'package:flutter/material.dart';

class FavouriteProductsPage extends StatefulWidget {
  const FavouriteProductsPage({super.key});

  @override
  State<FavouriteProductsPage> createState() => _FavouriteProductsPageState();
}

class _FavouriteProductsPageState extends State<FavouriteProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
      ),
    );
  }
}
