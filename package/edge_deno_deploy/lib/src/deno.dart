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

import 'package:edge_dart_runtime/abort/abort.dart';

import 'interop/deno_interop.dart' as interop;

import 'env.dart';
import 'fs.dart';

class Deno {
  /// An interface containing methods to interact with the process
  /// environment variables.
  static Env get env => envFromJsObject(interop.Deno.env);

  static Future<TcpConn> connect({
    required int port,
    String hostname = '127.0.0.1',
    String transport = 'tcp',
  }) async =>
      TcpConn();

  static connectTls({
    required int port,
    String hostname = '127.0.0.1',
    Iterable<String>? caCerts,
    String? certChain,
    String? privateKey,
    Iterable<String>? alpnProtocols,
  }) =>
      {};

  static startTls({
    String hostname = '127.0.0.1',
    Iterable<String>? caCerts,
    Iterable<String>? alpnProtocols,
  }) =>
      {};

  // Multiple types
  static resolveDns() => {};

  /// Return a Uri representing the current working directory.
  ///
  /// If the current directory can be reached via multiple paths
  /// (due to symbolic links), cwd() may return any one of them.
  static Uri cwd() => Uri.parse(interop.Deno.cwd());

  /// Reads the directory given by path and returns a [Stream] of [DirEntry].
  static Stream<DirEntry> readDir(Uri uri) {
    return interop.Deno.readDir(uri.toString()).map(dirEntryFromJsObject);
  }

  static Future<ByteBuffer> readFile(
    Uri uri, {
    AbortSignal? signal,
  }) =>
      interop.Deno.readFile(
        uri.toString(),
        interop.ReadFileOptions(signal: signal?.delegate),
      );

  static Future<String> readTextFile(
    Uri uri, {
    AbortSignal? signal,
  }) =>
      interop.Deno.readTextFile(
        uri.toString(),
        interop.ReadFileOptions(signal: signal?.delegate),
      );

  static open(
    Uri uri, {
    bool read = true,
    bool write = false,
    bool append = false,
    bool truncate = false,
    bool create = false,
    bool createNew = false,
    num? mode,
  }) =>
      throw UnimplementedError();

  static stat(Uri uri) => throw UnimplementedError();
  static lstat(Uri uri) => throw UnimplementedError();
  static Future<String> realPath(Uri uri) =>
      interop.Deno.realPath(uri.toString());
  static Future<String> readLink(Uri uri) async => 'todo';
}

class TcpConn {}
