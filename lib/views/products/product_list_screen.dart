import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';
import '../../providers/cart_provider.dart';
import '../../models/product_model.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProductProvider>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              if (cartProvider.itemCount > 0)
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    cartProvider.itemCount.toString(),
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: productProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                final ProductModel product =
                    productProvider.products[index];

                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('₹ ${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      cartProvider.addToCart(product);
                    },
                  ),
                );
              },
            ),
    );
  }
}
