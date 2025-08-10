import 'dart:convert';
import 'package:home_assistant/home_assistant.dart';
import 'package:home_assistant/src/models/devices/media_player_entity.dart';
import 'package:home_assistant/src/networking/http_client.dart';

/// Handles network calls to Home Assistant's REST API.
///
/// This class provides methods to interact with Home Assistant's API, such as
/// verifying the API status, fetching entities, and executing services.
class HomeAssistantApi {
  /// The HTTP client used for making network requests.
  final HttpClient httpClient;

  /// Creates a new instance of [HomeAssistantApi].
  ///
  /// [httpClient] is the HTTP client used for making requests.
  HomeAssistantApi({
    required this.httpClient,
  });

  /// Verifies if the Home Assistant API is working.
  ///
  /// Sends a request to the `/api/` endpoint and checks the response.
  ///
  /// Returns `true` if the API is working, otherwise `false`.
  /// Throws an [Exception] if the request fails.
  Future<bool> verifyApiIsWorking() async {
    final response = await httpClient.get('/api/');

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = json.decode(response.body);
      if (decodedResponse['message'] == 'API running.') {
        return true;
      } else {
        return false;
      }
    } else {
      throw Exception(
        'Failed to verify API is working: ${response.reasonPhrase}',
      );
    }
  }

  /// Fetches the Home Assistant configuration.
  ///
  /// Sends a request to the `/api/config` endpoint and parses the response.
  ///
  /// Returns a [Configuration] object containing the configuration details.
  /// Throws an [Exception] if the request fails.
  Future<Configuration> fetchConfig() async {
    final response = await httpClient.get('/api/config');

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = json.decode(response.body);
      return Configuration.fromJson(decodedResponse);
    } else {
      throw Exception(
        'Failed to fetch Home Assistant configuration: ${response.reasonPhrase}',
      );
    }
  }

  /// Fetches a list of entities from Home Assistant.
  ///
  /// Sends a request to the `/api/states` endpoint and parses the response.
  ///
  /// Returns a list of [Entity] objects.
  /// Throws an [Exception] if the request fails.
  Future<List<Entity>> fetchStates() async {
    final response = await httpClient.get('/api/states');

    if (response.statusCode == 200) {
      final List<dynamic> decodedResponse = json.decode(response.body);
      return decodedResponse
          .map((entityJson) {
            // Parse and convert each entity JSON to the appropriate entity class
            try {
              final entityId = entityJson['entity_id'] as String;
              final domain = entityId.split('.').first;
              final factory = _entityFactoryMap[domain];
              if (factory != null) {
                return factory(entityJson);
              } else {
                return Entity.fromJson(entityJson);
              }
            } catch (e) {
              print('Error processing entity: $e');
              return null;
            }
          })
          .whereType<Entity>()
          .toList();
    } else {
      throw Exception('Failed to fetch entities: ${response.reasonPhrase}');
    }
  }

  /// A map of entity domains to their corresponding factory methods.
  ///
  /// This is used to create specific entity types based on their domain.
  final Map<String, Entity Function(Map<String, dynamic>)> _entityFactoryMap = {
    'camera': (json) => CameraEntity.fromJson(json),
    'climate': (json) => ClimateEntity.fromJson(json),
    'light': (json) => LightEntity.fromJson(json),
    'media_player': (json) => MediaPlayerEntity.fromJson(json),
    'switch': (json) => SwitchEntity.fromJson(json),
    'sensor': (json) => SensorEntity.fromJson(json),
    'lock': (json) => LockEntity.fromJson(json),
    'fan': (json) => FanEntity.fromJson(json),
  };

  /// Fetches the state of a specific entity.
  ///
  /// [id] is the unique identifier of the entity.
  ///
  /// Returns an [Entity] object representing the entity's state.
  /// Throws an [Exception] if the request fails.
  Future<Entity> fetchState(String id) async {
    final response = await httpClient.get('/api/states/$id');

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = json.decode(response.body);
      return Entity.fromJson(decodedResponse);
    } else {
      throw Exception('Failed to fetch the entity: ${response.reasonPhrase}');
    }
  }

  /// Fetches a list of available services from Home Assistant.
  ///
  /// Sends a request to the `/api/services` endpoint and parses the response.
  ///
  /// Returns a list of [Service] objects.
  /// Throws an [Exception] if the request fails.
  Future<List<Service>> fetchServices() async {
    final response = await httpClient.get('/api/services');

    if (response.statusCode == 200) {
      final List<dynamic> decodedResponse = json.decode(response.body);
      final List<Service> services =
          decodedResponse.map((service) => Service.fromJson(service)).toList();
      return services;
    } else {
      throw Exception('Failed to fetch services: ${response.reasonPhrase}');
    }
  }

  /// Executes a service on a specific entity in Home Assistant.
  ///
  /// [entityId] is the unique identifier of the entity.
  /// [action] is the service action to execute (e.g., "turn_on").
  /// [additionalActions] is a map of additional parameters for the service call.
  ///
  /// Returns `true` if the service call was successful, otherwise `false`.
  Future<bool> executeService(
    String entityId,
    String action, {
    Map<String, dynamic> additionalActions = const {},
  }) async {
    final Map<String, dynamic> data = Map.from(additionalActions);
    data["entity_id"] = entityId;
    final response = await httpClient.post(
      '/api/services/${entityId.split('.').first}/$action',
      data,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
