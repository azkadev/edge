import 'dart:js_util' as js_util;

import 'package:edge_dart_runtime/edge_dart_runtime.dart' hide fetch;
import 'package:edge_dart_runtime/headers.dart';
import 'package:edge_dart_runtime/response.dart';
import 'package:edge_dart_runtime/abort/abort.dart';

import 'package:typings/core.dart' as interop;
import 'package:edge_dart_runtime/interop/utils_interop.dart' as interop;
import '../interop/request_init_interop.dart' as interop;

import 'request_init.dart';

Future<Response> fetch(
  Resource resource, {
  CloudflareRequestInit? cf,
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
}) async {
  final init = interop.RequestInit(
    method: method,
    headers: headers?.delegate,
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
  );

  // Attach the non-standard Cloudflare properties to the Request Init object.
  if (cf != null) {
    init.cf = cf.delegate;
  }

  return responseFromJsObject(
    await js_util.promiseToFuture(
      interop.fetch(
        interop.requestFromResource(resource),
        init,
      ),
    ),
  );
}
