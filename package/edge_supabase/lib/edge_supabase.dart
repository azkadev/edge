import 'package:js/js.dart';
import 'package:edge_dart_runtime/edge_dart_runtime.dart';
import 'package:edge_dart_runtime/interop/promise_interop.dart';
import 'package:edge_dart_runtime/request.dart';
import 'package:edge_dart_runtime/response.dart';
import 'package:typings/core.dart' as interop;

export 'package:edge_dart_runtime/edge_dart_runtime.dart';
export 'package:edge_deno_deploy/edge_deno_deploy.dart';

@JS('__dartSupabaseFetchHandler')
external set __dartSupabaseFetchHandler(
    Promise<interop.Response> Function(interop.Request req) f);

class SupabaseFunctions {
  final FutureOr<Response> Function(Request request)? fetch;

  SupabaseFunctions({
    this.fetch,
  }) {
    // Setup the runtime environment.
    setupRuntime();

    if (fetch != null) {
      __dartSupabaseFetchHandler = allowInterop((interop.Request request) {
        return futureToPromise(Future(() async {
          final response = await fetch!(requestFromJsObject(request));
          return response.delegate;
        }));
      });
    }
  }
}
