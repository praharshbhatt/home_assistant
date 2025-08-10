// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) =>
    Configuration(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      elevation: (json['elevation'] as num?)?.toDouble(),
      unitSystem: (json['unit_system'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      locationName: json['location_name'] as String?,
      timeZone: json['time_zone'] as String?,
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      configDir: json['config_dir'] as String?,
      whitelistExternalDirs: (json['whitelist_external_dirs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      allowlistExternalDirs: (json['allowlist_external_dirs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      allowlistExternalUrls: (json['allowlist_external_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      version: json['version'] as String?,
      configSource: json['config_source'] as String?,
      safeMode: json['safe_mode'] as bool?,
      state: json['state'] as String?,
      externalUrl: json['external_url'] as String?,
      internalUrl: json['internal_url'] as String?,
      currency: json['currency'] as String?,
      country: json['country'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$ConfigurationToJson(Configuration instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'elevation': instance.elevation,
      'unit_system': instance.unitSystem,
      'location_name': instance.locationName,
      'time_zone': instance.timeZone,
      'components': instance.components,
      'config_dir': instance.configDir,
      'whitelist_external_dirs': instance.whitelistExternalDirs,
      'allowlist_external_dirs': instance.allowlistExternalDirs,
      'allowlist_external_urls': instance.allowlistExternalUrls,
      'version': instance.version,
      'config_source': instance.configSource,
      'safe_mode': instance.safeMode,
      'state': instance.state,
      'external_url': instance.externalUrl,
      'internal_url': instance.internalUrl,
      'currency': instance.currency,
      'country': instance.country,
      'language': instance.language,
    };
