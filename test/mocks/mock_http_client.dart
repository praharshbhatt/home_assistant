import 'package:http/http.dart' as http;
import 'package:home_assistant/src/networking/http_client.dart';
import 'package:mockito/mockito.dart';

/// A mock implementation of [HttpClient] for use in unit tests.
///
/// This class simulates the behavior of [HttpClient] without making actual
/// network requests. Use this mock to stub and verify HTTP interactions
/// in tests, ensuring that your code can be tested in isolation from
/// real network dependencies.
class MockHttpClient extends Mock implements HttpClient {
  // By default, MockHttpClient returns a null response,
  // which throws error during the test.
  // For this reason, we provide a default response.
  @override
  Future<http.Response> get(String path) => super.noSuchMethod(
        Invocation.method(#get, [path]),
        returnValue: Future.value(http.Response('', 200)),
        returnValueForMissingStub: Future.value(http.Response('', 200)),
      );

  // The same applies to the post method.
  @override
  Future<http.Response> post(String path, dynamic body) => super.noSuchMethod(
        Invocation.method(#post, [path, body]),
        returnValue: Future.value(http.Response('', 200)),
        returnValueForMissingStub: Future.value(http.Response('', 200)),
      );
}
