import 'dart:convert';
import 'package:http/http.dart' as http;

/// A simple HTTP client for interacting with REST APIs.
///
/// This client supports GET, POST, PUT, and DELETE requests and includes
/// support for bearer token authentication.
class HttpClient {
  /// The base URL for all API requests.
  ///
  /// This should include the protocol (e.g., `https://`) and the domain.
  final String baseUrl;

  /// The bearer token used for authentication.
  ///
  /// This token is included in the `Authorization` header of all requests.
  final String bearerToken;

  /// Creates a new instance of [HttpClient].
  ///
  /// [baseUrl] is the base URL for all API requests.
  /// [bearerToken] is the token used for authentication.
  HttpClient({
    required this.baseUrl,
    required this.bearerToken,
  });

  /// Sends a GET request to the specified [path].
  ///
  /// [path] is the endpoint to which the GET request is sent.
  ///
  /// Returns the [http.Response] from the server.
  /// Throws an [Exception] if the request fails.
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

  /// Sends a POST request to the specified [path] with the given [data].
  ///
  /// [path] is the endpoint to which the POST request is sent.
  /// [data] is the body of the request, which will be JSON-encoded.
  ///
  /// Returns the [http.Response] from the server.
  /// Throws an [Exception] if the request fails.
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

  /// Sends a PUT request to the specified [path] with the given [data].
  ///
  /// [path] is the endpoint to which the PUT request is sent.
  /// [data] is the body of the request, which will be JSON-encoded.
  ///
  /// Returns the [http.Response] from the server.
  /// Throws an [Exception] if the request fails.
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

  /// Sends a DELETE request to the specified [path].
  ///
  /// [path] is the endpoint to which the DELETE request is sent.
  ///
  /// Returns the [http.Response] from the server.
  /// Throws an [Exception] if the request fails.
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
