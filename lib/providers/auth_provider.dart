import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _repository = AuthRepository();

  bool _isLoading = false;
  String? _errorMessage;
  UserModel? _user;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  UserModel? get user => _user;
  
  bool _isInitialized = false;
bool get isInitialized => _isInitialized;

Future<void> initializeApp() async {
  // Simulate loading saved session (token, user, etc.)
  await Future.delayed(const Duration(seconds: 2));

  // For now, user remains null (not logged in)
  // Later this can be replaced with SharedPreferences / Firebase

  _isInitialized = true;
  notifyListeners();
}

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _user = await _repository.login(email, password);
    } catch (e) {
      _errorMessage = 'Invalid email or password';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
