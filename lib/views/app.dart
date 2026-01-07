import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import 'login/login_screen.dart';
import 'products/product_list_screen.dart';
import 'cart/cart_screen.dart';
import 'splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        Widget home;

        if (!auth.isInitialized) {
          home = const SplashScreen();
        } else if (auth.user == null) {
          home = const LoginScreen();
        } else {
          home = const ProductListScreen();
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: home,
          routes: {
            '/cart': (context) => const CartScreen(),
          },
        );
      },
    );
  }
}
