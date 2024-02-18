import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClient {
  final String baseUrl;
  final String bearerToken;

  HttpClient({
    required this.baseUrl,
    required this.bearerToken,
  });

  Future<http.Response> get(String path) async {
    final response = await http.get(
      Uri.parse('$baseUrl$path'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'Content-Type': 'application/json',
      },
    );

    return response;
  }

  Future<http.Response> post(String path, dynamic data) async {
    final response = await http.post(
      Uri.parse('$baseUrl$path'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'Content-Type': 'application/json',
      },
      body: json.encode(data),
    );

    return response;
  }

  Future<http.Response> put(String path, dynamic data) async {
    final response = await http.put(
      Uri.parse('$baseUrl$path'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'Content-Type': 'application/json',
      },
      body: json.encode(data),
    );

    return response;
  }

  Future<http.Response> delete(String path) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$path'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'Content-Type': 'application/json',
      },
    );

    return response;
  }
}
