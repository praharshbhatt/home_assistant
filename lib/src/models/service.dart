class Service {
  final String domain;
  final Map<String, ServiceInfo> services;

  Service({
    required this.domain,
    required this.services,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> servicesMap = json['services'];
    final servicesInfo = servicesMap.map(
      (key, value) => MapEntry(key, ServiceInfo.fromJson(value)),
    );

    return Service(
      domain: json['domain'],
      services: servicesInfo,
    );
  }
}

class ServiceInfo {
  final String name;
  final String description;
  final Map<String, dynamic>? fields;
  final Map<String, dynamic>? target;

  ServiceInfo({
    required this.name,
    required this.description,
    this.fields,
    this.target,
  });

  factory ServiceInfo.fromJson(Map<String, dynamic> json) {
    return ServiceInfo(
      name: json['name'],
      description: json['description'],
      fields: json['fields'],
      target: json['target'],
    );
  }
}

class ServiceField {
  final bool? required;
  final dynamic example;
  final String? name;
  final String? description;

  ServiceField({
    this.required,
    this.example,
    this.name,
    this.description,
  });

  factory ServiceField.fromJson(Map<String, dynamic> json) {
    return ServiceField(
      required: json['required'],
      example: json['example'],
      name: json['name'],
      description: json['description'],
    );
  }
}

class ServiceTarget {
  final List<Map<String, dynamic>> entity;
  final List<Map<String, dynamic>> device;

  ServiceTarget({
    required this.entity,
    required this.device,
  });

  factory ServiceTarget.fromJson(Map<String, dynamic> json) {
    final List<Map<String, dynamic>> entityList = List<Map<String, dynamic>>.from(json['entity']);
    final List<Map<String, dynamic>> deviceList = List<Map<String, dynamic>>.from(json['device']);

    return ServiceTarget(
      entity: entityList,
      device: deviceList,
    );
  }
}
