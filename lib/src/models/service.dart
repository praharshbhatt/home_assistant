import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

/// Represents a service in Home Assistant.
///
/// A service is a callable action within a specific domain in Home Assistant.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Service {
  /// The domain to which this service belongs.
  ///
  /// For example, "light" or "switch".
  final String domain;

  /// A map of service names to their corresponding [ServiceInfo].
  ///
  /// This provides detailed information about each service within the domain.
  final Map<String, ServiceInfo> services;

  /// Creates a new [Service] instance.
  ///
  /// [domain] is the domain of the service, and [services] is a map of service
  /// names to their details.
  Service({
    required this.domain,
    required this.services,
  });

  /// Creates a new [Service] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the service data.
  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);
}

/// Represents detailed information about a specific service in Home Assistant.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ServiceInfo {
  /// The name of the service.
  ///
  /// For example, "turn_on" or "turn_off".
  final String name;

  /// A description of what the service does.
  final String description;

  /// A map of fields required by the service.
  ///
  /// This includes the parameters that need to be passed when calling the service.
  final Map<String, dynamic>? fields;

  /// A map of target information for the service.
  ///
  /// This specifies the entities or devices that the service can act upon.
  final Map<String, dynamic>? target;

  /// Creates a new [ServiceInfo] instance.
  ///
  /// [name] is the name of the service, [description] provides details about
  /// the service, [fields] contains the required parameters, and [target]
  /// specifies the target information.
  ServiceInfo({
    required this.name,
    required this.description,
    this.fields,
    this.target,
  });

  /// Creates a new [ServiceInfo] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the service information.
  factory ServiceInfo.fromJson(Map<String, dynamic> json) => _$ServiceInfoFromJson(json);
}

/// Represents a field required by a service in Home Assistant.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ServiceField {
  /// Indicates whether this field is required.
  final bool? required;

  /// An example value for this field.
  final dynamic example;

  /// The name of the field.
  final String? name;

  /// A description of the field.
  final String? description;

  /// Creates a new [ServiceField] instance.
  ///
  /// [required] indicates if the field is mandatory, [example] provides a sample
  /// value, [name] is the field's name, and [description] explains its purpose.
  ServiceField({
    this.required,
    this.example,
    this.name,
    this.description,
  });

  /// Creates a new [ServiceField] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the field information.
  factory ServiceField.fromJson(Map<String, dynamic> json) => _$ServiceFieldFromJson(json);
}

/// Represents the target information for a service in Home Assistant.
///
/// This specifies the entities or devices that the service can act upon.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ServiceTarget {
  /// A list of entity-related target information.
  ///
  /// Each map contains details about the entities that the service can act upon.
  final List<Map<String, dynamic>> entity;

  /// A list of device-related target information.
  ///
  /// Each map contains details about the devices that the service can act upon.
  final List<Map<String, dynamic>> device;

  /// Creates a new [ServiceTarget] instance.
  ///
  /// [entity] is the list of entity-related target information, and [device]
  /// is the list of device-related target information.
  ServiceTarget({
    required this.entity,
    required this.device,
  });

  /// Creates a new [ServiceTarget] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the target information.
  factory ServiceTarget.fromJson(Map<String, dynamic> json) => _$ServiceTargetFromJson(json);
}
