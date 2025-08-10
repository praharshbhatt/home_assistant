import 'package:json_annotation/json_annotation.dart';
import '../entity.dart';

part 'camera_entity.g.dart';

/// Represents a camera entity in Home Assistant.
///
/// A camera entity provides access to live streams, video recordings, and
/// other camera-related attributes.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class CameraEntity extends Entity {
  /// Creates a new [CameraEntity] instance.
  ///
  /// [entityId] is the unique identifier for the camera entity.
  /// [state] represents the current state of the camera.
  /// [lastUpdated], [lastReported], and [lastChanged] provide timestamps
  /// for the entity's state changes.
  /// [context] contains additional metadata about the entity.
  /// [attributes] contains camera-specific attributes.
  CameraEntity({
    required super.entityId,
    required super.state,
    required super.lastUpdated,
    required super.lastReported,
    required super.lastChanged,
    required super.context,
    required CameraEntityAttributes attributes,
  }) : super(
          attributes: attributes,
        );

  /// Creates a new [CameraEntity] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the camera entity data.
  factory CameraEntity.fromJson(Map<String, dynamic> json) => _$CameraEntityFromJson(json);
}

/// Represents the attributes of a camera entity in Home Assistant.
///
/// These attributes provide additional details about the camera, such as
/// streaming URLs, recording status, and motion detection.
@JsonSerializable(fieldRename: FieldRename.snake)
class CameraEntityAttributes extends EntityAttributes {
  /// The URL for the camera's live stream.
  final String? cameraStreamUrl;

  /// The URL for the camera's video recordings.
  final String? videoUrl;

  /// The URL for the camera's entity picture.
  final String? entityPicture;

  /// Indicates whether the camera is currently recording.
  final bool? isRecording;

  /// Indicates whether the camera is currently streaming.
  final bool? isStreaming;

  /// Indicates whether motion detection is enabled for the camera.
  final bool? motionDetectionEnabled;

  /// Creates a new [CameraEntityAttributes] instance.
  ///
  /// [cameraStreamUrl] is the URL for the live stream.
  /// [videoUrl] is the URL for video recordings.
  /// [entityPicture] is the URL for the entity picture.
  /// [isRecording] indicates if the camera is recording.
  /// [isStreaming] indicates if the camera is streaming.
  /// [motionDetectionEnabled] indicates if motion detection is enabled.
  /// Other inherited attributes provide additional metadata.
  const CameraEntityAttributes({
    super.editable,
    super.id,
    super.friendlyName,
    super.userId,
    super.deviceTrackers,
    super.options,
    this.cameraStreamUrl,
    this.videoUrl,
    this.entityPicture,
    this.isRecording,
    this.isStreaming,
    this.motionDetectionEnabled,
  });

  /// Converts a JSON object into a [CameraEntityAttributes] instance.
  ///
  /// [json] is the JSON map containing the attributes data.
  factory CameraEntityAttributes.fromJson(Map<String, dynamic> json) =>
      _$CameraEntityAttributesFromJson(json);

  /// Converts this [CameraEntityAttributes] instance into a JSON object.
  ///
  /// Returns a JSON map containing the attributes data.
  Map<String, dynamic> toJson() => _$CameraEntityAttributesToJson(this);
}
