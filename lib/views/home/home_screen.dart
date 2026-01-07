import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../providers/app_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider MVVM Demo'),
      ),
      body: Center(
        child: appProvider.isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  appProvider.setLoading(true);

                  Future.delayed(const Duration(seconds: 2), () {
                    appProvider.setLoading(false);
                  });
                },
                child: const Text('Simulate Loading'),
              ),
      ),
    );
  }
}
