import 'dart:js_util' show jsify;

import 'package:typings/core.dart' as interop;
import '../interop/utils_interop.dart';

class AbortController {
  final interop.AbortController _delegate;
  AbortController() : _delegate = interop.AbortController();

  AbortSignal get signal => AbortSignal._(_delegate.signal);
  void abort([Object? reason]) =>
      _delegate.abort(reason != null ? jsify(reason) : jsUndefined);
}

class AbortSignal {
  final interop.AbortSignal _delegate;

  AbortSignal() : _delegate = interop.AbortSignal();

  AbortSignal._(this._delegate);

  static AbortSignal abort([Object? reason]) {
    if (reason == null) return AbortSignal._(interop.AbortSignal.abort());
    return AbortSignal._(interop.AbortSignal.abort(jsify(reason)));
  }

  static AbortSignal timeout(int delay) {
    return AbortSignal._(interop.AbortSignal.timeout(delay));
  }

  bool get aborted => _delegate.aborted;
  Object get reason => _delegate.reason;
  void throwIfAborted() => _delegate.throwIfAborted();
}

extension AbortSignalExtension on AbortSignal {
  interop.AbortSignal get delegate => _delegate;
}

AbortSignal abortSignalToJsObject(interop.AbortSignal abortSignal) {
  return AbortSignal._(abortSignal);
}
