import 'package:edge_dart_runtime/edge_dart_runtime.dart';
import 'package:test/test.dart';

void main() {
  group('Request', () {
    test('.method', () {
      final resource = Resource('https://foo.com');

      expect(
        Request(resource).method,
        'GET',
        reason: 'The default method is should be GET',
      );

      expect(Request(resource, method: 'GET').method, 'GET');
      expect(Request(resource, method: 'POST').method, 'POST');
      expect(Request(resource, method: 'OPTIONS').method, 'OPTIONS');
    });

    test('.url', () {
      // Browser adds a / to the path if empty
      final uri = Uri.parse('https://foo.com/');
      final resource = Resource.uri(uri);

      expect(Request(resource).url, uri);
      expect(Request(Resource('https://foo.com?foo=bar')).url.queryParameters, {
        'foo': 'bar',
      });
    });

    test('.headers', () {
      final request = Request(
        Resource(
          'https://foo.com',
        ),
        headers: Headers({
          'foo': 'bar',
        }),
      );

      expect(request.headers.get('foo'), 'bar');
    });

    test('.destination', () {
      final request = Request(Resource('https://foo.com'));
      expect(request.destination, RequestDestination.empty);
    });

    test('.destination', () {
      final request = Request(
        Resource('https://foo.com'),
        referrer: 'https://example.com',
      );

      expect(request.referrer.isNotEmpty, true);
    });

    test('.referrerPolicy', () {
      final request = Request(
        Resource('https://foo.com'),
        referrerPolicy: ReferrerPolicy.origin,
      );

      expect(request.referrerPolicy, ReferrerPolicy.origin);
    });

    test('.mode', () {
      final request = Request(
        Resource('https://foo.com'),
        mode: RequestMode.cors,
      );

      expect(request.mode, RequestMode.cors);
    });

    test('.mode', () {
      final request = Request(
        Resource('https://foo.com'),
        credentials: RequestCredentials.sameOrigin,
      );

      expect(request.credentials, RequestCredentials.sameOrigin);
    });

    test('.cache', () {
      final request = Request(
        Resource('https://foo.com'),
        cache: RequestCache.noStore,
      );

      expect(request.cache, RequestCache.noStore);
    });

    test('.redirect', () {
      final request = Request(
        Resource('https://foo.com'),
        redirect: RequestRedirect.error,
      );

      expect(request.redirect, RequestRedirect.error);
    });

    test('.destination', () {
      final request = Request(
        Resource('https://foo.com'),
        integrity: 'foo',
      );

      expect(request.integrity, 'foo');
    });

    test('.keepalive', () {
      final request = Request(Resource('https://foo.com'));

      final request2 = Request(
        Resource('https://foo.com'),
        keepalive: true,
      );

      expect(request.keepalive, false);
      expect(request2.keepalive, true);
    });

    test('.signal', () {
      final request = Request(Resource('https://foo.com'));

      // Forces it through to make sure it comes from the correct delegate.
      // ignore: unnecessary_type_check
      expect(request.signal is AbortSignal, true);
    });

    test('.bodyUsed', () async {
      final request = Request(
        Resource(
          'https://foo.com',
        ),
        method: 'POST',
        body: 'foo',
      );
      expect(request.bodyUsed, false);
      expect(await request.text(), 'foo');
      expect(request.bodyUsed, true);
    });

    test('.clone()', () async {
      final request = Request(Resource('https://foo.com'));
      final clone = request.clone();
      expect(request.url.toString(), clone.url.toString());
    });

    // TODO body
    // TODO formData
    // TODO json

    test('.text()', () async {
      final request = Request(
        Resource(
          'https://foo.com',
        ),
        method: 'POST',
        body: 'foo',
      );

      expect(await request.text(), 'foo');
    });
  });
}
