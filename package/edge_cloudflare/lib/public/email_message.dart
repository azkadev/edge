import 'dart:js_util';

import 'package:edge_dart_runtime/headers.dart';
import 'package:edge_dart_runtime/interop/readable_stream.dart';
import '../interop/email_message_interop.dart' as interop;
import 'package:edge_dart_runtime/interop/headers.dart' as headers_interop;

class EmailMessage {
  final interop.EmailMessage _delegate;

  EmailMessage._(this._delegate);

  String get from => _delegate.from;
  String get to => _delegate.to;
  Headers get headers => headersFromJsObject(
        getProperty<headers_interop.Headers>(_delegate, 'headers'),
      );
  Stream<List<int>> get raw {
    final readable = getProperty<ReadableStream>(_delegate, 'raw');
    return streamFromJSReadable(readable);
  }

  int get rawSize => _delegate.rawSize;

  void setReject(String reason) => _delegate.setReject(reason);

  Future<void> forward(String to, Headers? headers) =>
      _delegate.forward(to, headers?.toJsBindingsHeaders());
}

EmailMessage emailMessageFromJsObject(interop.EmailMessage obj) =>
    EmailMessage._(obj);
