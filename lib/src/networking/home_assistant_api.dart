import 'dart:convert';
import 'package:home_assistant/src/models/configuration.dart';
import 'package:home_assistant/src/models/entity.dart';
import 'package:home_assistant/src/models/service.dart';
import 'package:home_assistant/src/networking/http_client.dart';

class HomeAssistantApi {
  final HttpClient httpClient;

  HomeAssistantApi({
    required this.httpClient,
  });

  /// Verifies the Home Assistant API is working on the provided [baseUrl] and [bearerToken].
  ///
  /// Returns true if the API is working, false otherwise.
  Future<bool> verifyApiIsWorking() async {
    final response = await httpClient.get('/api/');

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      if (decodedResponse['message'] == 'API running.') {
        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('Failed to verify API is working: ${response.reasonPhrase}');
    }
  }

  /// Fetches the Home Assistant configuration from the /api/config endpoint.
  ///
  /// Returns a Map containing the Home Assistant configuration.
  Future<Configuration> fetchConfig() async {
    final response = await httpClient.get('/api/config');

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      return Configuration.fromJson(decodedResponse);
    } else {
      throw Exception('Failed to fetch Home Assistant configuration: ${response.reasonPhrase}');
    }
  }

  /// Fetches a list of entities from Home Assistant.
  ///
  /// Returns a list of [Entity] objects.
  Future<List<Entity>> fetchStates() async {
    final response = await httpClient.get('/api/states');

    if (response.statusCode == 200) {
      List<dynamic> decodedResponse = json.decode(response.body);
      return decodedResponse.map((entity) => Entity.fromJson(entity)).toList();
    } else {
      throw Exception('Failed to fetch entities: ${response.reasonPhrase}');
    }
  }

  /// Fetches a state object for one entity from Home Assistant.
  ///
  /// Returns an [Entity] object.
  Future<Entity> fetchState(String id) async {
    final response = await httpClient.get('/api/states/$id');

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      return Entity.fromJson(decodedResponse);
    } else {
      throw Exception('Failed to fetch the entity: ${response.reasonPhrase}');
    }
  }

  /// Fetches a list of available services from Home Assistant.
  ///
  /// Returns a list of [Service] objects.
  Future<List<Service>> fetchServices() async {
    final response = await httpClient.get('/api/services');

    if (response.statusCode == 200) {
      final List<dynamic> decodedResponse = json.decode(response.body);
      final List<Service> services = decodedResponse.map((service) => Service.fromJson(service)).toList();
      return services;
    } else {
      throw Exception('Failed to fetch services: ${response.reasonPhrase}');
    }
  }

  /// Executes the provided action on the given Home Assistant [Service].
  ///
  /// [entityId] is the entity to execute the service on.
  /// Returns a [bool] indicating whether the service call was successful.
  /// The [action] and [additionalActions] parameter is the [Entity.attributes] value for the service
  Future<bool> executeService(String entityId, String action, {Map<String, dynamic> additionalActions = const {}}) async {
    final response = await httpClient.post(
      '/api/services/${entityId.split('.').first}/$action',
      additionalActions..addAll({"entity_id": entityId}),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
