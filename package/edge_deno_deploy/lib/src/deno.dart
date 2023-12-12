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
