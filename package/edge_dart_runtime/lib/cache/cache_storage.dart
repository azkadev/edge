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
import 'dart:js_util';

import 'package:typings/core.dart' as interop hide caches;
import '../interop/cache_interop.dart' as interop;
import '../request.dart';
import '../response.dart';
import 'cache.dart';
import 'cache_query_options.dart';

final caches = CacheStorage._(interop.caches);

class CacheStorage {
  final interop.CacheStorage _delegate;

  CacheStorage._(this._delegate);

  Future<bool> delete(String cacheName) async {
    return _delegate.delete(cacheName);
  }

  Future<bool> has(String cacheName) async {
    return _delegate.has(cacheName);
  }

  Future<Iterable<String>> keys() async {
    return _delegate.keys();
  }

  Future<Response?> match(Request request,
      [MultiCacheQueryOptions? options]) async {
    final obj = await promiseToFuture<interop.Response?>(
        _delegate.match(request.delegate, options?.delegate));
    return obj == null ? null : responseFromJsObject(obj);
  }

  Future<Cache> open(String name) async {
    return cacheFromJsObject(await _delegate.open(name));
  }
}
