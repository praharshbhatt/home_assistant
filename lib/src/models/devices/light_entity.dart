import 'package:json_annotation/json_annotation.dart';

import '../entity.dart';

part 'light_entity.g.dart';

/// Represents a light entity in Home Assistant.
///
/// A light entity provides control and monitoring of light devices, such as
/// bulbs, LED strips, and other lighting equipment.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class LightEntity extends Entity {
  /// Creates a new [LightEntity] instance.
  ///
  /// [entityId] is the unique identifier for the light entity.
  /// [state] represents the current state of the light device.
  /// [lastUpdated], [lastReported], and [lastChanged] provide timestamps
  /// for the entity's state changes.
  /// [context] contains additional metadata about the entity.
  /// [attributes] contains light-specific attributes.
  LightEntity({
    required super.entityId,
    required super.state,
    required super.lastUpdated,
    required super.lastReported,
    required super.lastChanged,
    required super.context,
    required LightEntityAttributes attributes,
  }) : super(
          attributes: attributes,
        );

  /// Creates a new [LightEntity] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the light entity data.
  factory LightEntity.fromJson(Map<String, dynamic> json) =>
      _$LightEntityFromJson(json);
}

/// Represents the attributes of a light entity in Home Assistant.
///
/// These attributes provide additional details about the light device, such as
/// supported color modes, brightness, and RGB color values.
@JsonSerializable(fieldRename: FieldRename.snake)
class LightEntityAttributes extends EntityAttributes {
  /// The list of supported color modes for the light.
  ///
  /// For example, "rgb", "color_temp", etc.
  @JsonKey(name: "supported_color_modes")
  final List<ColorMode>? supportedColorModes;

  /// The current brightness level of the light.
  ///
  /// The value is typically between 0 and 255.
  final int? brightness;

  /// The current RGB color of the light.
  ///
  /// Represented as a list of three integers, each ranging from 0 to 255.
  @JsonKey(name: "rgb_color")
  final List<int>? rgbColor;

  /// The color mode of the light.
  ///
  /// Must be one of the values in the supported_color_modes attribute list.
  @JsonKey(name: "color_mode")
  final ColorMode? colorMode;

  /// The current CT color value in Kelvin of the light.
  ///
  /// Represented as an integer of kelvin temperature
  @JsonKey(name: "color_temp_kelvin")
  final int? colorTempKelvin;

  /// The current effect of the light.
  ///
  /// Must be a string value that is in the effect_list attribute list.
  final String? effect;

  /// The list of supported effects of the light.
  @JsonKey(name: "effect_list")
  final List<String>? effectList;

  /// The hue and saturation color value of the light.
  ///
  /// This property will be copied to the light's state attribute
  /// when the light's color mode is set to ColorMode.HS and ignored otherwise
  ///
  /// Represented in a list of length 2 with entries being hue and saturation respectively.
  @JsonKey(name: "hs_color")
  final List<double>? hsColor;

  /// If the light entity is on or not
  @JsonKey(name: "is_on")
  final bool? isOn;

  /// The coldest color_temp_kelvin that this light supports.
  @JsonKey(name: "max_color_temp_kelvin")
  final int? maxColorTempKelvin;

  /// The warmest color_temp_kelvin that this light supports.
  @JsonKey(name: "min_color_temp_kelvin")
  final int? minColorTempKelvin;

  /// The rgbw color value of the light.
  ///
  /// This property will be copied to the light's state attribute
  /// when the light's color mode is set to ColorMode.RGBW and ignored otherwise.
  ///
  /// Represented as a list of 4 integers, each ranging from 0 to 255.
  @JsonKey(name: "rgbw_color")
  final List<int>? rgbWColor;

  /// The rgbww color value of the light.
  ///
  /// This property will be copied to the light's state attribute
  /// when the light's color mode is set to ColorMode.RGBWW and ignored otherwise.
  ///
  /// Represented as a list of 5 integers, each ranging from 0 to 255.
  @JsonKey(name: "rgbww_color")
  final List<int>? rgbWWColor;

  /// The xy color value of the light.
  ///
  /// This property will be copied to the light's state attribute
  /// when the light's color mode is set to ColorMode.XY and ignored otherwise.
  ///
  /// Represented as a list of 2 doubles with entries being x and y respectively.
  @JsonKey(name: "xy_color")
  final List<double>? xyColor;

  /// Creates a new [LightEntityAttributes] instance.
  ///
  /// [supportedColorModes] is the list of supported color modes.
  /// [brightness] is the current brightness level.
  /// [rgbColor] is the current RGB color of the light.
  /// Other inherited attributes provide additional metadata.
  const LightEntityAttributes(
      {super.editable,
      super.id,
      super.friendlyName,
      super.userId,
      super.deviceTrackers,
      super.options,
      this.supportedColorModes,
      this.brightness,
      this.rgbColor,
      this.colorMode,
      this.colorTempKelvin,
      this.isOn,
      this.effect,
      this.effectList,
      this.maxColorTempKelvin,
      this.minColorTempKelvin,
      this.hsColor,
      this.rgbWColor,
      this.rgbWWColor,
      this.xyColor,
      });

  /// Converts a JSON object into a [LightEntityAttributes] instance.
  ///
  /// [json] is the JSON map containing the attributes data.
  factory LightEntityAttributes.fromJson(Map<String, dynamic> json) =>
      _$LightEntityAttributesFromJson(json);

  /// Converts this [LightEntityAttributes] instance into a JSON object.
  ///
  /// Returns a JSON map containing the attributes data.
  Map<String, dynamic> toJson() => _$LightEntityAttributesToJson(this);
}

// ignore_for_file: public_member_api_docs
enum ColorMode {
  unknown,
  @JsonValue('onoff')
  onOff,
  brightness,
  @JsonValue('color_temp')
  colorTemp,
  hs,
  rgb,
  @JsonValue('rgbw')
  rgbW,
  @JsonValue('rgbww')
  rgbWW,
  white,
  xy,
}