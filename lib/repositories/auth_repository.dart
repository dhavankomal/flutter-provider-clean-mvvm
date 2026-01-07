import '../models/user_model.dart';

class AuthRepository {
  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // mock API

    if (email == 'admin@test.com' && password == '123456') {
      return UserModel(
        id: '1',
        name: 'Admin User',
        email: email,
      );
    } else {
      throw Exception('Invalid credentials');
    }
  }
}
