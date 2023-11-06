import 'package:campus_eats_flutter/src/pages/components/summary_card.dart';
import 'package:campus_eats_flutter/src/utils/color_changing_button.dart';
import 'package:campus_eats_flutter/src/utils/quantity_selector.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://tofuu.getjusto.com/orioneat-prod-resized/pRKafvYDckbMYP3nG-1200-1200.webp"),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 320, right: 16, left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop(); // Navegar hacia atrás
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          ColorChangingButton(), // Agrega el botón personalizado
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Pedazo de torta",
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 18, // Ajusta el tamaño del icono a tu gusto
                      height: 18, // Ajusta el tamaño del icono a tu gusto
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 9, // Ajusta el tamaño del icono
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$2.000",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    QuantitySelector(
                      initialValue: selectedQuantity,
                      onChanged: (newQuantity) {
                        setState(() {
                          selectedQuantity = newQuantity;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 70),
                Text(
                  "Disfruta de un exquisito postre de tarta con una deliciosa combinación de frambuesas y arándanos. Nuestra tarta de frutas frescas es la opción perfecta para satisfacer tu antojo de dulzura con un toque de acidez. ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          summaryCard(selectedQuantity, 2000)
        ],
      ),
    );
  }
}
