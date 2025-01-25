import 'package:flutter/material.dart';
import 'product_list_item.dart';

class CartListItemPage extends StatelessWidget {
  final Map<int, int> cartItems;
  final List<Pro> products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index]),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                // Handle item removal
              },
            ),
          );
        },
      ),
    );
  }
}