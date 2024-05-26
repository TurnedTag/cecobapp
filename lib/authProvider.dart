import 'package:flutter/material.dart';
import 'apiService.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  String? _cep;

  bool get isAuthenticated => _cep != null;

  String? get cep => _cep;

  Future<void> login(String email, String password) async {
    final response = await _apiService.login(email, password);
    if (response != null) {
      final userResponse = await _apiService.getUser();
      if (userResponse != null) {
        _cep = userResponse['cep'];
      }
      notifyListeners();
    }
  }

  void logout() async {
    await _apiService.logout();
    _cep = null;
    notifyListeners();
  }
}
