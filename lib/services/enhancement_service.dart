import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EnhancementService {
  final String baseUrl = "http://localhost:3000/api";

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  dynamic _processResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      final body = jsonDecode(response.body);
      if (body is List) {
        return body;
      } else if (body is Map) {
        return body;
      }
    } else {
      print('Message: ${response.reasonPhrase}');
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    return null;
  }

  Future<Map<String, dynamic>?> createEnhancement(
      String message, Map<String, dynamic> address) async {
    final token = await _getToken();
    if (token == null) return null;

    final response = await http.post(
      Uri.parse('$baseUrl/enhancements'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'message': message,
        'address': {
          'city': 'Rio de Janeiro',
          'state': 'Rio de Janeiro',
          'country': 'Brasil',
          ...address,
        },
      }),
    );

    return _processResponse(response);
  }

  Future<List<dynamic>?> listEnhancements({String? district}) async {
    final token = await _getToken();
    if (token == null) return null;

    final url = district != null
        ? '$baseUrl/enhancements?district=$district'
        : '$baseUrl/enhancements';

    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );
    return _processResponse(response);
  }

  Future<Map<String, dynamic>?> likeEnhancement(String id) async {
    final token = await _getToken();
    if (token == null) return null;

    final response = await http.put(
      Uri.parse('$baseUrl/enhancements/$id/like'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return _processResponse(response);
  }
}
