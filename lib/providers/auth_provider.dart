import 'package:flutter/material.dart';
import '../services/user_service.dart';
import '../services/activity_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final UserService _userService = UserService();
  final ActivityService _activityService = ActivityService();
  String? _cep;
  String? _authToken;
  String? _userId;

  bool get isAuthenticated => _authToken != null;

  String? get cep => _cep;

  Future<void> login(String email, String password) async {
    try {
      final response = await _userService.login(email, password);
      if (response != null && response['token'] != null) {
        _authToken = response['token'];
        _cep = response['cep'];
        _userId = response['_id'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('cep', _cep!);
        await prefs.setString('auth_token', _authToken!);
        await prefs.setString('user_id', _userId!);
        notifyListeners();
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _userService.logout();
      _authToken = null;
      _cep = null;
      _userId = null;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('cep');
      await prefs.remove('auth_token');
      await prefs.remove('user_id');
      notifyListeners();
    } catch (e) {
      print('Error during logout: $e');
    }
  }

  Future<void> loadFromStorage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _cep = prefs.getString('cep');
      _authToken = prefs.getString('auth_token');
      _userId = prefs.getString('user_id');
      notifyListeners();
    } catch (e) {
      print('Error loading from storage: $e');
    }
  }

  Future<List<dynamic>?> getTopActivitiesFromDistrict() async {
    return await _activityService.getTopActivitiesFromDistrict();
  }
}
