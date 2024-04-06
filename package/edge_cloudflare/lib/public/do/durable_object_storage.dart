/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
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
