import 'dart:js_util' as js_util;
import 'package:js/js.dart';
import 'package:edge_dart_runtime/interop/promise_interop.dart';

@JS()
@staticInterop
class ExecutionContext {
  external factory ExecutionContext();
}

extension PropsExecutionContext on ExecutionContext {
  void waitUntil(Future f) =>
      js_util.callMethod(this, 'waitUntil', [futureToPromise(f)]);

  void passThroughOnException() =>
      js_util.callMethod(this, 'passThroughOnException', []);
}
