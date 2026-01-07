import 'package:flutter/material.dart';
import 'login/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider Clean MVVM',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
