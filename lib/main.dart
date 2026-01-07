import 'package:flutter/material.dart';
import 'package:flutter_provider_clean_mvvm/providers/auth_provider.dart';

import 'package:provider/provider.dart';

import 'providers/app_provider.dart';

import 'views/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
