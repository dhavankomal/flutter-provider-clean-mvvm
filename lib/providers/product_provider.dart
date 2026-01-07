import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../repositories/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _repository = ProductRepository();

  bool isLoading = false;
  List<ProductModel> products = [];

  Future<void> loadProducts() async {
    isLoading = true;
    notifyListeners();

    products = await _repository.fetchProducts();

    isLoading = false;
    notifyListeners();
  }
}
