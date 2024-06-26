/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
import 'dart:convert';

import 'package:edge_dart_http_client/edge_dart_http_client.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

Future Function() run(Future Function() fn) {
  return () async {
    await http.runWithClient(fn, () => EdgeHttpClient());
  };
}

void main() {
  group('package:http Client', () {
    group('performs GET request', () {
      test('without body', run(() async {
        final Uri uri = Uri.parse('http://localhost:3001/200');
        final res = await http.get(uri);

        expect(res.statusCode, 200);
      }));

      test('with JSON body', run(() async {
        final Uri uri = Uri.parse('http://localhost:3001/200/json');
        final res = await http.get(uri);

        expect(res.statusCode, 200);
        expect(res.body, '{"foo":"bar"}');
      }));

      test('supports streaming', run(() async {
        final Uri uri = Uri.parse('http://localhost:3001/200/stream');

        final req = http.Request('GET', uri);
        final res = await req.send();

        expect(res.statusCode, 200);

        final responseChunks = await res.stream.toList();
        expect(responseChunks.length, greaterThan(1));
      }));

      group('with headers', () {
        test('content-type', run(() async {
          final Uri uri = Uri.parse('http://localhost:3001/200/json');
          final res = await http.get(uri);

          expect(res.statusCode, 200);
          expect(res.headers['content-type'], 'application/json');
        }));
      });
    });

    group('preforms POST request', () {
      test('with JSON', run(() async {
        final uri = Uri.parse('http://localhost:3001/200/json');

        final res = await http.post(
          uri,
          body: jsonEncode({'foo': 'bar'}),
          headers: {'Content-Type': 'application/json'},
        );

        expect(res.statusCode, 200);
      }));

      test('urlencoded', run(() async {
        final uri = Uri.parse('http://localhost:3001/200/urlencoded');

        final res = await http.post(
          uri,
          body: {
            'foo': 'bar',
            'baz': 'qux',
          },
        );

        print(res.body);
        expect(res.statusCode, 200);
      }));
    });

    test('sends all headers', run(() async {
      final uri = Uri.parse('http://localhost:3001/200/echoHeaders');

      const headers = {
        'accept': 'application/json',
        'connection': 'keep-alive',
        'x-custom-header': 'custom-value',
      };

      final res = await http.get(uri, headers: headers);

      expect(res.statusCode, 200);

      final body = jsonDecode(res.body) as Map<String, dynamic>;
      for (var key in headers.keys) {
        expect(body[key], headers[key]);
      }
    }));

    group('Response', () {
      test('has a correct contentLength property', run(() async {
        int contentLength = 100;

        final uri = Uri.parse(
          'http://localhost:3001/200/bytes?length=$contentLength',
        );

        final res = await http.get(uri);
        expect(res.contentLength, contentLength);
      }));
    });
  });
}
