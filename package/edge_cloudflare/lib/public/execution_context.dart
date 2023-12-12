import '../interop/execution_context_interop.dart' as interop;

class ExecutionContext {
  final interop.ExecutionContext _delegate;

  ExecutionContext._(this._delegate);

  void waitUntil(Future future) => _delegate.waitUntil(future);

  void passThroughOnException() => _delegate.passThroughOnException();
}

ExecutionContext executionContextFromJsObject(interop.ExecutionContext obj) =>
    ExecutionContext._(obj);
