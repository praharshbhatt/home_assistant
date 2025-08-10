import 'package:home_assistant/src/models/configuration.dart';
import 'package:home_assistant/src/models/entity.dart';
import 'package:home_assistant/src/models/service.dart';

import 'networking/home_assistant_api.dart';
import 'networking/http_client.dart';

/// The main class for initializing and managing the Home Assistant connection.
class HomeAssistant {
  late HomeAssistantApi _api;

  /// Creates an instance of HomeAssistant with the provided [baseUrl] and [bearerToken].
  ///
  /// [baseUrl] is the URL of the Home Assistant instance.
  /// [bearerToken] is the authentication token for accessing Home Assistant APIs.
  HomeAssistant({
    required String baseUrl,
    required String bearerToken,
  }) {
    _api = HomeAssistantApi(
      httpClient: HttpClient(baseUrl: baseUrl, bearerToken: bearerToken),
    );
  }

  /// Verifies the Home Assistant API is working on the provided [baseUrl] and [bearerToken].
  ///
  /// Returns true if the API is working, false otherwise.
  Future<bool> verifyApiIsWorking() => _api.verifyApiIsWorking();

  /// Fetches the Home Assistant configuration from the /api/config endpoint.
  ///
  /// Returns a Map containing the Home Assistant configuration.
  Future<Configuration> fetchConfig() => _api.fetchConfig();

  /// Fetches a list of entities from Home Assistant.
  ///
  /// Returns a list of [Entity] objects.
  Future<List<Entity>> fetchStates() => _api.fetchStates();

  /// Fetches a state object for one entity from Home Assistant.
  ///
  /// Returns an [Entity] object.
  Future<Entity> fetchState(String id) => _api.fetchState(id);

  /// Calls a service on Home Assistant.
  ///
  /// Returns a [Service] object.
  Future<List<Service>> fetchServices() => _api.fetchServices();

  /// Executes the provided action on the given Home Assistant [Service].
  ///
  /// [entityId] is the entity to execute the service on.
  /// Returns a [bool] indicating whether the service call was successful.
  /// The [action] and [additionalActions] parameter is the [Entity.attributes] value for the service
  Future<bool> executeService(
    String entityId,
    String action, {
    Map<String, dynamic> additionalActions = const {},
  }) =>
      _api.executeService(
        entityId,
        action,
        additionalActions: additionalActions,
      );
}
