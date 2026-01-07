import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: cartProvider.items.isEmpty
          ? const Center(child: Text('Cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      final item = cartProvider.items[index];

                      return ListTile(
                        title: Text(item.name),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            cartProvider.removeFromCart(item);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Total: ₹ ${cartProvider.totalPrice}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
    );
  }
}
