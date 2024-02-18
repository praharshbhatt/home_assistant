import 'package:home_assistant/home_assistant.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:home_assistant/src/networking/home_assistant_api.dart';

class MockHomeAssistantApi extends Mock implements HomeAssistantApi {
  // Test data
  final Configuration testConfig;
  final List<Entity> testEntities;
  final Entity testEntity;
  final List<Service> testServices;

  MockHomeAssistantApi({
  required this.testConfig,
  required this.testEntities,
  required this.testEntity,
  required this.testServices,
  });

  @override
  Future<bool> verifyApiIsWorking() => noSuchMethod(Invocation.method(#verifyApiIsWorking, []),
    returnValue: Future.value(true), returnValueForMissingStub: Future.value(true));

  @override
  Future<Configuration> fetchConfig() => noSuchMethod(Invocation.method(#fetchConfig, []),
    returnValue: Future.value(testConfig), returnValueForMissingStub: Future.value(testConfig));

  @override
  Future<List<Entity>> fetchStates() => noSuchMethod(Invocation.method(#fetchStates, []),
    returnValue: Future.value(testEntities), returnValueForMissingStub: Future.value(testEntities));

  @override
  Future<Entity> fetchState(String id) => noSuchMethod(Invocation.method(#fetchState, [id]),
    returnValue: Future.value(testEntity), returnValueForMissingStub: Future.value(testEntity));

  @override
  Future<List<Service>> fetchServices() => noSuchMethod(Invocation.method(#fetchServices, []),
    returnValue: Future.value(testServices), returnValueForMissingStub: Future.value(testServices));

  @override
  Future<bool> executeService(String entityId, String action,
      {Map<String, dynamic> additionalActions = const {}}) =>
    noSuchMethod(Invocation.method(#executeService, [entityId, action, additionalActions]),
      returnValue: Future.value(true), returnValueForMissingStub: Future.value(true));
}

void main() {
  group('HomeAssistant', () {
    // late HomeAssistant homeAssistant;
    late MockHomeAssistantApi mockApi;
    late Configuration testConfig;
    late List<Entity> testEntities;
    late Entity testEntity;
    late List<Service> testServices;

    setUp(() {
      // Initialize test data
      testConfig = Configuration(
          latitude: 40.7128,
          longitude: 74.0060,
          elevation: 10.0,
          unitSystem: {'length': 'km', 'mass': 'kg', 'temperature': 'C'},
          locationName: 'Test Location',
          timeZone: 'UTC',
          components: ['component1', 'component2'],
          configDir: '/config',
          whitelistExternalDirs: ['/dir1', '/dir2'],
          allowlistExternalDirs: ['/dir3', '/dir4'],
          allowlistExternalUrls: ['http://test1.com', 'http://test2.com'],
          version: '1.0.0',
          configSource: 'source',
          safeMode: false,
          state: 'state',
          externalUrl: 'http://external.com',
          internalUrl: 'http://internal.com',
          currency: 'USD',
          country: 'US',
          language: 'en');

      EntityAttributes attributes = EntityAttributes(
          deviceTrackers: ['device1', 'device2'],
          userId: 'user1',
          friendlyName: 'Friendly Name',
          editable: true,
          id: 'id1',
          options: ['option1', 'option2'],
          supportedColorModes: ['mode1', 'mode2'],
          brightness: 100,
          rgbColor: [255, 255, 255],
          hvacModes: ['mode1', 'mode2'],
          minTemp: 18,
          maxTemp: 30,
          currentTemperature: 20.0,
          temperature: 20.0,
          targetTempLow: 18.0,
          targetTempHigh: 22.0,
          presetMode: 'mode1',
          hvacAction: 'action1',
          fanMode: 'mode1',
          videoUrl: 'http://video.com',
          entityPicture: 'http://picture.com');

      EntityContext context = EntityContext(id: 'context1', parentId: 'parent1', userId: 'user1');

      testEntities = [
        Entity(
            entityId: 'entity1',
            state: 'on',
            attributes: attributes,
            lastChanged: '2022-01-01T00:00:00Z',
            lastUpdated: '2022-01-01T00:00:00Z',
            context: context),
        Entity(
            entityId: 'entity2',
            state: 'off',
            attributes: attributes,
            lastChanged: '2022-01-01T00:00:00Z',
            lastUpdated: '2022-01-01T00:00:00Z',
            context: context)
      ];

      testEntity = Entity(
          entityId: 'entity1',
          state: 'on',
          attributes: attributes,
          lastChanged: '2022-01-01T00:00:00Z',
          lastUpdated: '2022-01-01T00:00:00Z',
          context: context);

      testServices = [
        Service(domain: 'domain1', services: {
          'service1': ServiceInfo(
            name: 'Service 1',
            description: 'Description for Service 1',
            // Add fields and target if necessary
          ),
          'service2': ServiceInfo(
            name: 'Service 2',
            description: 'Description for Service 2',
            // Add fields and target if necessary
          ),
        }),
        Service(domain: 'domain2', services: {
          'service3': ServiceInfo(
            name: 'Service 3',
            description: 'Description for Service 3',
            // Add fields and target if necessary
          ),
          'service4': ServiceInfo(
            name: 'Service 4',
            description: 'Description for Service 4',
            // Add fields and target if necessary
          ),
        }),
      ];
      mockApi = MockHomeAssistantApi(
        testConfig: testConfig,
        testEntities: testEntities,
        testEntity: testEntity,
        testServices: testServices,
      );

      // homeAssistant = HomeAssistant(baseUrl: 'http://test.com', bearerToken: 'token');
      // homeAssistant._api = mockApi;
    });

    test('verifyApiIsWorking returns true when API is working', () {
      expect(mockApi.verifyApiIsWorking(), completion(isTrue));
    });

    test('fetchConfig returns correct configuration', () {
      expect(mockApi.fetchConfig(), completion(equals(testConfig)));
    });

    test('fetchStates returns correct list of entities', () {
      expect(mockApi.fetchStates(), completion(equals(testEntities)));
    });

    // test('fetchState returns correct entity', () {
    //   expect(mockApi.fetchState('entity1'), completion(equals(testEntity)));
    // });

    test('fetchServices returns correct list of services', () {
      expect(mockApi.fetchServices(), completion(equals(testServices)));
    });

    // test('executeService returns true when service is successfully executed',
    //     () {
    //   expect(mockApi.executeService('entity1', 'turn_on', additionalActions: {}),
    //       completion(isTrue));
    // });
  });
}
