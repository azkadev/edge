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

import '../request.dart';
import '../resource.dart';

interop.Request requestFromResource(Resource resource) {
  switch (resource.runtimeType) {
    case StringValue:
      return interop.Request((resource as StringValue).url);
    case UriValue:
      return interop.Request((resource as UriValue).uri.toString());
    case RequestValue:
      return (resource as RequestValue).request.delegate;
    default:
      throw Exception('Unknown resource type ${resource.runtimeType}');
  }
}

@JS('Object.keys')
external List<Object?> objectKeys(Object? object);

@JS('undefined')
external Object get jsUndefined;

@anonymous
@JS()
class JavaScriptObject {
  external factory JavaScriptObject();
}

extension PropsJavaScriptObject on JavaScriptObject {
  T get<T>(String key) => js_util.getProperty(this, key);
  void set(String key, dynamic value) {
    js_util.setProperty(this, key, value);
  }
}

bool isBasicType(value) {
  if (value == null || value is num || value is bool || value is String) {
    return true;
  }
  return false;
}

T dartify<T>(dynamic jsObject) {
  if (isBasicType(jsObject)) {
    return jsObject as T;
  }

  if (jsObject is List) {
    return jsObject.map(dartify).toList() as T;
  }

  var keys = objectKeys(jsObject);
  var result = <String, dynamic>{};
  for (var key in keys) {
    result[key as String] = dartify(js_util.getProperty(jsObject, key));
  }

  return result as T;
}
