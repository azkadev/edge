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
import 'dart:typed_data';

import 'package:js/js.dart';
import 'dart:js_util' as js_util;

import 'package:typings/core.dart' as interop;
import 'package:edge_dart_runtime/interop/utils_interop.dart';
import 'package:edge_dart_runtime/interop/promise_interop.dart';
import 'package:edge_dart_runtime/interop/iterator_interop.dart';

@JS()
@staticInterop
@anonymous
class Env {
  external factory Env();
}

extension PropsEnv on Env {
  String? get(String key) => js_util.callMethod(this, 'get', [key]);

  void set(String key, String value) => js_util.callMethod(this, 'set', [key, value]);
  void delete(String key) => js_util.callMethod(this, 'delete', [key]);
  bool has(String key) => js_util.callMethod(this, 'has', [key]);
  Map<String, String> toObject() => Map<String, String>.from(dartify(js_util.callMethod(this, 'toObject', [])));
}

@JS()
@anonymous
@staticInterop
class DirEntry {
  external factory DirEntry();
}

extension PropsDirEntry on DirEntry {
  String get name => js_util.getProperty(this, 'name');
  bool get isFile => js_util.getProperty(this, 'isFile');
  bool get isDirectory => js_util.getProperty(this, 'isDirectory');
  bool get isSymlink => js_util.getProperty(this, 'isSymlink');
}

@JS('Deno.env')
@staticInterop
external Env get _env;

@JS('Deno.cwd')
@staticInterop
external String _cwd();

@JS('Deno.readDir')
@staticInterop
external AsyncIterator<DirEntry> _readDir(String path);

@JS('Deno.readFile')
@staticInterop
external Promise<ByteBuffer> _readFile(String path, ReadFileOptions options);

@JS('Deno.readTextFile')
@staticInterop
external Promise<String> _readTextFile(String path, ReadFileOptions options);

@JS('Deno.realPath')
@staticInterop
external Promise<String> _realPath(String path);

@JS('Deno.readLink')
@staticInterop
external Promise<String> _readLink(String path);

class Deno {
  static Env get env => _env;
  static String cwd() => _cwd();
  static Stream<DirEntry> readDir(String path) {
    return _readDir(path).toStream<DirEntry>();
  }

  static Future<ByteBuffer> readFile(String path, ReadFileOptions options) {
    return js_util.promiseToFuture(_readFile(path, options));
  }

  static Future<String> readTextFile(String path, ReadFileOptions options) {
    return js_util.promiseToFuture(_readTextFile(path, options));
  }

  static Future<String> realPath(String path) {
    return js_util.promiseToFuture(_realPath(path));
  }

  static Future<String> readLink(String path) {
    return js_util.promiseToFuture(_readLink(path));
  }
}

@JS()
@staticInterop
@anonymous
class ReadFileOptions {
  external factory ReadFileOptions({
    interop.AbortSignal? signal,
  });
}
