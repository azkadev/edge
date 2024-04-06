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
