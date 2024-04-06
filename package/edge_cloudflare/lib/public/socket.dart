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
