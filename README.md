# home_assistant

[<img src="https://design.home-assistant.io/images/brand/logo.png" height="400" />](https://github.com/praharshbhatt/home_assistant)

[![Pub Version](https://img.shields.io/pub/v/home_assistant.svg)](https://pub.dev/packages/home_assistant)
[![package publisher](https://img.shields.io/pub/publisher/http.svg)](https://pub.dev/packages/home_assistant/publisher)

A Dart library for interacting with Home Assistant APIs.

## Introduction

The `home_assistant` package provides a convenient way to interact with Home Assistant APIs from your Dart or Flutter applications. With this package, you can easily connect to your Home Assistant instance, retrieve information about entities, control devices, and perform various actions using Home Assistant services.

## Features

- Connect to your Home Assistant instance with an API token.
- Verify the Home Assistant API's status.
- Fetch information about entities and their states.
- Control devices and entities.
- Access Home Assistant services programmatically.

## Installation

To use this package, add `home_assistant` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  home_assistant: ^2.0.0 # Use the latest version from pub.dev
```

Then, import the library in your Dart code:

```dart
import 'package:home_assistant/home_assistant.dart';
```

## Getting Started

Here's how to get started with the `home_assistant` package:

```dart
// Initialize the Home Assistant instance.
final homeAssistant = HomeAssistant(
  baseUrl: 'https://your-home-assistant-url.com',
  bearerToken: 'your-api-token',
);

// Verify if the Home Assistant API is working.
final isApiWorking = await homeAssistant.verifyApiIsWorking();
if (isApiWorking) {
  print('Home Assistant API is working.');
} else {
  print('Home Assistant API is not working.');
}

// Fetch a list of entities.
final entities = await homeAssistant.fetchStates();
print('Entities: $entities');

// Control an Entity / Execute a service.


// Example of a switch:
final success = await homeAssistant.executeService(
    'switch.entity_id',
    'turn_on',
    additionalActions: {},
);
if (success) {
  print('Switch turned on.');
} else {
  print('Failed to turn on the switch: $e');
}

// Example of a light:
final success = await homeAssistant.executeService(
    'light.entity_id',
    'turn_on',
    additionalActions: {'brightness': 255},
);
if (success) {
  print('Light turned on with brightness.');
} else {
  print('Failed to turn on the light: $e');
}

// Example of a climate device:
final success = await homeAssistant.executeService(
    await homeAssistant.executeService(
        'climate.entity_id',
        'set_temperature',
        additionalActions: {
          'temperature': 22,
          'hvac_mode': 'heat', // Optional: specify HVAC mode if needed
        },
);
if (success) {
    print('Temperature set to 22 degrees.');
} else {
    print('Failed to set temperature: $e');
}

```

For more detailed usage and examples, please refer to the [documentation](https://pub.dev/packages/home_assistant) and the available [rest endpoints](https://developers.home-assistant.io/docs/api/rest/).

## Contributing

We welcome contributions! If you find a bug or have a feature request, please [open an issue](https://github.com/praharshbhatt/home_assistant/issues) on GitHub. If you want to contribute code, please fork the repository and submit a pull request.
