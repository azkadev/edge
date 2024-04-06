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
