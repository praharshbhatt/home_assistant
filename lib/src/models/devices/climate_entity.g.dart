// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'climate_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClimateEntity _$ClimateEntityFromJson(Map<String, dynamic> json) =>
    ClimateEntity(
      entityId: json['entity_id'] as String,
      state: json['state'] as String,
      lastUpdated: json['last_updated'] as String,
      lastReported: json['last_reported'] as String,
      lastChanged: json['last_changed'] as String,
      context: EntityContext.fromJson(json['context'] as Map<String, dynamic>),
      attributes: ClimateEntityAttributes.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

ClimateEntityAttributes _$ClimateEntityAttributesFromJson(
        Map<String, dynamic> json) =>
    ClimateEntityAttributes(
      editable: json['editable'] as bool?,
      id: json['id'] as String?,
      friendlyName: json['friendly_name'] as String?,
      userId: json['user_id'] as String?,
      deviceTrackers: (json['device_trackers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      hvacModes: (json['hvac_modes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      minTemp: (json['min_temp'] as num?)?.toInt(),
      maxTemp: (json['max_temp'] as num?)?.toInt(),
      currentTemperature: (json['current_temperature'] as num?)?.toDouble(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      targetTempLow: (json['target_temp_low'] as num?)?.toDouble(),
      targetTempHigh: (json['target_temp_high'] as num?)?.toDouble(),
      presetMode: json['preset_mode'] as String?,
      hvacAction: json['hvac_action'] as String?,
      fanMode: json['fan_mode'] as String?,
    );

Map<String, dynamic> _$ClimateEntityAttributesToJson(
        ClimateEntityAttributes instance) =>
    <String, dynamic>{
      'editable': instance.editable,
      'id': instance.id,
      'friendly_name': instance.friendlyName,
      'user_id': instance.userId,
      'device_trackers': instance.deviceTrackers,
      'options': instance.options,
      'hvac_modes': instance.hvacModes,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'current_temperature': instance.currentTemperature,
      'temperature': instance.temperature,
      'target_temp_low': instance.targetTempLow,
      'target_temp_high': instance.targetTempHigh,
      'preset_mode': instance.presetMode,
      'hvac_action': instance.hvacAction,
      'fan_mode': instance.fanMode,
    };
