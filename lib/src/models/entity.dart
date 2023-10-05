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
  List<String>? options, supportedColorModes;

  EntityAttributes({
    this.editable,
    this.id,
    this.options,
    this.supportedColorModes,
    required this.deviceTrackers,
    required this.userId,
    required this.friendlyName,
  });

  factory EntityAttributes.fromJson(Map<String, dynamic> json) {
    return EntityAttributes(
      editable: json['editable'],
      id: json['id'],
      userId: json['user_id'],
      deviceTrackers: json.containsKey('device_trackers') ? List<String>.from(json['device_trackers']) : [],
      friendlyName: json['friendly_name'],
      options: json.containsKey('options') ? List<String>.from(json['options']) : [],
      supportedColorModes:
          json.containsKey('supportedColorModes') ? List<String>.from(json['supportedColorModes']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'editable': editable,
      'id': id,
      'user_id': userId,
      'device_trackers': deviceTrackers,
      'friendly_name': friendlyName,
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
