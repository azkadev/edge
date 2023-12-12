import 'dart:js_util' as js_util;
import 'package:js/js.dart';

import 'package:typings/core.dart' as interop;

@anonymous
@JS()
@staticInterop
class EmailMessage {
  external factory EmailMessage();
}

extension PropsEmailMessage on EmailMessage {
  String get from => js_util.getProperty(this, 'from');
  String get to => js_util.getProperty(this, 'to');
  interop.Headers get headers => js_util.getProperty(this, 'headers');
  interop.ReadableStream get raw => js_util.getProperty(this, 'raw');
  int get rawSize => js_util.getProperty(this, 'rawSize');

  void setReject(String reason) =>
      js_util.callMethod(this, 'setReject', [reason]);
  Future<void> forward(String to, [interop.Headers? headers]) => js_util
      .promiseToFuture(js_util.callMethod(this, 'forward', [to, headers]));
}
