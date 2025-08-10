import 'package:json_annotation/json_annotation.dart';
import '../entity.dart';

part 'lock_entity.g.dart';

/// Represents a lock entity in Home Assistant.
///
/// A lock entity provides access to state, code format, changedBy and
/// other lock-related attributes.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class LockEntity extends Entity {
  /// Creates a new [LockEntity] instance.
  ///
  /// [entityId] is the unique identifier for the lock entity.
  /// [state] represents the current state of the lock.
  /// [lastUpdated], [lastReported], and [lastChanged] provide timestamps
  /// for the entity's state changes.
  /// [context] contains additional metadata about the entity.
  /// [attributes] contains lock-specific attributes.
  LockEntity({
    required super.entityId,
    required super.state,
    required super.lastUpdated,
    required super.lastReported,
    required super.lastChanged,
    required super.context,
    required LockEntityAttributes attributes,
  }) : super(
    attributes: attributes,
  );

  /// Creates a new [LockEntity] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the lock entity data.
  factory LockEntity.fromJson(Map<String, dynamic> json) => _$LockEntityFromJson(json);
}

/// Represents the attributes of a Lock entity in Home Assistant.
///
/// These attributes provide additional details about the lock, such as
/// state, changedBy and code format.
@JsonSerializable(fieldRename: FieldRename.snake)
class LockEntityAttributes extends EntityAttributes {
  /// Indicates whether a lock device is locked.
  final bool? isLocked;

  /// Indicates whether a lock device is locking.
  final bool? isLocking;

  /// Indicates whether a lock device is unlocking.
  final bool? isUnlocking;

  /// Indicates whether a lock device is unlocked.
  final bool? isUnlocked;

  /// Indicates whether a lock device is jammed.
  final bool? isJammed;

  /// Indicates whether a lock device is opening.
  final bool? isOpening;

  /// Indicates whether a lock device is open.
  final bool? isOpen;

  /// Describes what the last change was triggered by.
  final bool? changedBy;

  /// Regex for code format of lock or None if no code is required.
  final String? codeFormat;

  /// Bitmask for which features the fan device supports.
  final int supportedFeatures;

  /// Creates a new [LockEntityAttributes] instance.
  ///
  /// [isLocked] indicates if the lock is locked.
  /// [isLocking] indicates if the lock is unlocking.
  /// [isUnlocked] indicates if the lock is unlocked.
  /// [isUnlocking] indicates if the lock is unlocking.
  /// [isJammed] indicates if the lock is jammed.
  /// [isOpening] indicates if the lock is opening.
  /// [isOpen] indicates if the lock is open.
  /// [codeFormat] provides the regex for code format of the lock.
  /// [changedBy] describes what the last change was triggered by.
  /// [changedBy] describes what the last change was triggered by.
  /// Other inherited attributes provide additional metadata.
  const LockEntityAttributes({
    super.editable,
    super.id,
    super.friendlyName,
    super.userId,
    super.deviceTrackers,
    super.options,
    this.isLocked,
    this.isLocking,
    this.isUnlocking,
    this.isUnlocked,
    this.isJammed,
    this.isOpening,
    this.isOpen,
    this.changedBy,
    this.codeFormat,
    required this.supportedFeatures,
  });

  /// Converts a JSON object into a [LockEntityAttributes] instance.
  ///
  /// [json] is the JSON map containing the attributes data.
  factory LockEntityAttributes.fromJson(Map<String, dynamic> json) =>
      _$LockEntityAttributesFromJson(json);

  /// Converts this [LockEntityAttributes] instance into a JSON object.
  ///
  /// Returns a JSON map containing the attributes data.
  Map<String, dynamic> toJson() => _$LockEntityAttributesToJson(this);
}
