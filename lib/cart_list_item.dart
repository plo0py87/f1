import 'package:f1/product_list_item.dart';

class CartListItem {
  final Map<int, int> items;

  void addToCart(ProductListItem product) {
    if (!items.containsKey(product.id)) {
      items[product.id] = 1;
    } else {
      items[product.id] = items[product.id]! + 1;
    }
  }

  void quantityAdjust(ProductListItem product, int quantity) {
    if (quantity == 0) {
      items.remove(product.id);
    } else {
      items[product.id] = quantity;
    }
  }

  CartListItem({
    required this.items,
  });
}