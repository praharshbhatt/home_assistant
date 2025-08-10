import 'package:home_assistant/home_assistant.dart';

void main() {
  // Initialize Home Assistant
  final HomeAssistant homeAssistant = HomeAssistant(
    baseUrl: 'http://example.com',
    bearerToken: 'your_token',
  );
  fetchData(homeAssistant);
}

fetchData(HomeAssistant homeAssistant) async {
  print("The API is working: ${await homeAssistant.verifyApiIsWorking()}");

  final Configuration config = await homeAssistant.fetchConfig();
  print(config.toJson());

  final List<Entity> entities = await homeAssistant.fetchStates();
  print(entities.first.entityId);

  final Entity entity = await homeAssistant.fetchState(entities.first.entityId);
  print(entity.entityId);

  final List<Service> services = await homeAssistant.fetchServices();
  print(services.first.domain);

  homeAssistant.executeService(
    "switch.ceiling_lights_socket_1",
    "turn_on",
    additionalActions: {},
  );
  homeAssistant.executeService(
    "light.bedside_lamp_mercury",
    "turn_on",
    additionalActions: {
      "brightness": 255,
      "color_temp": 400,
    },
  );

  await Future.delayed(const Duration(seconds: 1));

  homeAssistant.executeService(
    "switch.ceiling_lights_socket_1",
    "turn_off",
    additionalActions: {},
  );
  homeAssistant.executeService(
    "light.bedside_lamp_mercury",
    "turn_off",
    additionalActions: {},
  );

  await Future.delayed(const Duration(seconds: 1));
}
