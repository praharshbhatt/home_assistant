import 'package:json_annotation/json_annotation.dart';
import '../entity.dart';

part 'media_player_entity.g.dart';

/// Represents a media player entity in Home Assistant.
///
/// A media player entity provides control and monitoring of media devices,
/// such as speakers, TVs, and other media playback equipment.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class MediaPlayerEntity extends Entity {
  /// Creates a new [MediaPlayerEntity] instance.
  ///
  /// [entityId] is the unique identifier for the media player entity.
  /// [state] represents the current state of the media player device.
  /// [lastUpdated], [lastReported], and [lastChanged] provide timestamps
  /// for the entity's state changes.
  /// [context] contains additional metadata about the entity.
  /// [attributes] contains media player-specific attributes.
  MediaPlayerEntity({
    required super.entityId,
    required super.state,
    required super.lastUpdated,
    required super.lastReported,
    required super.lastChanged,
    required super.context,
    required MediaPlayerEntityAttributes attributes,
  }) : super(
          attributes: attributes,
        );

  /// Creates a new [MediaPlayerEntity] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the media player entity data.
  factory MediaPlayerEntity.fromJson(Map<String, dynamic> json) =>
      _$MediaPlayerEntityFromJson(json);
}

/// Represents the attributes of a media player entity in Home Assistant.
///
/// These attributes provide additional details about the media player device,
/// such as the currently playing media title and artist.
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class MediaPlayerEntityAttributes extends EntityAttributes {
  /// The title of the currently playing media.
  final String? mediaTitle;

  /// The artist of the currently playing media.
  final String? mediaArtist;

  /// Creates a new [MediaPlayerEntityAttributes] instance.
  ///
  /// [mediaTitle] is the title of the currently playing media.
  /// [mediaArtist] is the artist of the currently playing media.
  /// Other inherited attributes provide additional metadata.
  const MediaPlayerEntityAttributes({
    super.editable,
    super.id,
    super.friendlyName,
    super.userId,
    super.deviceTrackers,
    super.options,
    this.mediaTitle,
    this.mediaArtist,
  });

  /// Converts a JSON object into a [MediaPlayerEntityAttributes] instance.
  ///
  /// [json] is the JSON map containing the attributes data.
  factory MediaPlayerEntityAttributes.fromJson(Map<String, dynamic> json) =>
      _$MediaPlayerEntityAttributesFromJson(json);
}