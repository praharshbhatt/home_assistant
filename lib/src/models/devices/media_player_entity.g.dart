// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_player_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaPlayerEntity _$MediaPlayerEntityFromJson(Map<String, dynamic> json) =>
    MediaPlayerEntity(
      entityId: json['entity_id'] as String,
      state: json['state'] as String,
      lastUpdated: json['last_updated'] as String,
      lastReported: json['last_reported'] as String,
      lastChanged: json['last_changed'] as String,
      context: EntityContext.fromJson(json['context'] as Map<String, dynamic>),
      attributes: MediaPlayerEntityAttributes.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

MediaPlayerEntityAttributes _$MediaPlayerEntityAttributesFromJson(
        Map<String, dynamic> json) =>
    MediaPlayerEntityAttributes(
      editable: json['editable'] as bool?,
      id: json['id'] as String?,
      friendlyName: json['friendly_name'] as String?,
      userId: json['user_id'] as String?,
      deviceTrackers: (json['device_trackers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      mediaTitle: json['media_title'] as String?,
      mediaArtist: json['media_artist'] as String?,
    );
