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
import 'dart:js_util' as js_util;
import 'package:js/js.dart';

import 'package:typings/core.dart' as interop;

@anonymous
@JS()
@staticInterop
class EmailMessage {
  external factory EmailMessage();
}

extension PropsEmailMessage on EmailMessage {
  String get from => js_util.getProperty(this, 'from');
  String get to => js_util.getProperty(this, 'to');
  interop.Headers get headers => js_util.getProperty(this, 'headers');
  interop.ReadableStream get raw => js_util.getProperty(this, 'raw');
  int get rawSize => js_util.getProperty(this, 'rawSize');

  void setReject(String reason) =>
      js_util.callMethod(this, 'setReject', [reason]);
  Future<void> forward(String to, [interop.Headers? headers]) => js_util
      .promiseToFuture(js_util.callMethod(this, 'forward', [to, headers]));
}
