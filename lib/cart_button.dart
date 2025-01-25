import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final int itemCount;
  final VoidCallback onPressed;

  CartButton({required this.itemCount, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: onPressed,
        ),
        if (itemCount > 0)
          Positioned(
            right: 0,
            top: 5, // Adjust this value to move the number higher
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(
          minWidth: 16,
          minHeight: 16,
              ),
              child: Text(
          '$itemCount',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
              ),
            ),
          ),
        
      ],
    );
  }
}