/// Model class for Home Assistant configuration.
class Configuration {
  final double? latitude;
  final double? longitude;
  final double? elevation;
  final Map<String, String>? unitSystem;
  final String? locationName;
  final String? timeZone;
  final List<String>? components;
  final String? configDir;
  final List<String>? whitelistExternalDirs;
  final List<String>? allowlistExternalDirs;
  final List<String>? allowlistExternalUrls;
  final String? version;
  final String? configSource;
  final bool? safeMode;
  final String? state;
  final String? externalUrl;
  final String? internalUrl;
  final String? currency;
  final String? country;
  final String? language;

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

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      elevation: json['elevation']?.toDouble(),
      unitSystem: Map<String, String>.from(json['unit_system']),
      locationName: json['location_name'],
      timeZone: json['time_zone'],
      components: List<String>.from(json['components']),
      configDir: json['config_dir'],
      whitelistExternalDirs: List<String>.from(json['whitelist_external_dirs']),
      allowlistExternalDirs: List<String>.from(json['allowlist_external_dirs']),
      allowlistExternalUrls: List<String>.from(json['allowlist_external_urls']),
      version: json['version'],
      configSource: json['config_source'],
      safeMode: json['safe_mode'],
      state: json['state'],
      externalUrl: json['external_url'],
      internalUrl: json['internal_url'],
      currency: json['currency'],
      country: json['country'],
      language: json['language'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'elevation': elevation,
      'unit_system': unitSystem,
      'location_name': locationName,
      'time_zone': timeZone,
      'components': components,
      'config_dir': configDir,
      'whitelist_external_dirs': whitelistExternalDirs,
      'allowlist_external_dirs': allowlistExternalDirs,
      'allowlist_external_urls': allowlistExternalUrls,
      'version': version,
      'config_source': configSource,
      'safe_mode': safeMode,
      'state': state,
      'external_url': externalUrl,
      'internal_url': internalUrl,
      'currency': currency,
      'country': country,
      'language': language,
    };
  }
}
