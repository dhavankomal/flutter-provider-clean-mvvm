import '../models/product_model.dart';

class ProductRepository {
  Future<List<ProductModel>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1)); // mock delay

    return [
      ProductModel(id: '1', name: 'Apple', price: 40),
      ProductModel(id: '2', name: 'Banana', price: 20),
      ProductModel(id: '3', name: 'Orange', price: 30),
      ProductModel(id: '4', name: 'Mango', price: 50),
    ];
  }
}
