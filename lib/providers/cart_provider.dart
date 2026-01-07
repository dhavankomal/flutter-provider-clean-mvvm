import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../models/cart_item_model.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItemModel> _items = {};

  List<CartItemModel> get items => _items.values.toList();

  int get itemCount =>
      _items.values.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.values.fold(
        0,
        (sum, item) => sum + (item.product.price * item.quantity),
      );

  void addToCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItemModel(product: product);
    }
    notifyListeners();
  }

  void decreaseQuantity(ProductModel product) {
    if (!_items.containsKey(product.id)) return;

    if (_items[product.id]!.quantity > 1) {
      _items[product.id]!.quantity--;
    } else {
      _items.remove(product.id);
    }
    notifyListeners();
  }

  void removeItem(ProductModel product) {
    _items.remove(product.id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
