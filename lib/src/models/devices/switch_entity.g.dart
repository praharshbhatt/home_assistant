// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'switch_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwitchEntity _$SwitchEntityFromJson(Map<String, dynamic> json) => SwitchEntity(
      entityId: json['entity_id'] as String,
      state: json['state'] as String,
      lastUpdated: json['last_updated'] as String,
      lastReported: json['last_reported'] as String,
      lastChanged: json['last_changed'] as String,
      context: EntityContext.fromJson(json['context'] as Map<String, dynamic>),
      attributes: SwitchEntityAttributes.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

SwitchEntityAttributes _$SwitchEntityAttributesFromJson(
        Map<String, dynamic> json) =>
    SwitchEntityAttributes(
      editable: json['editable'] as bool?,
      id: json['id'] as String?,
      friendlyName: json['friendly_name'] as String?,
      userId: json['user_id'] as String?,
      deviceTrackers: (json['device_trackers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isOn: json['is_on'] as bool?,
    );

Map<String, dynamic> _$SwitchEntityAttributesToJson(
        SwitchEntityAttributes instance) =>
    <String, dynamic>{
      'editable': instance.editable,
      'id': instance.id,
      'friendly_name': instance.friendlyName,
      'user_id': instance.userId,
      'device_trackers': instance.deviceTrackers,
      'options': instance.options,
      'is_on': instance.isOn,
    };
