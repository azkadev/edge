library edge_http_client_unofficial;

import 'dart:typed_data';
import 'dart:convert';

// todo: this should come from edge_io
import 'package:edge_dart_runtime/edge_dart_runtime.dart' show HttpClient;
import 'package:http/http.dart' as http;

/// A Edge compatible [http.Client] implementation.
class EdgeHttpClient implements http.Client {
  final _ioClient = HttpClient();

  static const _allowedBodyMethods = {
    'POST',
    'PUT',
    'PATCH',
    'DELETE',
  };

  @override
  void close() {
    _ioClient.close();
  }

  @override
  Future<http.Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return _makeRequest(
      method: 'DELETE',
      url: url,
      body: body,
      headers: headers,
      encoding: encoding ?? utf8,
    );
  }

  @override
  Future<http.Response> get(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    return _makeRequest(
      method: 'GET',
      url: url,
      headers: headers,
    );
  }

  @override
  Future<http.Response> head(
    Uri url, {
    Map<String, String>? headers,
  }) {
    return _makeRequest(
      method: 'HEAD',
      url: url,
      headers: headers,
    );
  }

  @override
  Future<http.Response> patch(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return _makeRequest(
      method: 'PATCH',
      url: url,
      body: body,
      headers: headers,
      encoding: encoding ?? utf8,
    );
  }

  @override
  Future<http.Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return _makeRequest(
      method: 'POST',
      url: url,
      body: body,
      headers: headers,
      encoding: encoding ?? utf8,
    );
  }

  @override
  Future<http.Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return _makeRequest(
      method: 'PUT',
      url: url,
      body: body,
      headers: headers,
      encoding: encoding ?? utf8,
    );
  }

  @override
  Future<String> read(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    final req = http.Request('GET', url);
    req.headers.addAll(headers ?? {});

    final res = await send(req);
    return res.stream.bytesToString();
  }

  @override
  Future<Uint8List> readBytes(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    final req = http.Request('GET', url);
    req.headers.addAll(headers ?? {});

    final res = await send(req);
    return res.stream.toBytes();
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final req = await _ioClient.openUrl(request.method, request.url);

    for (final entry in request.headers.entries) {
      req.headers.add(entry.key, entry.value);
    }

    final body = request.finalize();

    if (_allowedBodyMethods.contains(request.method)) {
      final bytes = await body.toBytes();
      req.contentLength = bytes.length;
      req.add(bytes);
    }
    final res = await req.close();
    final resHeaders = <String, String>{};

    res.headers.forEach((key, values) {
      resHeaders[key] = values.join(',');
    });

    return http.StreamedResponse(
      res,
      res.statusCode,
      request: request,
      contentLength: res.contentLength == -1 ? null : res.contentLength,
      headers: resHeaders,
      isRedirect: res.isRedirect,
      persistentConnection: res.persistentConnection,
      reasonPhrase: res.reasonPhrase,
    );
  }

  Future<http.Response> _makeRequest({
    required String method,
    required Uri url,
    Object? body,
    Map<String, String>? headers,
    Encoding encoding = utf8,
  }) async {
    http.BaseRequest req;

    if (body == null) {
      req = http.Request(method, url)..headers.addAll(headers ?? {});
    } else if (body is String) {
      req = http.StreamedRequest(method, url);
      req.headers.addAll(headers ?? {});

      encoding.encoder
          .startChunkedConversion((req as http.StreamedRequest).sink)
        ..add(body)
        ..close();
    } else if (body is List<int>) {
      final r = http.StreamedRequest(method, url);
      r.headers.addAll(headers ?? {});

      r.sink.add(body);
      r.sink.close();

      req = r;
    } else if (body is Map<String, String>) {
      final r = http.Request(method, url);
      r.headers.addAll(headers ?? {});
      r.bodyFields = body;
      req = r;
    } else {
      throw ArgumentError(
        body,
        'body must be a String, List<int>, or Map<String, String>',
      );
    }

    final res = await send(req);
    return http.Response.fromStream(res);
  }
}
