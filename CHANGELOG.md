## 2.0.0
> Note: This release has breaking changes.

- Major refactor and API redesign.
- Added new device-specific entity attributes classes for better type safety:
    - CameraEntityAttributes
    - ClimateEntityAttributes
    - LightEntityAttributes
    - MediaPlayerEntityAttributes
- Upgraded unit tests and mock HTTP client for testing.
- Improved error handling and response parsing.
- Updated dependencies and development tooling.
- Improved documentation and usage examples.
- add support for more entity attributes for:
    - light
- add supphort for new entities
    - lock
    - fan
    - switch
    - sensor

## 1.0.1

- Added new models for configuration, entity, and service.
- Fixed bugs in the HTTP client.

## 1.0.0

- Initial version of the Home Assistant Dart plugin.
- Provides basic functionality for interacting with the Home Assistant API.
