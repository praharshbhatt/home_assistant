import 'package:json_annotation/json_annotation.dart';
import '../entity.dart';

part 'climate_entity.g.dart';

/// Represents a climate entity in Home Assistant.
///
/// A climate entity provides control and monitoring of climate devices such as
/// thermostats, heaters, and air conditioners.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ClimateEntity extends Entity {
  /// Creates a new [ClimateEntity] instance.
  ///
  /// [entityId] is the unique identifier for the climate entity.
  /// [state] represents the current state of the climate device.
  /// [lastUpdated], [lastReported], and [lastChanged] provide timestamps
  /// for the entity's state changes.
  /// [context] contains additional metadata about the entity.
  /// [attributes] contains climate-specific attributes.
  ClimateEntity({
    required super.entityId,
    required super.state,
    required super.lastUpdated,
    required super.lastReported,
    required super.lastChanged,
    required super.context,
    required ClimateEntityAttributes attributes,
  }) : super(
          attributes: attributes,
        );

  /// Creates a new [ClimateEntity] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the climate entity data.
  factory ClimateEntity.fromJson(Map<String, dynamic> json) =>
      _$ClimateEntityFromJson(json);
}

/// Represents the attributes of a climate entity in Home Assistant.
///
/// These attributes provide additional details about the climate device, such as
/// supported HVAC modes, temperature settings, and current operation state.
@JsonSerializable(fieldRename: FieldRename.snake)
class ClimateEntityAttributes extends EntityAttributes {
  /// The list of supported HVAC modes.
  ///
  /// For example, "heat", "cool", "auto", etc.
  final List<String>? hvacModes;

  /// The minimum temperature that can be set for the climate device.
  final int? minTemp;

  /// The maximum temperature that can be set for the climate device.
  final int? maxTemp;

  /// The current temperature reported by the climate device.
  double? currentTemperature;

  /// The target temperature set for the climate device.
  final double? temperature;

  /// The lower bound of the target temperature range (if applicable).
  final double? targetTempLow;

  /// The upper bound of the target temperature range (if applicable).
  final double? targetTempHigh;

  /// The current preset mode of the climate device.
  ///
  /// For example, "eco", "away", "none", etc.
  final String? presetMode;

  /// The current HVAC action being performed by the climate device.
  ///
  /// For example, "heating", "cooling", "idle", etc.
  final String? hvacAction;

  /// The current fan mode of the climate device.
  ///
  /// For example, "auto", "low", "medium", "high", etc.
  final String? fanMode;

  /// Creates a new [ClimateEntityAttributes] instance.
  ///
  /// [hvacModes] is the list of supported HVAC modes.
  /// [minTemp] and [maxTemp] define the temperature range.
  /// [currentTemperature] is the current temperature reported by the device.
  /// [temperature] is the target temperature.
  /// [targetTempLow] and [targetTempHigh] define the target temperature range.
  /// [presetMode] is the current preset mode.
  /// [hvacAction] is the current HVAC action.
  /// [fanMode] is the current fan mode.
  /// Other inherited attributes provide additional metadata.
  ClimateEntityAttributes({
    super.editable,
    super.id,
    super.friendlyName,
    super.userId,
    super.deviceTrackers,
    super.options,
    this.hvacModes,
    this.minTemp,
    this.maxTemp,
    this.currentTemperature,
    this.temperature,
    this.targetTempLow,
    this.targetTempHigh,
    this.presetMode,
    this.hvacAction,
    this.fanMode,
  });

  /// Converts a JSON object into a [ClimateEntityAttributes] instance.
  ///
  /// [json] is the JSON map containing the attributes data.
  factory ClimateEntityAttributes.fromJson(Map<String, dynamic> json) =>
      _$ClimateEntityAttributesFromJson(json);

  /// Converts this [ClimateEntityAttributes] instance into a JSON object.
  ///
  /// Returns a JSON map containing the attributes data.
  Map<String, dynamic> toJson() => _$ClimateEntityAttributesToJson(this);
}