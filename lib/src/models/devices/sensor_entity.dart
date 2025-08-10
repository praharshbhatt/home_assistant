import 'package:json_annotation/json_annotation.dart';
import '../entity.dart';

part 'sensor_entity.g.dart';

/// Represents a sensor entity in Home Assistant.
///
/// A sensor entity provides access to unit of measurement, value, type of sensor and
/// other sensor-related attributes.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class SensorEntity extends Entity {
  /// Creates a new [SensorEntity] instance.
  ///
  /// [entityId] is the unique identifier for the sensor entity.
  /// [state] represents the current state of the sensor.
  /// [lastUpdated], [lastReported], and [lastChanged] provide timestamps
  /// for the entity's state changes.
  /// [context] contains additional metadata about the entity.
  /// [attributes] contains sensor-specific attributes.
  SensorEntity({
    required super.entityId,
    required super.state,
    required super.lastUpdated,
    required super.lastReported,
    required super.lastChanged,
    required super.context,
    required SensorEntityAttributes attributes,
  }) : super(
          attributes: attributes,
        );

  /// Creates a new [SensorEntity] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the camera entity data.
  factory SensorEntity.fromJson(Map<String, dynamic> json) =>
      _$SensorEntityFromJson(json);
}

/// Represents the attributes of a sensor entity in Home Assistant.
///
/// These attributes provide additional details about the sensor, such as
/// units of measurement, measurement value, and sensor device class.
@JsonSerializable(fieldRename: FieldRename.snake)
class SensorEntityAttributes extends EntityAttributes {
  /// Indicates the [DateTime] object of when the sensor was lastReset
  final DateTime? lastReset;

  /// Indicates the type of Sensor listed in [SensorDeviceClass]
  final String? deviceClass;

  /// Indicates unit of measurement for the sensor
  final String? unitOfMeasurement;

  /// Indicates the value of measurement for the sensor
  final String? value;

  /// Creates a new [SensorEntityAttributes] instance.
  ///
  /// [lastReset] is the [DateTime] object when the sensor was last reset.
  /// [deviceClass] is the class which the sensor belongs to.
  /// [unitOfMeasurement] is the unit of measurement for the sensor.
  /// [value] is the value recorded by the sensor.
  const SensorEntityAttributes({
    super.editable,
    super.id,
    super.friendlyName,
    super.userId,
    super.deviceTrackers,
    super.options,
    this.lastReset,
    this.deviceClass,
    this.unitOfMeasurement,
    this.value,
  });

  /// Converts a JSON object into a [SensorEntityAttributes] instance.
  ///
  /// [json] is the JSON map containing the attributes data.
  factory SensorEntityAttributes.fromJson(Map<String, dynamic> json) =>
      _$SensorEntityAttributesFromJson(json);

  /// Converts this [SensorEntityAttributes] instance into a JSON object.
  ///
  /// Returns a JSON map containing the attributes data.
  Map<String, dynamic> toJson() => _$SensorEntityAttributesToJson(this);
}
