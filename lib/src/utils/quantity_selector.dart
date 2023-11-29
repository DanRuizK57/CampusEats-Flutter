import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final int initialValue;
  final Function(int) onChanged;

  QuantitySelector({required this.initialValue, required this.onChanged});

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    int maxFinite = 100;
    _quantity = widget.initialValue.clamp(0, maxFinite);
  }

  void _decrement() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
        widget.onChanged(_quantity);
      });
    }
  }

  void _increment() {
    setState(() {
      _quantity++;
      widget.onChanged(_quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: _decrement,
          color: Colors.green,
        ),
        Text(
          "$_quantity",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _increment,
          color: Colors.green,
        ),
      ],
    );
  }
}
