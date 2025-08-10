import 'package:json_annotation/json_annotation.dart';

part 'configuration.g.dart';

/// Represents the configuration of a Home Assistant instance.
///
/// This class contains various settings and properties of the Home Assistant
/// instance, such as allowed external directories, URLs, and other metadata.
@JsonSerializable(fieldRename: FieldRename.snake)
class Configuration {
  /// The latitude of the Home Assistant instance's location.
  final double? latitude;

  /// The longitude of the Home Assistant instance's location.
  final double? longitude;

  /// The elevation (in meters) of the Home Assistant instance's location.
  final double? elevation;

  /// The unit system used by the Home Assistant instance.
  ///
  /// This includes units for temperature, length, and other measurements.
  @JsonKey(name: 'unit_system')
  final Map<String, String>? unitSystem;

  /// The name of the location where the Home Assistant instance is running.
  @JsonKey(name: 'location_name')
  final String? locationName;

  /// The time zone of the Home Assistant instance.
  @JsonKey(name: 'time_zone')
  final String? timeZone;

  /// A list of components enabled in the Home Assistant instance.
  final List<String>? components;

  /// The directory where the Home Assistant configuration is stored.
  @JsonKey(name: 'config_dir')
  final String? configDir;

  /// A list of directories that are whitelisted for external access.
  @JsonKey(name: 'whitelist_external_dirs')
  final List<String>? whitelistExternalDirs;

  /// A list of directories that are allowed for external access.
  @JsonKey(name: 'allowlist_external_dirs')
  final List<String>? allowlistExternalDirs;

  /// A list of URLs that are allowed for external access.
  @JsonKey(name: 'allowlist_external_urls')
  final List<String>? allowlistExternalUrls;

  /// The version of the Home Assistant instance.
  final String? version;

  /// The source of the configuration (e.g., YAML or UI).
  @JsonKey(name: 'config_source')
  final String? configSource;

  /// Indicates whether the Home Assistant instance is running in safe mode.
  @JsonKey(name: 'safe_mode')
  final bool? safeMode;

  /// The current state of the Home Assistant instance.
  final String? state;

  /// The external URL of the Home Assistant instance.
  @JsonKey(name: 'external_url')
  final String? externalUrl;

  /// The internal URL of the Home Assistant instance.
  @JsonKey(name: 'internal_url')
  final String? internalUrl;

  /// The currency used by the Home Assistant instance.
  final String? currency;

  /// The country where the Home Assistant instance is located.
  final String? country;

  /// The language used by the Home Assistant instance.
  final String? language;

  /// Creates a new [Configuration] instance.
  ///
  /// [latitude], [longitude], [elevation], [unitSystem], [locationName],
  /// [timeZone], [components], [configDir], [whitelistExternalDirs],
  /// [allowlistExternalDirs], [allowlistExternalUrls], [version],
  /// [configSource], [safeMode], [state], [externalUrl], [internalUrl],
  /// [currency], [country], and [language] are optional parameters that
  /// describe the configuration of the Home Assistant instance.
  Configuration({
    this.latitude,
    this.longitude,
    this.elevation,
    this.unitSystem,
    this.locationName,
    this.timeZone,
    this.components,
    this.configDir,
    this.whitelistExternalDirs,
    this.allowlistExternalDirs,
    this.allowlistExternalUrls,
    this.version,
    this.configSource,
    this.safeMode,
    this.state,
    this.externalUrl,
    this.internalUrl,
    this.currency,
    this.country,
    this.language,
  });

  /// Creates a new [Configuration] instance from a JSON object.
  ///
  /// [json] is the JSON map containing the configuration data.
  factory Configuration.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationFromJson(json);

  /// Converts the [Configuration] instance to a JSON object.
  Map<String, dynamic> toJson() => _$ConfigurationToJson(this);
}