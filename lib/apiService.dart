import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://localhost:3000/api";

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
    return _processResponse(response);
  }

  Future<Map<String, dynamic>?> getUser(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/getuser'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return _processResponse(response);
  }

  Future<Map<String, dynamic>?> logout() async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/logout'),
    );
    return _processResponse(response);
  }

  Future<Map<String, dynamic>?> loginStatus() async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/loggedin'),
    );
    return _processResponse(response);
  }
}
