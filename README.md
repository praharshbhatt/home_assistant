# home_assistant

[<img src="https://design.home-assistant.io/images/brand/logo.png" height="200" />](https://github.com/praharshbhatt/home_assistant)

[![Pub Version](https://img.shields.io/pub/v/home_assistant.svg)](https://pub.dev/packages/home_assistant)
![Dart CI](https://github.com/praharshbhatt/home_assistant-dart/workflows/Dart%20CI/badge.svg)

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
  home_assistant: ^1.0.0 # Use the latest version from pub.dev
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

// Control a switch.
try {
  await homeAssistant.turnOnSwitch('switch.entity_id');
  print('Switch turned on.');
} catch (e) {
  print('Failed to turn on the switch: $e');
}
```

For more detailed usage and examples, please refer to the [documentation](https://pub.dev/packages/home_assistant).

## Contributing

We welcome contributions! If you find a bug or have a feature request, please [open an issue](https://github.com/praharshbhatt/home_assistant-dart/issues) on GitHub. If you want to contribute code, please fork the repository and submit a pull request.
