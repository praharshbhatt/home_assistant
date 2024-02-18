import 'package:test/test.dart';

import 'package:home_assistant/src/home_assistant_base.dart';

void main() {
  group('HomeAssistant', () {
    late HomeAssistant homeAssistant;

    setUp(() {
      homeAssistant = HomeAssistant(
        baseUrl: 'http://example.com',
        bearerToken: 'your_token',
      );
    });

    test('verifyApiIsWorking returns true for a working API', () async {
      final result = await homeAssistant.verifyApiIsWorking();
      expect(result, isTrue);
    });

    test('verifyApiIsWorking returns false for a non-working API', () async {
      final result = await homeAssistant.verifyApiIsWorking();
      expect(result, isFalse);
    });
  });
}
