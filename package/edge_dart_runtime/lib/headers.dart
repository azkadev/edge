import 'dart:js_util' show jsify;
import 'package:typings/core.dart' as js_interop;

import 'interop/headers.dart' as interop;

class Headers {
  final interop.Headers _delegate;

  Headers([Map<String, String>? headers])
      : _delegate = interop.Headers(jsify(headers ?? {}));

  Headers._(this._delegate);

  bool has(String name) => _delegate.has(name);
  void append(String name, String value) => _delegate.append(name, value);
  void delete(String name) => _delegate.delete(name);
  String? get(String name) => _delegate.get(name);

  operator []=(String name, String value) {
    _delegate.set(name, value);
  }

  String? operator [](String name) {
    return _delegate.get(name);
  }

  Iterable<String> get keys => _delegate.keys;
  Iterable<String> get values => _delegate.values;

  Map<String, String> toMap() => _delegate.toMap();
  js_interop.Headers toJsBindingsHeaders() => _delegate as js_interop.Headers;
}

extension HeadersExtension on Headers {
  // Returns the underlying JS object.
  interop.Headers get delegate => _delegate;
}

// Creates a [Headers] instance from a JS object.
Headers headersFromJsObject(interop.Headers delegate) {
  return Headers._(delegate);
}
