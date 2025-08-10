// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LightEntity _$LightEntityFromJson(Map<String, dynamic> json) => LightEntity(
      entityId: json['entity_id'] as String,
      state: json['state'] as String,
      lastUpdated: json['last_updated'] as String,
      lastReported: json['last_reported'] as String,
      lastChanged: json['last_changed'] as String,
      context: EntityContext.fromJson(json['context'] as Map<String, dynamic>),
      attributes: LightEntityAttributes.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

LightEntityAttributes _$LightEntityAttributesFromJson(
        Map<String, dynamic> json) =>
    LightEntityAttributes(
      editable: json['editable'] as bool?,
      id: json['id'] as String?,
      friendlyName: json['friendly_name'] as String?,
      userId: json['user_id'] as String?,
      deviceTrackers: (json['device_trackers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      supportedColorModes: (json['supported_color_modes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ColorModeEnumMap, e))
          .toList(),
      brightness: (json['brightness'] as num?)?.toInt(),
      rgbColor: (json['rgb_color'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      colorMode: $enumDecodeNullable(_$ColorModeEnumMap, json['color_mode']),
      colorTempKelvin: (json['color_temp_kelvin'] as num?)?.toInt(),
      isOn: json['is_on'] as bool?,
      effect: json['effect'] as String?,
      effectList: (json['effect_list'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      maxColorTempKelvin: (json['max_color_temp_kelvin'] as num?)?.toInt(),
      minColorTempKelvin: (json['min_color_temp_kelvin'] as num?)?.toInt(),
      hsColor: (json['hs_color'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      rgbWColor: (json['rgbw_color'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      rgbWWColor: (json['rgbww_color'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      xyColor: (json['xy_color'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$LightEntityAttributesToJson(
        LightEntityAttributes instance) =>
    <String, dynamic>{
      'editable': instance.editable,
      'id': instance.id,
      'friendly_name': instance.friendlyName,
      'user_id': instance.userId,
      'device_trackers': instance.deviceTrackers,
      'options': instance.options,
      'supported_color_modes': instance.supportedColorModes
          ?.map((e) => _$ColorModeEnumMap[e]!)
          .toList(),
      'brightness': instance.brightness,
      'rgb_color': instance.rgbColor,
      'color_mode': _$ColorModeEnumMap[instance.colorMode],
      'color_temp_kelvin': instance.colorTempKelvin,
      'effect': instance.effect,
      'effect_list': instance.effectList,
      'hs_color': instance.hsColor,
      'is_on': instance.isOn,
      'max_color_temp_kelvin': instance.maxColorTempKelvin,
      'min_color_temp_kelvin': instance.minColorTempKelvin,
      'rgbw_color': instance.rgbWColor,
      'rgbww_color': instance.rgbWWColor,
      'xy_color': instance.xyColor,
    };

const _$ColorModeEnumMap = {
  ColorMode.unknown: 'unknown',
  ColorMode.onOff: 'onoff',
  ColorMode.brightness: 'brightness',
  ColorMode.colorTemp: 'color_temp',
  ColorMode.hs: 'hs',
  ColorMode.rgb: 'rgb',
  ColorMode.rgbW: 'rgbw',
  ColorMode.rgbWW: 'rgbww',
  ColorMode.white: 'white',
  ColorMode.xy: 'xy',
};
