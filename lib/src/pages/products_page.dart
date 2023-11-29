import 'package:campus_eats_flutter/src/pages/components/navbar.dart';
import 'package:campus_eats_flutter/src/pages/components/product_card.dart';
import 'package:campus_eats_flutter/src/pages/components/summary_card.dart';
import 'package:campus_eats_flutter/src/pages/product_detail_page.dart';
import 'package:campus_eats_flutter/src/providers/products_provider.dart';
import 'package:flutter/material.dart';
class ProductsPage extends StatefulWidget {

  //const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String _cafeteriaName = 'Casino "Los Notros"';
  bool showCard = false;
  int selectedQuantity = 0;
  int selectedPrice = 0;

  void updateShowCard(bool value, int price) {
    setState(() {
      showCard = value;
      selectedPrice = price;
      selectedQuantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.list_outlined),
          onPressed: () => {},
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 97, 97, 97)),
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
        ],
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _titulo(),
                    _subtitulo(),
                    const SizedBox(height: 20.0),
                    const NavbarComponent(),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: _showCards()),
            ],
          ),
          if (showCard)
            Positioned(
              left: 25.0,
              bottom: 20.0,
              child: summaryCard(selectedQuantity, selectedPrice),
            ),
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
      margin: const EdgeInsetsDirectional.only(start: 20.0, top: 10.0),
      child: Text(
        _cafeteriaName,
        style: const TextStyle(
            fontSize: 16.0, color: Color.fromARGB(255, 97, 97, 97)),
      ),
    );
  }

  Widget _showCards() {
    final productsProvider = new ProductsProvider();
    return FutureBuilder(
      future: productsProvider.getProducts(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          List<Widget> products = _productList(snapshot.data!, context);

          List<TableRow> rows = [];

          for (int i = 0; i < products.length; i += 2) {
            List<Widget> rowProducts = [];

            rowProducts.add(products[i]);

            if (i + 1 < products.length) {
              rowProducts.add(products[i + 1]);
            } else {
              rowProducts.add(Container());
            }

            rows.add(TableRow(children: rowProducts));
          }

          return Table(
            children: rows,
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  List<Widget> _productList(List<dynamic> data, BuildContext context) {
    final List<Widget> products = [];

    data.forEach((product) {
      final tempProduct = ProductCard(
        text: product.name,
        price: product.price,
        image: product.photo,
        isFavourite: product.isFavourite,
        showCard: (bool value, int price) =>
            updateShowCard(true, product.price),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                productDetail: product.toProductDetail(),
              ),
            ),
          );
        },
      );
      products.add(tempProduct);
    });
    return products;
  }
}