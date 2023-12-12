import 'dart:js' as js;
import 'dart:js_util';

import 'package:typings/core.dart' as interop hide AbortSignal;

import 'abort/abort.dart';
import 'headers.dart';
import 'interop/utils_interop.dart' as interop;
import 'resource.dart';
import 'response.dart';

Future<Response> fetch(Resource resource,
    {String? method,
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
    AbortSignal? signal}) async {
  var response = await interop.fetch(
    interop.requestFromResource(resource),
    interop.RequestInit(
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
        signal: signal?.delegate),
  );
  try {
    return responseFromJsObject(
      await promiseToFuture(response),
    );
  } catch (e) {
    return responseFromJsObject(response);
  }
}

int setInterval(void Function() callback, Duration duration) => interop
    .setInterval(js.allowInterop(callback), duration.inMilliseconds)
    .toInt();

void clearInterval(int handle) => interop.clearInterval(handle);

int setTimeout(void Function() callback, Duration duration) => interop
    .setTimeout(js.allowInterop(callback), duration.inMilliseconds)
    .toInt();

void clearTimeout(int handle) => interop.clearTimeout(handle);
