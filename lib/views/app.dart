import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import 'login/login_screen.dart';
import 'products/product_list_screen.dart';
import 'cart/cart_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          // 🔑 Auth-based root navigation
          home: auth.user == null
              ? const LoginScreen()
              : const ProductListScreen(),

          // 🔁 Named routes for in-app navigation
          routes: {
            '/cart': (context) => const CartScreen(),
          },
        );
      },
    );
  }
}
