// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LockEntity _$LockEntityFromJson(Map<String, dynamic> json) => LockEntity(
      entityId: json['entity_id'] as String,
      state: json['state'] as String,
      lastUpdated: json['last_updated'] as String,
      lastReported: json['last_reported'] as String,
      lastChanged: json['last_changed'] as String,
      context: EntityContext.fromJson(json['context'] as Map<String, dynamic>),
      attributes: LockEntityAttributes.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

LockEntityAttributes _$LockEntityAttributesFromJson(
        Map<String, dynamic> json) =>
    LockEntityAttributes(
      editable: json['editable'] as bool?,
      id: json['id'] as String?,
      friendlyName: json['friendly_name'] as String?,
      userId: json['user_id'] as String?,
      deviceTrackers: (json['device_trackers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isLocked: json['is_locked'] as bool?,
      isLocking: json['is_locking'] as bool?,
      isUnlocking: json['is_unlocking'] as bool?,
      isUnlocked: json['is_unlocked'] as bool?,
      isJammed: json['is_jammed'] as bool?,
      isOpening: json['is_opening'] as bool?,
      isOpen: json['is_open'] as bool?,
      changedBy: json['changed_by'] as bool?,
      codeFormat: json['code_format'] as String?,
      supportedFeatures: (json['supported_features'] as num).toInt(),
    );

Map<String, dynamic> _$LockEntityAttributesToJson(
        LockEntityAttributes instance) =>
    <String, dynamic>{
      'editable': instance.editable,
      'id': instance.id,
      'friendly_name': instance.friendlyName,
      'user_id': instance.userId,
      'device_trackers': instance.deviceTrackers,
      'options': instance.options,
      'is_locked': instance.isLocked,
      'is_locking': instance.isLocking,
      'is_unlocking': instance.isUnlocking,
      'is_unlocked': instance.isUnlocked,
      'is_jammed': instance.isJammed,
      'is_opening': instance.isOpening,
      'is_open': instance.isOpen,
      'changed_by': instance.changedBy,
      'code_format': instance.codeFormat,
      'supported_features': instance.supportedFeatures,
    };
