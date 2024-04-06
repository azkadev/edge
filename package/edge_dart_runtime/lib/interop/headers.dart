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
import 'package:edge_dart_runtime/interop/utils_interop.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart' as js_utils;
import 'iterator_interop.dart' as i;

@JS()
@staticInterop
class Headers {
  external factory Headers([dynamic init]);
}

extension HeadersProps on Headers {
  void append(String name, String value) {
    js_utils.callMethod(this, 'append', [name, value]);
  }

  void delete(String name) {
    js_utils.callMethod(this, 'delete', [name]);
  }

  String? get(String name) {
    return js_utils.callMethod(this, 'get', [name]);
  }

  bool has(String name) {
    return js_utils.callMethod(this, 'has', [name]);
  }

  void set(String name, String value) {
    js_utils.callMethod(this, 'set', [name, value]);
  }

  Iterable<List<String>> get entries {
    final iterator = js_utils.callMethod(this, 'entries', []);
    return i.fromJSIterator(iterator).map((e) => e.cast<String>());
  }

  Iterable<String> get keys {
    final iterator = js_utils.callMethod<i.Iterator>(this, 'keys', []);
    return i.fromJSIterator(iterator).map<String>(dartify);
  }

  Iterable<String> get values {
    final iterator = js_utils.callMethod<i.Iterator>(this, 'values', []);
    return i.fromJSIterator(iterator).map<String>(dartify);
  }

  Map<String, String> toMap() {
    final map = <String, String>{};
    for (final entry in entries) {
      map[entry[0]] = entry[1];
    }
    return map;
  }
}
