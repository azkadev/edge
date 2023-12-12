import 'dart:async';
import 'dart:js_util';

import '../../interop/durable_object_interop.dart' as interop;

class DurableObjectStorage {
  final interop.DurableObjectStorage _delegate;

  DurableObjectStorage._(this._delegate);

  Future<T?> get<T>(
    String key, {
    bool? allowConcurrency,
    bool? noCache,
  }) async {
    final obj = await _delegate.get(
      key,
      interop.DurableObjectGetOptions()
        ..allowConcurrency = allowConcurrency
        ..noCache = noCache,
    );

    return obj == null ? null : dartify(obj) as T;
  }

  Future<Map<String, T>> getEntries<T>(
    Iterable<String> keys, {
    bool? allowConcurrency,
    bool? noCache,
  }) async {
    final obj = await _delegate.get(
      keys,
      interop.DurableObjectGetOptions()
        ..allowConcurrency = allowConcurrency
        ..noCache = noCache,
    );

    return dartify(obj) as Map<String, T>;
  }

  Future<void> put<T>(
    String key,
    T value, {
    bool? allowConcurrency,
    bool? allowUnconfirmed,
    bool? noCache,
  }) async {
    return _delegate.put(
      key,
      value,
      interop.DurableObjectPutOptions()
        ..allowConcurrency = allowConcurrency
        ..allowUnconfirmed = allowUnconfirmed
        ..noCache = noCache,
    );
  }

  Future<void> putEntries<T>(
    Map<Object, T> entries, {
    bool? allowConcurrency,
    bool? allowUnconfirmed,
    bool? noCache,
  }) async {
    return _delegate.putEntries<T>(
      entries,
      interop.DurableObjectPutOptions()
        ..allowConcurrency = allowConcurrency
        ..allowUnconfirmed = allowUnconfirmed
        ..noCache = noCache,
    );
  }

  Future<bool> delete(
    String key, {
    bool? allowConcurrency,
    bool? allowUnconfirmed,
    bool? noCache,
  }) async {
    return _delegate.delete(
      key,
      interop.DurableObjectPutOptions()
        ..allowConcurrency = allowConcurrency
        ..allowUnconfirmed = allowUnconfirmed
        ..noCache = noCache,
    );
  }

  Future<void> deleteAll({
    bool? allowConcurrency,
    bool? allowUnconfirmed,
    bool? noCache,
  }) async {
    return _delegate.deleteAll(
      interop.DurableObjectPutOptions()
        ..allowConcurrency = allowConcurrency
        ..allowUnconfirmed = allowUnconfirmed
        ..noCache = noCache,
    );
  }

  Future<bool> deleteEntries(
    Iterable<String> keys, {
    bool? allowConcurrency,
    bool? allowUnconfirmed,
    bool? noCache,
  }) async {
    return _delegate.deleteEntries(
      keys,
      interop.DurableObjectPutOptions()
        ..allowConcurrency = allowConcurrency
        ..allowUnconfirmed = allowUnconfirmed
        ..noCache = noCache,
    );
  }

  Future<Map<String, T>> list<T>({
    String? start,
    String? startAfter,
    String? end,
    String? prefix,
    bool? reverse,
    bool? limit,
    bool? allowConcurrency,
    bool? noCache,
  }) async {
    final obj = await _delegate.list(
      interop.DurableObjectListOptions()
        ..start = start
        ..startAfter = startAfter
        ..end = end
        ..prefix = prefix
        ..reverse = reverse
        ..limit = limit
        ..allowConcurrency = allowConcurrency
        ..noCache = noCache,
    );

    return dartify(obj) as Map<String, T>;
  }

  Future<void> transaction(
      Future<void> Function(DurableObjectTransaction tsx) callback) async {
    return _delegate.transaction((tsx) async {
      return callback(DurableObjectTransaction._(tsx));
    });
  }

  Future<int?> getAlarm({bool? allowConcurrency}) async {
    return _delegate.getAlarm(
      interop.DurableObjectGetAlarmOptions()
        ..allowConcurrency = allowConcurrency,
    );
  }

  Future<void> setAlarm(
    DateTime scheduledTime, {
    bool? allowConcurrency,
    bool? allowUnconfirmed,
  }) async {
    return _delegate.setAlarm(
      scheduledTime,
      interop.DurableObjectSetAlarmOptions()
        ..allowConcurrency = allowConcurrency
        ..allowUnconfirmed = allowUnconfirmed,
    );
  }

  Future<void> deleteAlarm({
    bool? allowConcurrency,
    bool? allowUnconfirmed,
  }) async {
    return _delegate.deleteAlarm(
      interop.DurableObjectSetAlarmOptions()
        ..allowConcurrency = allowConcurrency
        ..allowUnconfirmed = allowUnconfirmed,
    );
  }

  Future<void> sync() async {
    return _delegate.sync();
  }
}

extension DurableObjectStorageExtension on DurableObjectStorage {
  interop.DurableObjectStorage get delegate => _delegate;
}

DurableObjectStorage durableObjectStorageFromJsObject(
  interop.DurableObjectStorage obj,
) =>
    DurableObjectStorage._(obj);

class DurableObjectTransaction extends DurableObjectStorage {
  final interop.DurableObjectTransaction _tsxDelegate;
  DurableObjectTransaction._(this._tsxDelegate) : super._(_tsxDelegate);

  void rollback() {
    _tsxDelegate.rollback();
  }
}
