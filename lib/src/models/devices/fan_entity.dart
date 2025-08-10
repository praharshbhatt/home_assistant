import 'package:json_annotation/json_annotation.dart';
import 'package:home_assistant/src/models/entity.dart';

part 'fan_entity.g.dart';

/// Represents a fan entity in Home Assistant.
///
/// A fan entity provides control and monitoring of fan devices
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class FanEntity extends Entity {
  /// Creates a new [FanEntity] instance.
  ///
  /// [entityId] is the unique identifier for the fan entity.
  /// [state] represents the current state of the fan device.
  /// [lastUpdated], [lastReported], and [lastChanged] provide timestamps
  /// for the entity's state changes.
  /// [context] contains additional metadata about the entity.
  /// [attributes] contains light-specific attributes.
  FanEntity({
    required super.entityId,
    required super.state,
    required super.lastUpdated,
    required super.lastReported,
    required super.lastChanged,
    required super.context,
    required FanEntityAttributes attributes,
  }) : super(
          attributes: attributes,
        );

  /// Creates a new [FanEntity] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the light entity data.
  factory FanEntity.fromJson(Map<String, dynamic> json) =>
      _$FanEntityFromJson(json);
}

/// Represents the attributes of a fan entity in Home Assistant.
///
/// These attributes provide additional details about the fan device, such as
/// is_on, current_direction, etc
@JsonSerializable(fieldRename: FieldRename.snake)
class FanEntityAttributes extends EntityAttributes {
  /// The current direction of the fan.
  @JsonKey(name: "direction")
  final String? currentDirection;

  /// True if the fan is on.
  @JsonKey(name: "is_on")
  final bool? isOn;

  /// True if the fan is oscillating.
  final bool? oscillating;

  /// The current speed percentage. Must be a value between 0 (off) and 100.
  final int? percentage;

  /// The current preset_mode.
  /// One of the values in preset_modes or None if no preset is active.
  @JsonKey(name: "preset_mode")
  final String? presetMode;

  /// The list of supported preset_modes.
  /// This is an arbitrary list of str and should not contain any speeds.
  @JsonKey(name: "preset_modes")
  final List<String>? presetModes;

  /// The number of speeds the fan supports
  @JsonKey(name: "speed_count")
  final int? speedCount;

  /// Bitmask for which features the fan device supports.
  @JsonKey(name: "supported_features")
  final int supportedFeatures;

  /// Creates a new [FanEntityAttributes] instance.
  FanEntityAttributes({
    super.editable,
    super.id,
    super.friendlyName,
    super.userId,
    super.deviceTrackers,
    super.options,
    this.currentDirection,
    this.isOn,
    this.oscillating,
    this.percentage,
    this.presetMode,
    this.presetModes,
    required this.speedCount,
    required this.supportedFeatures,
  });

  /// Converts a JSON object into a [FanEntityAttributes] instance.
  ///
  /// [json] is the JSON map containing the attributes data.
  factory FanEntityAttributes.fromJson(Map<String, dynamic> json) =>
      _$FanEntityAttributesFromJson(json);

  /// Converts this [FanEntityAttributes] instance into a JSON object.
  ///
  /// Returns a JSON map containing the attributes data.
  Map<String, dynamic> toJson() => _$FanEntityAttributesToJson(this);
}
