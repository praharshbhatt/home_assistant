import 'dart:convert';

import 'package:home_assistant/home_assistant.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'mock_http_client.dart';

void main(){
  group('FanEntity', () {
    late MockHttpClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockHttpClient();
    });

    test('verify FanEntity.fromJson', () async {
      when(mockHttpClient.get('/api/state/fan.living_room_fan')).thenAnswer(
            (_) async => http.Response(
          '''
          {
            "entity_id": "fan.living_room_fan",
            "state": "on",
            "attributes": {
              "preset_modes": [
                "auto",
                "smart",
                "sleep",
                "on"
              ],
              "direction": "reverse",
              "oscillating": true,
              "percentage": 57,
              "percentage_step": 33.333333333333336,
              "preset_mode": auto,
              "friendly_name": "Percentage Full Fan",
              "supported_features": 55
            },
            "last_changed": "2025-07-02T17:00:45.251632+00:00",
            "last_reported": "2025-07-02T19:43:30.354738+00:00",
            "last_updated": "2025-07-02T19:43:30.354738+00:00",
            "context": {
              "id": "01JZ6AMV1HJVMK57GG19WD9YBF",
              "parent_id": null,
              "user_id": "ce2ff8b46ba141e08e04efe0a62b84df"
            }
          }
        ''',
          200,
        ),
      );

      final response = await mockHttpClient.get('/api/state/fan.living_room_fan');
      final json = jsonDecode(response.body);
      final FanEntity fanEntity = FanEntity.fromJson(json);
      final attributes = fanEntity.attributes as FanEntityAttributes;

      expect(fanEntity.entityId, equals('fan.living_room_fan'));
      expect(fanEntity.state, equals('on'));
      expect(attributes.currentDirection, equals('reverse'));
      expect(attributes.presetModes, equals(["auto","smart","sleep","on"]));
      expect(attributes.presetMode, equals('auto'));
      expect(attributes.oscillating, equals(true));
      expect(attributes.percentage, equals(57));
      expect(attributes.supportedFeatures, equals(55));
      });
  });
}