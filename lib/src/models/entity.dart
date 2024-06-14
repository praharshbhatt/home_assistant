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
  double? brightness;
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
    bool containsKeyAndValue(Map<String, dynamic> json, String key){
      return json.containsKey(key) && json[key] != null;
    }

    return EntityAttributes(
      editable: json['editable'],
      id: json['id'],
      userId: json['user_id'],
      deviceTrackers: containsKeyAndValue(json, 'device_trackers') ? List<String>.from(json['device_trackers']) : [],
      friendlyName: json['friendly_name'],
      options: containsKeyAndValue(json, 'options') ? List<String>.from(json['options']) : [],

      // Light
      supportedColorModes:
          containsKeyAndValue(json, 'supported_color_modes') ? List<String>.from(json['supported_color_modes']) : [],
      brightness: containsKeyAndValue(json, 'brightness') ? json['brightness'].toDouble() : null,
      rgbColor: containsKeyAndValue(json, 'rgb_color') ? List<int>.from(json['rgb_color']) : null,

      // Climate
      hvacModes: containsKeyAndValue(json, 'hvac_modes') ? List<String>.from(json['hvac_modes']) : null,
      minTemp: containsKeyAndValue(json, 'min_temp') ? json['min_temp'] : null,
      maxTemp: containsKeyAndValue(json, 'max_temp') ? json['max_temp'] : null,
      currentTemperature: containsKeyAndValue(json, 'current_temperature') ? json['current_temperature'] : null,
      temperature: containsKeyAndValue(json, 'temperature') ? json['temperature'] : null,
      targetTempLow: containsKeyAndValue(json, 'target_temp_low') ? json['target_temp_low'] : null,
      targetTempHigh: containsKeyAndValue(json, 'target_temp_high') ? json['target_temp_high'] : null,
      presetMode: containsKeyAndValue(json, 'preset_mode') ? json['preset_mode'] : null,
      hvacAction: containsKeyAndValue(json, 'hvac_action') ? json['hvac_action'] : null,
      fanMode: containsKeyAndValue(json, 'fan_mode') ? json['fan_mode'] : null,

      // Camera
      videoUrl: containsKeyAndValue(json, 'video_url') ? json['video_url'] : null,
      entityPicture: containsKeyAndValue(json, 'entity_picture') ? json['entity_picture'] : null,

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
