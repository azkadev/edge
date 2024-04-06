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

import 'package:edge_dart_runtime/headers.dart';
import 'package:edge_dart_runtime/interop/readable_stream.dart';
import '../interop/email_message_interop.dart' as interop;
import 'package:edge_dart_runtime/interop/headers.dart' as headers_interop;

class EmailMessage {
  final interop.EmailMessage _delegate;

  EmailMessage._(this._delegate);

  String get from => _delegate.from;
  String get to => _delegate.to;
  Headers get headers => headersFromJsObject(
        getProperty<headers_interop.Headers>(_delegate, 'headers'),
      );
  Stream<List<int>> get raw {
    final readable = getProperty<ReadableStream>(_delegate, 'raw');
    return streamFromJSReadable(readable);
  }

  int get rawSize => _delegate.rawSize;

  void setReject(String reason) => _delegate.setReject(reason);

  Future<void> forward(String to, Headers? headers) =>
      _delegate.forward(to, headers?.toJsBindingsHeaders());
}

EmailMessage emailMessageFromJsObject(interop.EmailMessage obj) =>
    EmailMessage._(obj);
