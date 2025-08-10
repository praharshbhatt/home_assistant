// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CameraEntity _$CameraEntityFromJson(Map<String, dynamic> json) => CameraEntity(
      entityId: json['entity_id'] as String,
      state: json['state'] as String,
      lastUpdated: json['last_updated'] as String,
      lastReported: json['last_reported'] as String,
      lastChanged: json['last_changed'] as String,
      context: EntityContext.fromJson(json['context'] as Map<String, dynamic>),
      attributes: CameraEntityAttributes.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

CameraEntityAttributes _$CameraEntityAttributesFromJson(
        Map<String, dynamic> json) =>
    CameraEntityAttributes(
      editable: json['editable'] as bool?,
      id: json['id'] as String?,
      friendlyName: json['friendly_name'] as String?,
      userId: json['user_id'] as String?,
      deviceTrackers: (json['device_trackers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      cameraStreamUrl: json['camera_stream_url'] as String?,
      videoUrl: json['video_url'] as String?,
      entityPicture: json['entity_picture'] as String?,
      isRecording: json['is_recording'] as bool?,
      isStreaming: json['is_streaming'] as bool?,
      motionDetectionEnabled: json['motion_detection_enabled'] as bool?,
    );

Map<String, dynamic> _$CameraEntityAttributesToJson(
        CameraEntityAttributes instance) =>
    <String, dynamic>{
      'editable': instance.editable,
      'id': instance.id,
      'friendly_name': instance.friendlyName,
      'user_id': instance.userId,
      'device_trackers': instance.deviceTrackers,
      'options': instance.options,
      'camera_stream_url': instance.cameraStreamUrl,
      'video_url': instance.videoUrl,
      'entity_picture': instance.entityPicture,
      'is_recording': instance.isRecording,
      'is_streaming': instance.isStreaming,
      'motion_detection_enabled': instance.motionDetectionEnabled,
    };
