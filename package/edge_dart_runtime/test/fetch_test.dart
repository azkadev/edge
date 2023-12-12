import 'package:test/test.dart';

import 'utils.dart';

void main() {
  group('fetch', () {
    test('it performs a GET request', () async {
      final response = await fetchFromServer('/200');
      expect(response.status, 200);
      expect(await response.text(), 'GET');
    });

    test('it performs a POST request', () async {
      final response = await fetchFromServer('/200', method: 'POST');
      expect(response.status, 200);
      expect(await response.text(), 'POST');
    });
  });
}
