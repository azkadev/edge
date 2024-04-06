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
import 'dart:typed_data';

import 'package:typings/core.dart' as interop;

import './interop/readable_stream.dart';
import 'blob.dart';

class File implements Blob {
  final interop.File _delegate;

  File._(this._delegate);

  String get name => _delegate.name;
  int get lastModified => _delegate.lastModified.toInt();
  String? get webkitRelativePath {
    try {
      return _delegate.webkitRelativePath;
    } catch (e) {
      // Throws a JS error if the `webkitdirectory` attribute was not set on
      // the input element, but this is accessed.
      // See: https://developer.mozilla.org/en-US/docs/Web/API/File/webkitRelativePath
      return null;
    }
  }

  @override
  Future<ByteBuffer> arrayBuffer() => _delegate.arrayBuffer();

  @override
  int get size => _delegate.size.toInt();

  @override
  Blob slice([int? start, int? end, String? contentType]) {
    return blobFromJsObject(_delegate.slice(start, end, contentType));
  }

  @override
  Stream<List<int>> stream() {
    return streamFromJSReadable(callMethod(_delegate, 'stream', []));
  }

  @override
  Future<String> text() => _delegate.text();

  @override
  String get type => _delegate.type;
}

extension FileExtension on File {
  interop.File get delegate => _delegate;
}

File fileFromJsObject(interop.File delegate) {
  return File._(delegate);
}
