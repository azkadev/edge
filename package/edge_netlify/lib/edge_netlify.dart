import 'package:js/js.dart';
import 'package:edge_netlify/public/context.dart';
import 'package:edge_dart_runtime/interop/promise_interop.dart';
import 'package:edge_dart_runtime/edge_dart_runtime.dart';
import 'package:edge_dart_runtime/request.dart';
import 'package:edge_dart_runtime/response.dart';
import 'package:typings/core.dart' as interop;
import 'interop/context_interop.dart' as interop;

export 'package:edge_dart_runtime/edge_dart_runtime.dart';
export './public/context.dart' hide netlifyContextFromJsObject;

@JS('__dartNetlifyFetchHandler')
external set __dartNetlifyFetchHandler(
    Promise<interop.Response> Function(
            interop.Request req, interop.NetlifyContext)
        f);

class NetlifyEdge {
  final FutureOr<Response> Function(Request request, NetlifyContext context)?
      fetch;

  NetlifyEdge({
    this.fetch,
  }) {
    // Setup the runtime environment.
    setupRuntime();

    if (fetch != null) {
      __dartNetlifyFetchHandler =
          allowInterop((interop.Request req, interop.NetlifyContext context) {
        return futureToPromise(Future(() async {
          final response = await fetch!(
            requestFromJsObject(req),
            netlifyContextFromJsObject(context),
          );
          return response.delegate;
        }));
      });
    }
  }
}
