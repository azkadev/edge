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

import 'package:typings/core.dart' as interop;
import '../interop/utils_interop.dart';

class AbortController {
  final interop.AbortController _delegate;
  AbortController() : _delegate = interop.AbortController();

  AbortSignal get signal => AbortSignal._(_delegate.signal);
  void abort([Object? reason]) =>
      _delegate.abort(reason != null ? jsify(reason) : jsUndefined);
}

class AbortSignal {
  final interop.AbortSignal _delegate;

  AbortSignal() : _delegate = interop.AbortSignal();

  AbortSignal._(this._delegate);

  static AbortSignal abort([Object? reason]) {
    if (reason == null) return AbortSignal._(interop.AbortSignal.abort());
    return AbortSignal._(interop.AbortSignal.abort(jsify(reason)));
  }

  static AbortSignal timeout(int delay) {
    return AbortSignal._(interop.AbortSignal.timeout(delay));
  }

  bool get aborted => _delegate.aborted;
  Object get reason => _delegate.reason;
  void throwIfAborted() => _delegate.throwIfAborted();
}

extension AbortSignalExtension on AbortSignal {
  interop.AbortSignal get delegate => _delegate;
}

AbortSignal abortSignalToJsObject(interop.AbortSignal abortSignal) {
  return AbortSignal._(abortSignal);
}
