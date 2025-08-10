import 'package:json_annotation/json_annotation.dart';

import '../entity.dart';

part 'switch_entity.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)

/// Represents a switch entity in Home Assistant.
class SwitchEntity extends Entity {
  /// Creates a new [SwitchEntity] instance.
  ///
  /// [entityId] is the unique identifier for the switch entity.
  /// [state] represents the current state of the switch.
  /// [lastUpdated], [lastReported], and [lastChanged] provide timestamps
  /// for the entity's state changes.
  /// [context] contains additional metadata about the entity.
  /// [attributes] contains switch-specific attributes.
  SwitchEntity({
    required super.entityId,
    required super.state,
    required super.lastUpdated,
    required super.lastReported,
    required super.lastChanged,
    required super.context,
    required SwitchEntityAttributes attributes,
  }) : super(
          attributes: attributes,
        );

  /// Creates a new [SwitchEntity] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the camera entity data.
  factory SwitchEntity.fromJson(Map<String, dynamic> json) =>
      _$SwitchEntityFromJson(json);
}

/// Represents the attributes of a switch entity in Home Assistant.
///
/// These attributes provide additional details about the state of the switch.
@JsonSerializable(fieldRename: FieldRename.snake)
class SwitchEntityAttributes extends EntityAttributes {
  /// Indicates whether the switch is currently on.
  final bool? isOn;

  /// Creates a new [SwitchEntityAttributes] instance.
  ///
  /// [isOn] indicates whether the switch is currently on.
  /// Other inherited attributes provide additional metadata.
  const SwitchEntityAttributes({
    super.editable,
    super.id,
    super.friendlyName,
    super.userId,
    super.deviceTrackers,
    super.options,
    this.isOn,
  });

  /// Converts a JSON object into a [SwitchEntityAttributes] instance.
  ///
  /// [json] is the JSON map containing the attributes data.
  factory SwitchEntityAttributes.fromJson(Map<String, dynamic> json) =>
      _$SwitchEntityAttributesFromJson(json);

  /// Converts this [SwitchEntityAttributes] instance into a JSON object.
  ///
  /// Returns a JSON map containing the attributes data.
  Map<String, dynamic> toJson() => _$SwitchEntityAttributesToJson(this);
}
