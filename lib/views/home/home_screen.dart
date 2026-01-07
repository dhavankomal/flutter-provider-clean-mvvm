import 'package:flutter/material.dart';
import 'package:flutter_provider_clean_mvvm/providers/auth_provider.dart';

import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authProvider.logout();
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          'Welcome ${authProvider.user?.name ?? ''}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
