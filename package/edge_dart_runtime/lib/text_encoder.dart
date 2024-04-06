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
import 'dart:typed_data' show Uint8List;

import 'package:typings/core.dart' as interop;

class TextEncoder {
  final interop.TextEncoder _delegate;

  TextEncoder._(this._delegate);

  String get encoding => _delegate.encoding;

  Uint8List encode([String? input]) => _delegate.encode(input);

  TextEncoderEncodeIntoResult encodeInto(String input, Uint8List destination) =>
      TextEncoderEncodeIntoResult._(
        _delegate.encodeInto(input, destination),
      );
}

extension TextEncoderExtension on TextEncoder {
  interop.TextEncoder get delegate => _delegate;
}

TextEncoder textEncoderFromJsObject(interop.TextEncoder jsObject) =>
    TextEncoder._(jsObject);

class TextEncoderEncodeIntoResult {
  final interop.TextEncoderEncodeIntoResult _delegate;

  TextEncoderEncodeIntoResult._(this._delegate);

  int get read => _delegate.read as int? ?? 0;

  set read(int newValue) {
    _delegate.read = newValue;
  }

  int get written => _delegate.written as int? ?? 0;

  set written(int newValue) {
    _delegate.written = newValue;
  }
}

extension TextEncoderEncodeIntoResultExtension on TextEncoderEncodeIntoResult {
  interop.TextEncoderEncodeIntoResult get delegate => _delegate;
}

TextEncoder textEncoderEncodeIntoResultFromJsObject(
        interop.TextEncoder jsObject) =>
    TextEncoder._(jsObject);
