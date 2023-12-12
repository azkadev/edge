import 'dart:js_util' as js_util;

import 'package:edge_dart_runtime/edge_dart_runtime.dart';
import 'package:edge_dart_runtime/interop/promise_interop.dart';
import 'package:edge_dart_runtime/response.dart';
import 'package:js/js.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:typings/core.dart' as interop;

@JS('__dartVercelFetchHandler')
external set __dartVercelFetchHandler(
    Promise<interop.Response> Function(interop.Request req) f);

class VercelEdgeShelf {
  final FutureOr<shelf.Response> Function(shelf.Request request)? fetch;

  VercelEdgeShelf({
    this.fetch,
  }) {
    // Setup the runtime environment.
    setupRuntime();

    if (fetch != null) {
      __dartVercelFetchHandler = allowInterop((interop.Request request) {
        return futureToPromise(Future(() async {
          final clone = request.clone();

          final Map<String, String> headers = {};

          js_util.callMethod(request.headers, 'forEach', [
            allowInterop((value, key, _) {
              headers[key] = value;
            })
          ]);

          final shelfRequest = shelf.Request(
            clone.method,
            Uri.parse(clone.url),
            body: clone.body,
            headers: headers,
          );

          final response = await fetch!(shelfRequest);

          return Response(
            await response.readAsString(),
            status: response.statusCode,
            headers: Headers(response.headers),
          ).delegate;
        }));
      });
    }
  }
}
