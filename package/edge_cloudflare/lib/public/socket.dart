import 'dart:async';

import 'package:typings/core.dart' as interop;
import '../interop/durable_object_interop.dart' as interop;

class Socket {
  final interop.Socket _delegate;

  Socket._(this._delegate);

  Future<interop.ReadableStream> get readable => _delegate.readable;
  Future<interop.ReadableStream> get writable => _delegate.writable;
  Future<bool> get closed => _delegate.closed;
  Future<void> close() => _delegate.close();
}

Socket socketFromJsObject(interop.Socket obj) => Socket._(obj);

class SocketOptions {
  final interop.SocketOptions _delegate;

  SocketOptions._(this._delegate);

  bool get tls => _delegate.tsl;
  set tls(bool value) => _delegate.tsl = value;
}

extension SocketOptionsExtension on SocketOptions {
  interop.SocketOptions get delegate => _delegate;
}
