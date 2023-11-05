import 'package:flutter/material.dart';

Widget summaryCard() {
  return Container(
    margin: EdgeInsets.only(top: 85.0),
    child: Container(
      width: 360, // Ancho del contenedor
      height: 50, // Altura del contenedor
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6.0), // Redondear esquina superior izquierda
          topRight: Radius.circular(6.0), // Redondear esquina superior derecha
          bottomLeft:
              Radius.circular(43.0), // Redondear esquina inferior izquierda
          bottomRight:
              Radius.circular(43.0), // Redondear esquina inferior derecha
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
              "1 productos", // Muestra la cantidad seleccionada
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "\$1400", // Precio total basado en la cantidad seleccionada
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
  );
}
