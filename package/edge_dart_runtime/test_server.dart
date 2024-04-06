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

import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main() async {
  var app = Router();

  app.get('/200', (Request request) {
    return Response.ok('GET');
  });

  app.get('/200/json', (Request request) {
    return Response(
      200,
      body: jsonEncode({
        'foo': 'bar',
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

  app.get('/200/bytes', (Request request) {
    return Response(
      200,
      body: List.generate(
        int.parse(request.url.queryParameters['length']!),
        (index) => index % 256,
      ),
      headers: {
        'Content-Type': 'application/octet-stream',
        'Content-Length': request.url.queryParameters['length']!,
      },
    );
  });

  app.get('/200/echoHeaders', (Request request) {
    return Response(
      200,
      body: jsonEncode(request.headers),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

  app.get('/200/stream', (Request request) {
    return Response(
      200,
      body: Stream.fromIterable(
        List.generate(100, (index) {
          return List.generate(10 * 1024, (index) => index % 256);
        }),
      ),
      headers: {
        'Content-Type': 'application/octet-stream',
        'Content-Length': '${10 * 1024 * 100}',
      },
    );
  });

  app.post('/200/json', (Request request) async {
    final headers = request.headers;

    if (headers['content-type'] != 'application/json') {
      return Response(400, body: 'Invalid content-type');
    }

    final body = await request.readAsString();

    if (int.tryParse(headers['content-length']!) != body.length) {
      return Response(400, body: 'Invalid content-length');
    }

    print(body);

    if (body != '{"foo":"bar"}') {
      return Response(400, body: 'Invalid body');
    }

    return Response(200);
  });

  app.post('/200/urlencoded', (Request request) async {
    final headers = request.headers;
    if (headers['content-type'] !=
        'application/x-www-form-urlencoded; charset=utf-8') {
      return Response(400, body: 'Invalid content-type');
    }

    print('\n' + headers.entries.join('\n'));
    final body = await request.readAsString();

    if (int.tryParse(headers['content-length']!) != body.length) {
      return Response(400, body: 'Invalid content-length');
    }

    print(body);
    print(body == 'foo=bar&baz=qux');

    if (body != 'foo=bar&baz=qux') {
      return Response(400, body: 'Invalid body');
    }

    return Response(200);
  });

  const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': '*',
    'Access-Control-Allow-Headers': '*',
  };

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware((innerHandler) {
    return (request) async {
      final response = await innerHandler(request);

      if (request.method == 'OPTIONS') {
        return Response.ok('', headers: corsHeaders);
      }

      // Move onto handler
      return response.change(headers: {
        ...response.headers,
        ...corsHeaders,
      });
    };
  }).addHandler(app);

  final server = await io.serve(handler, '127.0.0.1', 3001);

  print('Serving at http://${server.address.host}:${server.port}');
}
