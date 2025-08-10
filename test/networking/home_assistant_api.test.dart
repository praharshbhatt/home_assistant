import 'dart:convert';

import 'package:home_assistant/home_assistant.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:home_assistant/src/networking/home_assistant_api.dart';
import 'package:http/http.dart' as http;

import '../mocks/mock_http_client.dart';

void main() {
  group('HomeAssistantApi', () {
    late MockHttpClient mockHttpClient;
    late HomeAssistantApi api;

    setUp(() {
      mockHttpClient = MockHttpClient();
      api = HomeAssistantApi(httpClient: mockHttpClient);
    });

    test('verifyApiIsWorking returns true when API is running', () async {
      when(mockHttpClient.get('/api/')).thenAnswer(
        (_) async => http.Response(
          '{"message":"API running."}',
          200,
        ),
      );
      final result = await api.verifyApiIsWorking();
      expect(result, isTrue);
    });

    test('verifyApiIsWorking throws on error', () async {
      when(mockHttpClient.get('/api/')).thenAnswer(
        (_) async => http.Response(
          'Unauthorized',
          401,
        ),
      );
      expect(() => api.verifyApiIsWorking(), throwsException);
    });

    test('fetchConfig returns Configuration on success', () async {
      final configJson = {
        'location_name': 'Home',
        // Add other required fields for Configuration.fromJson
      };
      when(mockHttpClient.get('/api/config')).thenAnswer(
        (_) async => http.Response(jsonEncode(configJson), 200),
      );
      final result = await api.fetchConfig();
      expect(result, isA<Configuration>());
      expect(result.locationName, equals('Home'));
    });

    test('fetchConfig throws on error', () async {
      when(mockHttpClient.get('/api/config')).thenAnswer(
        (_) async => http.Response('Error', 500),
      );
      expect(() => api.fetchConfig(), throwsException);
    });

    test('fetchStates returns list of Entity on success', () async {
      final statesJson = [
        {
          'entity_id': 'light.living_room',
          'state': 'on',
          'last_updated': '2025-05-23T12:00:00+00:00',
          'last_changed': '2025-05-23T12:00:00+00:00',
          'last_reported': '2025-05-23T12:00:00+00:00',
          'attributes': {},
          'context': {},
        },
      ];
      when(mockHttpClient.get('/api/states')).thenAnswer(
        (_) async => http.Response(jsonEncode(statesJson), 200),
      );
      final result = await api.fetchStates();
      expect(result, isA<List<Entity>>());
      expect(result.length, equals(1));
      expect(result[0].entityId, equals('light.living_room'));
    });

    test('fetchStates throws on error', () async {
      when(mockHttpClient.get('/api/states')).thenAnswer(
        (_) async => http.Response('Error', 500),
      );
      expect(() => api.fetchStates(), throwsException);
    });

    test('fetchState returns Entity on success', () async {
      final entityJson = {
        'entity_id': 'light.living_room',
        'state': 'on',
        'last_updated': '2025-05-23T12:00:00+00:00',
        'last_changed': '2025-05-23T12:00:00+00:00',
        'last_reported': '2025-05-23T12:00:00+00:00',
        'attributes': {},
        'context': {},
      };
      when(mockHttpClient.get('/api/states/light.living_room')).thenAnswer(
        (_) async => http.Response(jsonEncode(entityJson), 200),
      );
      final result = await api.fetchState('light.living_room');
      expect(result, isA<Entity>());
      expect(result.entityId, equals('light.living_room'));
    });

    test('fetchState throws on error', () async {
      when(mockHttpClient.get('/api/states/light.living_room')).thenAnswer(
        (_) async => http.Response('Error', 404),
      );
      expect(() => api.fetchState('light.living_room'), throwsException);
    });

    test('fetchServices returns list of Service on success', () async {
      final servicesJson = [
        {
          'domain': 'light',
          'services': {},
        },
      ];
      when(mockHttpClient.get('/api/services')).thenAnswer(
        (_) async => http.Response(jsonEncode(servicesJson), 200),
      );
      final result = await api.fetchServices();
      expect(result, isA<List<Service>>());
      expect(result.length, equals(1));
      expect(result[0].domain, equals('light'));
    });

    test('fetchServices throws on error', () async {
      when(mockHttpClient.get('/api/services')).thenAnswer(
        (_) async => http.Response('Error', 500),
      );
      expect(() => api.fetchServices(), throwsException);
    });

    test('executeService returns true on success', () async {
      when(mockHttpClient.post('/api/services/light/turn_on', any)).thenAnswer(
        (_) async => http.Response('', 200),
      );
      final result = await api.executeService('light.living_room', 'turn_on');
      expect(result, isTrue);
    });

    test('executeService returns false on failure', () async {
      when(mockHttpClient.post('/api/services/light/turn_on', any)).thenAnswer(
        (_) async => http.Response('Error', 400),
      );
      final result = await api.executeService('light.living_room', 'turn_on');
      expect(result, isFalse);
    });
  });
}
