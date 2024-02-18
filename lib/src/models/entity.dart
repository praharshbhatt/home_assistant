class Entity {
  String entityId;
  String state;
  EntityAttributes attributes;
  String lastChanged;
  String lastUpdated;
  EntityContext context;

  Entity({
    required this.entityId,
    required this.state,
    required this.attributes,
    required this.lastChanged,
    required this.lastUpdated,
    required this.context,
  });

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      entityId: json['entity_id'],
      state: json['state'],
      attributes: EntityAttributes.fromJson(json['attributes']),
      lastChanged: json['last_changed'],
      lastUpdated: json['last_updated'],
      context: EntityContext.fromJson(json['context']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'entity_id': entityId,
      'state': state,
      'attributes': attributes.toJson(),
      'last_changed': lastChanged,
      'last_updated': lastUpdated,
      'context': context.toJson(),
    };
  }
}

class EntityAttributes {
  bool? editable;
  String? id;
  String? userId;
  List<String> deviceTrackers;
  String friendlyName;

  // Light
  List<String>? options, supportedColorModes;
  int? brightness;
  List<int>? rgbColor;

  // Climate
  List<String>? hvacModes;
  int? minTemp, maxTemp;
  double? currentTemperature, temperature, targetTempLow, targetTempHigh;
  String? presetMode, hvacAction, fanMode;

  // Camera
  String? videoUrl, entityPicture;

  EntityAttributes({
    required this.deviceTrackers,
    required this.userId,
    required this.friendlyName,
    this.editable,
    this.id,
    this.options,

    // Light
    this.supportedColorModes,
    this.brightness,
    this.rgbColor,

    // Climate
    this.hvacModes,
    this.minTemp,
    this.maxTemp,
    this.currentTemperature,
    this.temperature,
    this.targetTempLow,
    this.targetTempHigh,
    this.presetMode,
    this.hvacAction,
    this.fanMode,

    // Camera
    this.videoUrl,
    this.entityPicture,
  });

  factory EntityAttributes.fromJson(Map<String, dynamic> json) {
    return EntityAttributes(
      editable: json['editable'],
      id: json['id'],
      userId: json['user_id'],
      deviceTrackers: json.containsKey('device_trackers') ? List<String>.from(json['device_trackers']) : [],
      friendlyName: json['friendly_name'],
      options: json.containsKey('options') ? List<String>.from(json['options']) : [],

      // Light
      supportedColorModes:
          json.containsKey('supported_color_modes') ? List<String>.from(json['supported_color_modes']) : [],
      brightness: json.containsKey('brightness') ? json['brightness'] : null,
      rgbColor: json.containsKey('rgb_color') ? List<int>.from(json['rgb_color']) : null,

      // Climate
      hvacModes: json.containsKey('hvac_modes') ? List<String>.from(json['hvac_modes']) : null,
      minTemp: json.containsKey('min_temp') ? json['min_temp'] : null,
      maxTemp: json.containsKey('max_temp') ? json['max_temp'] : null,
      currentTemperature: json.containsKey('current_temperature') ? json['current_temperature'] : null,
      temperature: json.containsKey('temperature') ? json['temperature'] : null,
      targetTempLow: json.containsKey('target_temp_low') ? json['target_temp_low'] : null,
      targetTempHigh: json.containsKey('target_temp_high') ? json['target_temp_high'] : null,
      presetMode: json.containsKey('preset_mode') ? json['preset_mode'] : null,
      hvacAction: json.containsKey('hvac_action') ? json['hvac_action'] : null,
      fanMode: json.containsKey('fan_mode') ? json['fan_mode'] : null,

      // Camera
      videoUrl: json.containsKey('video_url') ? json['video_url'] : null,
      entityPicture: json.containsKey('entity_picture') ? json['entity_picture'] : null,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'editable': editable,
      'id': id,
      'user_id': userId,
      'device_trackers': deviceTrackers,
      'friendly_name': friendlyName,

      // Light
      'brightness': brightness != null ? brightness : null,
      'supported_color_modes': supportedColorModes != null ? supportedColorModes : null,
      'rgb_color': rgbColor != null ? rgbColor : null,

      // Climate
      'hvac_modes': hvacModes != null ? hvacModes : null,
      'min_temp': minTemp,
      'max_temp': maxTemp,
      'current_temperature': currentTemperature,
      'temperature': temperature,
      'target_temp_low': targetTempLow,
      'target_temp_high': targetTempHigh,
      'preset_mode': presetMode,
      'hvac_action': hvacAction,
      'fan_mode': fanMode,

      // Camera
      'video_url': videoUrl,
      'entity_picture': entityPicture,
    };
  }
}

class EntityContext {
  String id;
  String? parentId;
  String? userId;

  EntityContext({
    required this.id,
    this.parentId,
    this.userId,
  });

  factory EntityContext.fromJson(Map<String, dynamic> json) {
    return EntityContext(
      id: json['id'],
      parentId: json['parent_id'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parent_id': parentId,
      'user_id': userId,
    };
  }
}
