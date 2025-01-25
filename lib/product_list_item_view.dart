import 'package:flutter/material.dart';
import 'product_list_item.dart';
import'product_detail_page.dart';

class ProductListItemView extends StatelessWidget {
  final List<ProductListItem> products;
  final Function(ProductListItem) onAddToCart;

  const ProductListItemView({super.key, required this.products, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(product: product),
              ),
            );
          },
          child:ListTile(
            trailing: IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                onAddToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.title} added to cart'),
                  ),
                );
              },
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage(product.imageUrl),
            ),
            title: Text(product.title, style: TextStyle(color: Colors.white)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.description, style: TextStyle(color: Colors.white)),
                Text('\$${product.price.toStringAsFixed(2)}', style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
        );
      },
    );
  }
}
