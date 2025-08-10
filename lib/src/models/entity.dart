import 'package:json_annotation/json_annotation.dart';

part 'entity.g.dart';

/// Represents a generic entity in Home Assistant.
///
/// An entity can be a light, switch, sensor, or any other device that can be
/// controlled or monitored. Each entity has a unique identifier, a state, and
/// various attributes.
///
/// For more details, refer to the [Home Assistant Entity Documentation](https://developers.home-assistant.io/docs/core/entity/).
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Entity {
  /// The unique identifier for the entity.
  ///
  /// For example, "light.living_room" or "sensor.temperature".
  final String entityId;

  /// The current state of the entity.
  ///
  /// For example, "on", "off", or a specific value like "23°C".
  final String state;

  /// The timestamp of the last update to the entity's state.
  final String lastUpdated;

  /// The timestamp of the last report received for the entity.
  final String lastReported;

  /// The timestamp of the last state change for the entity.
  final String lastChanged;

  /// Metadata about the entity's context.
  ///
  /// This includes information such as the user or parent entity that caused
  /// the state change.
  final EntityContext context;

  /// The attributes associated with the entity.
  ///
  /// These provide additional details about the entity, such as its name,
  /// options, or other metadata.
  final EntityAttributes attributes;

  /// Creates a new [Entity] instance.
  ///
  /// [entityId] is the unique identifier for the entity.
  /// [state] represents the current state of the entity.
  /// [lastUpdated], [lastReported], and [lastChanged] provide timestamps
  /// for the entity's state changes.
  /// [context] contains additional metadata about the entity.
  /// [attributes] contains additional details about the entity.
  const Entity({
    required this.entityId,
    required this.state,
    required this.lastUpdated,
    required this.lastReported,
    required this.lastChanged,
    required this.context,
    required this.attributes,
  });

  /// Creates a new [Entity] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the entity data.
  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
}

/// Represents the attributes of a generic entity in Home Assistant.
///
/// These attributes provide additional metadata about the entity, such as its
/// name, options, or user-specific details.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class EntityAttributes {
  /// Indicates whether the entity is editable.
  final bool? editable;

  /// The unique identifier for the entity's attributes.
  final String? id;

  /// The friendly name of the entity.
  ///
  /// This is a user-friendly name for display purposes.
  final String? friendlyName;

  /// The user ID associated with the entity.
  final String? userId;

  /// A list of device trackers associated with the entity.
  final List<String>? deviceTrackers;

  /// A list of options available for the entity.
  final List<String>? options;

  /// Creates a new [EntityAttributes] instance.
  ///
  /// [editable] indicates if the entity is editable.
  /// [id] is the unique identifier for the attributes.
  /// [friendlyName] is the user-friendly name of the entity.
  /// [userId] is the user ID associated with the entity.
  /// [deviceTrackers] is a list of associated device trackers.
  /// [options] is a list of available options for the entity.
  const EntityAttributes({
    this.editable,
    this.id,
    this.friendlyName,
    this.userId,
    this.deviceTrackers,
    this.options,
  });

  /// Creates a new [EntityAttributes] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the attributes data.
  factory EntityAttributes.fromJson(Map<String, dynamic> json) =>
      _$EntityAttributesFromJson(json);
}

/// Represents the context of a generic entity in Home Assistant.
///
/// The context provides metadata about the entity, such as the user or parent
/// entity that caused a state change.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class EntityContext {
  /// The unique identifier for the context.
  final String? id;

  /// The unique identifier of the parent entity, if applicable.
  final String? parentId;

  /// The user ID associated with the context.
  final String? userId;

  /// Creates a new [EntityContext] instance.
  ///
  /// [id] is the unique identifier for the context.
  /// [parentId] is the unique identifier of the parent entity.
  /// [userId] is the user ID associated with the context.
  const EntityContext({
    this.id,
    this.parentId,
    this.userId,
  });

  /// Creates a new [EntityContext] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the context data.
  factory EntityContext.fromJson(Map<String, dynamic> json) =>
      _$EntityContextFromJson(json);
}