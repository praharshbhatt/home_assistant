// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      domain: json['domain'] as String,
      services: (json['services'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, ServiceInfo.fromJson(e as Map<String, dynamic>)),
      ),
    );

ServiceInfo _$ServiceInfoFromJson(Map<String, dynamic> json) => ServiceInfo(
      name: json['name'] as String,
      description: json['description'] as String,
      fields: json['fields'] as Map<String, dynamic>?,
      target: json['target'] as Map<String, dynamic>?,
    );

ServiceField _$ServiceFieldFromJson(Map<String, dynamic> json) => ServiceField(
      required: json['required'] as bool?,
      example: json['example'],
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

ServiceTarget _$ServiceTargetFromJson(Map<String, dynamic> json) =>
    ServiceTarget(
      entity: (json['entity'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      device: (json['device'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );
