import 'package:flutter/material.dart';
import 'product_list_item.dart';

class CartListItemPage extends StatelessWidget {
  final Map<int, int> cartItems;
  final List<ProductListItem> products;
  final Function(ProductListItem,int) quantityAdjust;

  const CartListItemPage({Key? key, required this.cartItems, required this.products,required this.quantityAdjust}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(30.0),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart, color: Colors.white),
              SizedBox(width: 10),
              Text(
                cartItems.isEmpty?'Cart Empty!':'Total: \$${cartItems.entries.map((e) => products.firstWhere((product) => product.id == e.key).price * e.value).reduce((a, b) => a + b).toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final productId = cartItems.keys.elementAt(index);
          final product = products.firstWhere((product) => product.id == productId);
          final quantity = cartItems[productId]!;
          return ListTile(
            subtitle: Text('Total: \$${(product.price * quantity).toStringAsFixed(2)}'),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(product.imageUrl),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(fontSize: 18), // Increased font size
                    ),
                    Expanded(
                      child: Text(
                        '\$${(product.price * quantity).toStringAsFixed(2)}',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 14, color: Colors.green), // Increased font size and changed color
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8), // Add padding between title and subtitle
                Row(
                  children: [
                    IconButton(onPressed: () {
                      quantityAdjust(product, quantity + 1);
                    }, icon: Icon(Icons.add, size: 20.0)),
                    SizedBox(
                      width: 80,
                        child: TextField(
                        onSubmitted: (value) {
                          final newQuantity = int.tryParse(value) ?? quantity;
                          quantityAdjust(product, newQuantity);
                        },
                        controller: TextEditingController(text: quantity.toString()),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    IconButton(onPressed: () {
                      quantityAdjust(product, quantity - 1);
                    }, icon: Icon(Icons.remove, size: 20.0)),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ),
    );
  }
}