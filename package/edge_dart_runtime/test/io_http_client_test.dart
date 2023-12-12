import 'dart:convert';

import 'package:edge_dart_runtime/edge_dart_runtime.dart';
import 'package:test/test.dart';

void main() {
  final client = HttpClient();

  group('dart:io HttpClient', () {
    group('perfroms GET request', () {
      test('without body', () async {
        final Uri uri = Uri.parse('http://localhost:3001/200');
        final req = await client.getUrl(uri);
        final res = await req.close();

        expect(res.statusCode, 200);
      });

      test('with JSON body', () async {
        final Uri uri = Uri.parse('http://localhost:3001/200/json');
        final req = await client.getUrl(uri);
        final res = await req.close();

        expect(res.statusCode, 200);
        expect(await res.transform(utf8.decoder).join(), '{"foo":"bar"}');
      });

      test('supports streaming', () async {
        final Uri uri = Uri.parse('http://localhost:3001/200/stream');
        final req = await client.getUrl(uri);
        final res = await req.close();

        expect(res.statusCode, 200);

        final responseChunks = await res.toList();
        expect(responseChunks.length, greaterThan(1));
      });

      group('with headers', () {
        test('content-type', () async {
          final Uri uri = Uri.parse('http://localhost:3001/200/json');
          final req = await client.getUrl(uri);
          final res = await req.close();

          expect(res.statusCode, 200);
          expect(res.headers.contentType?.mimeType, 'application/json');
        });
      });
    });

    group('performs POST request', () {
      test('with JSON', () async {
        final uri = Uri.parse('http://localhost:3001/200/json');

        final req = await client.postUrl(uri);
        req.headers.add('content-type', 'application/json');

        final body = {'foo': 'bar'};

        req.write(jsonEncode(body));
        final res = await req.close();

        expect(res.statusCode, 200);
      });
    });

    group('HttpClientRequest', () {
      test('sends all headers', () async {
        final uri = Uri.parse('http://localhost:3001/200/echoHeaders');
        final req = await client.getUrl(uri);

        final headers = {
          'accept': 'application/json',
          'connection': 'keep-alive',
          'x-custom-header': 'custom-value',
        };

        headers.forEach((key, value) {
          req.headers.add(key, value);
        });

        final res = await req.close();

        expect(res.statusCode, 200);

        final responseHeadersString = await res.transform(utf8.decoder).join();
        final body = jsonDecode(responseHeadersString) as Map<String, dynamic>;

        for (var key in headers.keys) {
          expect(body[key], headers[key]);
        }
      });
    });

    group('HttpClientResponse', () {
      test('has a correct contentLength property', () async {
        int contentLength = 100;

        final uri = Uri.parse(
          'http://localhost:3001/200/bytes?length=$contentLength',
        );

        final req = await client.getUrl(uri);
        final res = await req.close();

        expect(res.contentLength, contentLength);
      });
    });
  });
}
