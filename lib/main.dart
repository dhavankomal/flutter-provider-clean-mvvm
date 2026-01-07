import 'package:flutter/material.dart';
import 'package:flutter_provider_clean_mvvm/providers/auth_provider.dart';
import 'package:flutter_provider_clean_mvvm/providers/cart_provider.dart';
import 'package:flutter_provider_clean_mvvm/providers/product_provider.dart';

import 'package:provider/provider.dart';

import 'providers/app_provider.dart';

import 'views/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
