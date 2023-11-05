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
                image: AssetImage("assets/imagen/imagen-2.jpg"),
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
                          color: Colors.white,
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
                      "Coulis de Frambuesa",
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
                      "\$1.400",
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
                SizedBox(height: 40),
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
          Container(
            margin: EdgeInsets.only(top: 35.0),
            child: Container(
              width: 360, // Ancho del contenedor
              height: 50, // Altura del contenedor
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      6.0), // Redondear esquina superior izquierda
                  topRight: Radius.circular(
                      6.0), // Redondear esquina superior derecha
                  bottomLeft: Radius.circular(
                      43.0), // Redondear esquina inferior izquierda
                  bottomRight: Radius.circular(
                      43.0), // Redondear esquina inferior derecha
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceAround, // Espacio uniforme entre los elementos
                  children: [
                    Text(
                      "$selectedQuantity productos", // Muestra la cantidad seleccionada
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "\$${selectedQuantity * 1400}", // Precio total basado en la cantidad seleccionada
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
