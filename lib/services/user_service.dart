import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final String baseUrl = "http://localhost:3000/api";

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> _setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<void> _removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Map<String, dynamic>? _processResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      print('message: ${response.reasonPhrase}');
      print('Request falhou com status: ${response.statusCode}');
      return null;
    }
  }

  Future<Map<String, dynamic>?> register(
      String username, String email, String password, String cep) async {
    final response = await http.post(Uri.parse('$baseUrl/users/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
          'cep': cep
        }));

    return _processResponse(response);
  }

  Future<Map<String, dynamic>?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    final responseData = _processResponse(response);
    if (responseData != null && responseData['token'] != null) {
      await _setToken(responseData['token']);
    }

    print("RESPONSE---->$responseData");

    return responseData;
  }

  Future<Map<String, dynamic>?> getUser() async {
    final token = await _getToken();
    if (token == null) return null;

    final response = await http.get(
      Uri.parse('$baseUrl/users/getuser'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return _processResponse(response);
  }

  Future<void> logout() async {
    await _removeToken();
    await http.get(
      Uri.parse('$baseUrl/users/logout'),
    );
  }

  Future<Map<String, dynamic>?> loginStatus() async {
    final token = await _getToken();
    if (token == null) return null;

    final response = await http.get(
      Uri.parse('$baseUrl/users/loggedin'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return _processResponse(response);
  }
}
