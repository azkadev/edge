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

@anonymous
@JS()
@staticInterop
class NetlifyContext {
  external factory NetlifyContext();
}

extension PropsNetlifyContext on NetlifyContext {
  String get ip => js_util.getProperty(this, 'ip');
  String get requestId => js_util.getProperty(this, 'requestId');
  Account get account => js_util.getProperty(this, 'account');
  Geo get geo => js_util.getProperty(this, 'geo');
  Site get site => js_util.getProperty(this, 'site');
}

@anonymous
@JS()
@staticInterop
class Account {
  external factory Account();
}

extension PropsAccount on Account {
  String get id => js_util.getProperty(this, 'id');
}

@anonymous
@JS()
@staticInterop
class Site {
  external factory Site();
}

extension PropsSite on Site {
  String? get id => js_util.getProperty(this, 'id');
  String? get name => js_util.getProperty(this, 'name');
  String? get url => js_util.getProperty(this, 'url');
}

@anonymous
@JS()
@staticInterop
class Geo {
  external factory Geo();
}

extension PropsGeo on Geo {
  String? get city => js_util.getProperty(this, 'city');
  String? get timezone => js_util.getProperty(this, 'timezone');
  num? get latitude => js_util.getProperty(this, 'latitude');
  num? get longitude => js_util.getProperty(this, 'longitude');
  Country? get country => js_util.getProperty(this, 'country');
  Subdivision? get subdivision => js_util.getProperty(this, 'subdivision');
}

@anonymous
@JS()
@staticInterop
class Country {
  external factory Country();
}

extension PropsCountry on Country {
  String? get code => js_util.getProperty(this, 'code');
  String? get name => js_util.getProperty(this, 'name');
}

@anonymous
@JS()
@staticInterop
class Subdivision {
  external factory Subdivision();
}

extension PropsSubdivision on Subdivision {
  String? get code => js_util.getProperty(this, 'code');
  String? get name => js_util.getProperty(this, 'name');
}
