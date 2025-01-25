import 'package:flutter/material.dart';
import 'product_list_item_view.dart';
import 'product_list_item.dart';
import 'cart_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ProductListItem> products = [
    ProductListItem(
        id: 1,
        title: 'Product 1',
        description: 'Description 1',
        price: 10.0,
        imageUrl: 'assets/images/apple.jpg'),
    ProductListItem(
        id: 2,
        title: 'Product 2',
        description: 'Description 2',
        price: 20.0,
        imageUrl: 'assets/images/apple.jpg'),
    ProductListItem(
        id: 3,
        title: 'Product 3',
        description: 'Description 3',
        price: 30.0,
        imageUrl: 'assets/images/apple.jpg'),
    ProductListItem(
        id: 4,
        title: 'Product 4',
        description: 'Description 4',
        price: 40.0,
        imageUrl: 'assets/images/apple.jpg'),
    ProductListItem(
        id: 5,
        title: 'Product 5',
        description: 'Description 5',
        price: 50.0,
        imageUrl: 'assets/images/apple.jpg'),
    ProductListItem(
        id: 6,
        title: 'Product 6',
        description: 'Description 6',
        price: 60.0,
        imageUrl: 'assets/images/apple.jpg'),
    ProductListItem(
        id: 7,
        title: 'Product 7',
        description: 'Description 7',
        price: 70.0,
        imageUrl: 'assets/images/apple.jpg'),
    ProductListItem(
        id: 8,
        title: 'Product 8',
        description: 'Description 8',
        price: 80.0,
        imageUrl: 'assets/images/apple.jpg'),
    ProductListItem(
        id: 9,
        title: 'Product 9',
        description: 'Description 9',
        price: 90.0,
        imageUrl: 'assets/images/apple.jpg'),
    ProductListItem(
        id: 10,
        title: 'Product 10',
        description: 'Description 10',
        price: 100.0,
        imageUrl: 'assets/images/apple.jpg'),
  ];

  Map<int, int> cart = {};

  void addToCart(ProductListItem product) {
    if (!cart.containsKey(product.id)) {
      setState(() {
        cart[product.id] = 0;
      });
    } else {
      cart[product.id] = cart[product.id]! + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World!'),
          backgroundColor: const Color.fromARGB(255, 248, 158, 151),
          centerTitle: true,
        ),
        body: Center(
          child: Stack(
            children: [
              ProductListItemView(products: products, onAddToCart: addToCart),
              Positioned(
                bottom: 16,
                right: 16,
                child: CartButton(
                  itemCount: cart.length,
                  onPressed: () {
                    print('Cart button pressed');
                  },
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}
