import 'package:test/test.dart';
import 'package:edge_dart_runtime/edge_dart_runtime.dart';

import 'utils.dart';

void main() {
  group('CacheStorage', () {
    test('caches', () {
      final cache = caches;
      expect(cache, isNotNull);
    });

    test('.has()', () async {
      await caches.open('exists');

      expect(await caches.has('does-not-exist'), isFalse);
      expect(await caches.has('exists'), isTrue);
    });

    test('.delete()', () async {
      await caches.open('exists');
      expect(await caches.has('exists'), isTrue);
      await caches.delete('exists');
      expect(await caches.has('exists'), isFalse);
    });

    test('.keys()', () async {
      await caches.open('one');
      await caches.open('two');
      expect(await caches.keys(), ['one', 'two']);
    });

    test('.match()', () async {
      final request = Request(Resource('https://foo.com'));
      final response = Response('foo');

      expect(await caches.match(request), isNull);
      final cache = await caches.open('match');
      await cache.put(request, response);
      final match = await caches.match(request);
      expect(match, isNotNull);
      expect(await match!.text(), 'foo');
    });
  });

  group('Cache', () {
    test('.add()', () async {
      final request = serverRequest('/200');
      final cache = await caches.open('add');
      await cache.add(request);
      expect(await cache.match(request), isNotNull);
    });

    test('.addAll()', () async {
      final request1 = serverRequest('/200');
      final request2 = serverRequest('/200/json');
      final cache = await caches.open('add');
      await cache.addAll([request1, request2]);
      expect(await cache.match(request1), isNotNull);
      expect(await cache.match(request2), isNotNull);
    });

    test('.delete()', () async {
      final request = serverRequest('/200');
      final cache = await caches.open('delete');
      await cache.add(request);
      expect(await cache.match(request), isNotNull);
      await cache.delete(request);
      expect(await cache.match(request), isNull);
    });

    test('.match()', () async {
      final request = serverRequest('/200');
      final cache = await caches.open('match');
      expect(await cache.match(request), isNull);
      await cache.add(request);
      expect(await cache.match(request), isNotNull);
    });

    test('.matchAll()', () async {
      final request = serverRequest('/200');
      final cache = await caches.open('matchAll');
      expect(await cache.matchAll(), isEmpty);
      await cache.add(request);
      expect(await cache.matchAll(), isNotEmpty);
      final matches = await cache.matchAll(request);
      expect(await cache.matchAll(request), isNotEmpty);
      expect(matches.first.url.path, '/200');
    });

    test('.put()', () async {
      final request = serverRequest('/200');
      final response = Response('foo');
      final cache = await caches.open('put');
      await cache.put(request, response);
      final match = await cache.match(request);
      expect(match, isNotNull);
      expect(await match!.text(), 'foo');
    });
  });
}
