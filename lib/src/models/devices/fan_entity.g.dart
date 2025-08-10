// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fan_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FanEntity _$FanEntityFromJson(Map<String, dynamic> json) => FanEntity(
      entityId: json['entity_id'] as String,
      state: json['state'] as String,
      lastUpdated: json['last_updated'] as String,
      lastReported: json['last_reported'] as String,
      lastChanged: json['last_changed'] as String,
      context: EntityContext.fromJson(json['context'] as Map<String, dynamic>),
      attributes: FanEntityAttributes.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

FanEntityAttributes _$FanEntityAttributesFromJson(Map<String, dynamic> json) =>
    FanEntityAttributes(
      editable: json['editable'] as bool?,
      id: json['id'] as String?,
      friendlyName: json['friendly_name'] as String?,
      userId: json['user_id'] as String?,
      deviceTrackers: (json['device_trackers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      currentDirection: json['direction'] as String?,
      isOn: json['is_on'] as bool?,
      oscillating: json['oscillating'] as bool?,
      percentage: (json['percentage'] as num?)?.toInt(),
      presetMode: json['preset_mode'] as String?,
      presetModes: (json['preset_modes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      speedCount: (json['speed_count'] as num?)?.toInt(),
      supportedFeatures: (json['supported_features'] as num).toInt(),
    );

Map<String, dynamic> _$FanEntityAttributesToJson(
        FanEntityAttributes instance) =>
    <String, dynamic>{
      'editable': instance.editable,
      'id': instance.id,
      'friendly_name': instance.friendlyName,
      'user_id': instance.userId,
      'device_trackers': instance.deviceTrackers,
      'options': instance.options,
      'direction': instance.currentDirection,
      'is_on': instance.isOn,
      'oscillating': instance.oscillating,
      'percentage': instance.percentage,
      'preset_mode': instance.presetMode,
      'preset_modes': instance.presetModes,
      'speed_count': instance.speedCount,
      'supported_features': instance.supportedFeatures,
    };
