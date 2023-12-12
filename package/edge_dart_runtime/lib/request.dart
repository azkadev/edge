import 'dart:js_util';
import 'dart:typed_data';

import 'abort/abort.dart';
import 'blob.dart';
import 'body.dart';
import 'package:typings/core.dart' as interop;
import 'interop/readable_stream.dart';
import 'interop/utils_interop.dart' as interop;
import 'interop/headers.dart' as headers_interop;

import 'form_data.dart';
import 'headers.dart';
import 'resource.dart';

class Request implements Body {
  final interop.Request _delegate;

  Request._(this._delegate);

  Request(
    Resource resource, {
    String? method,
    Headers? headers,
    Object? body,
    String? referrer,
    interop.ReferrerPolicy? referrerPolicy,
    interop.RequestMode? mode,
    interop.RequestCredentials? credentials,
    interop.RequestCache? cache,
    interop.RequestRedirect? redirect,
    String? integrity,
    bool? keepalive,
    AbortSignal? signal,
  }) : _delegate = interop.Request(
          interop.requestFromResource(resource),
          interop.RequestInit(
            method: method,
            headers: headers?.delegate,
            // TODO(lesnitsky): support streams
            body: body,
            referrer: referrer,
            referrerPolicy: referrerPolicy,
            mode: mode,
            credentials: credentials,
            cache: cache,
            redirect: redirect,
            integrity: integrity,
            keepalive: keepalive,
            signal: signal?.delegate,
          ),
        );

  String get method => _delegate.method;
  Uri get url => Uri.parse(_delegate.url);
  Headers get headers {
    return headersFromJsObject(
      getProperty<headers_interop.Headers>(_delegate, 'headers'),
    );
  }

  interop.RequestDestination get destination => _delegate.destination;
  String get referrer => _delegate.referrer;
  interop.ReferrerPolicy get referrerPolicy => _delegate.referrerPolicy;
  interop.RequestMode get mode => _delegate.mode;
  interop.RequestCredentials get credentials => _delegate.credentials;
  interop.RequestCache get cache => _delegate.cache;
  interop.RequestRedirect get redirect => _delegate.redirect;
  String get integrity => _delegate.integrity;
  bool get keepalive => _delegate.keepalive;
  AbortSignal get signal => abortSignalToJsObject(_delegate.signal);
  Request clone() => Request._(_delegate.clone());

  @override
  Future<ByteBuffer> arrayBuffer() => _delegate.arrayBuffer();

  @override
  Future<Object> blob() async => blobFromJsObject(await _delegate.blob());

  ReadableStreamDefaultReader? _reader;

  Stream<List<int>>? get body {
    final body = getProperty<ReadableStream?>(_delegate, 'body');
    if (body == null) return null;

    if (_reader == null) {
      _reader = body.getReader();
    }

    return streamFromJSReader(_reader!);
  }

  @override
  bool get bodyUsed => _delegate.bodyUsed;

  @override
  Future<FormData> formData() async =>
      formDataFromJsObject(await _delegate.formData());

  @override
  Future<Object?> json() async =>
      // ignore: unnecessary_cast, Dart issue
      interop.dartify(await (_delegate as interop.Body).json());

  @override
  Future<String> text() => _delegate.text();
}

extension RequestExtension on Request {
  interop.Request get delegate => _delegate;
}

Request requestFromJsObject(interop.Request request) => Request._(request);
