import 'dart:async';
import 'dart:js';

import '../../interop/durable_object_interop.dart' as interop;

import 'durable_object_id.dart';
import 'durable_object_storage.dart';

class DurableObjectState {
  final interop.DurableObjectState _delegate;

  DurableObjectState._(this._delegate);

  DurableObjectId get id => durableObjectIdFromJsObject(_delegate.id);
  DurableObjectStorage get storage =>
      durableObjectStorageFromJsObject(_delegate.storage);

  void waitUntil(Future<void> future) => _delegate.waitUntil(future);

  Future<T> blockConcurrencyWhile<T>(Future<T> Function() callback) =>
      _delegate.blockConcurrencyWhile(allowInterop(callback));
}

DurableObjectState durableObjectStateFromJsObject(
        interop.DurableObjectState obj) =>
    DurableObjectState._(obj);
