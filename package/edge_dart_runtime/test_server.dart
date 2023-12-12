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
