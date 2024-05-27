import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ActivityService {
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
      print('message: ${response.reasonPhrase}');
      print('Request failed with status: ${response.statusCode}');
      print('Reponse body: ${response.body}');
    }
    return null;
  }

  Future<Map<String, dynamic>?> createActivity(
      String title, String description, Map<String, dynamic> address) async {
    final token = await _getToken();
    if (token == null) return null;

    final response = await http.post(Uri.parse('$baseUrl/activities'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'title': title,
          'description': description,
          'address': address,
        }));

    return _processResponse(response);
  }

  Future<List<dynamic>?> listActivities({String? district}) async {
    final token = await _getToken();
    if (token == null) return null;

    final url = district != null
        ? '$baseUrl/activities?district=$district'
        : '$baseUrl/activities';

    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );
    return _processResponse(response);
  }

  Future<Map<String, dynamic>?> getActivity(String id) async {
    final token = await _getToken();
    if (token == null) return null;

    final response = await http.get(
      Uri.parse('$baseUrl/activities/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return _processResponse(response);
  }

  Future<Map<String, dynamic>?> likeActivity(String id) async {
    final token = await _getToken();
    if (token == null) return null;

    final response = await http.put(
      Uri.parse('$baseUrl/activities/$id/like'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return _processResponse(response);
  }

  Future<Map<String, dynamic>?> presenceActivity(String id) async {
    final token = await _getToken();
    if (token == null) return null;

    final response = await http.put(
      Uri.parse('$baseUrl/activities/$id/presence'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return _processResponse(response);
  }

  Future<Map<String, dynamic>?> addCommentToActivity(
      String id, String content) async {
    final token = await _getToken();
    if (token == null) return null;

    final response = await http.put(
      Uri.parse('$baseUrl/activities/$id/comment'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'content': content}),
    );
    return _processResponse(response);
  }

  Future<List<dynamic>?> getTopActivitiesFromDistrict() async {
    final token = await _getToken();
    if (token == null) return null;

    final response = await http.get(
      Uri.parse('$baseUrl/activities/top/district'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return _processResponse(response);
  }

  Future<List<dynamic>?> getActivitiesWithPresence() async {
    final token = await _getToken();
    if (token == null) return null;

    final url = '$baseUrl/activities/presence/user';

    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );

    return _processResponse(response);
  }
}
