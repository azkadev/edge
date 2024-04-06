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
import '../interop/context_interop.dart' as interop;

class NetlifyContext {
  final interop.NetlifyContext _delegate;
  String get ip => _delegate.ip;
  String get requestId => _delegate.requestId;
  NetlifyContext._(this._delegate);
  Account get account => Account._(_delegate.account);
  Geo get geo => Geo._(_delegate.geo);
  Site get site => Site._(_delegate.site);
}

NetlifyContext netlifyContextFromJsObject(interop.NetlifyContext delegate) =>
    NetlifyContext._(delegate);

class Geo {
  final interop.Geo _delegate;
  Geo._(this._delegate);
  String? get city => _delegate.city;
  String? get timezone => _delegate.timezone;
  num? get latitude => _delegate.latitude;
  num? get longitude => _delegate.longitude;
  Country? get country =>
      _delegate.country == null ? null : Country._(_delegate.country!);
  Subdivision? get subdivision => _delegate.subdivision == null
      ? null
      : Subdivision._(_delegate.subdivision!);
}

class Site {
  final interop.Site _delegate;
  Site._(this._delegate);
  String? get id => _delegate.id;
  String? get name => _delegate.name;
  String? get url => _delegate.url;
}

class Country {
  final interop.Country _delegate;
  Country._(this._delegate);
  String? get code => _delegate.code;
  String? get name => _delegate.name;
}

class Subdivision {
  final interop.Subdivision _delegate;
  Subdivision._(this._delegate);
  String? get code => _delegate.code;
  String? get name => _delegate.name;
}

class Account {
  final interop.Account _delegate;
  Account._(this._delegate);

  String get id => _delegate.id;
}
