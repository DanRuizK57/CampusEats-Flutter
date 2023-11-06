import 'package:flutter/material.dart';

class ColorChangingButton extends StatefulWidget {
  @override
  _ColorChangingButtonState createState() => _ColorChangingButtonState();
}

class _ColorChangingButtonState extends State<ColorChangingButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      child: Icon(
        Icons.favorite,
        color: _isPressed ? Colors.red : Colors.grey, // Color del icono
        size: 24.0, // Tamaño del icono
      ),
    );
  }
}
