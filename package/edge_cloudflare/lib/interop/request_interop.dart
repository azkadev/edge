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

extension CloudflareWorkersRequestInteropExtension on interop.Request {
  IncomingRequestCfProperties get cf => js_util.getProperty(this, 'cf');
}

@JS()
@anonymous
class IncomingRequestCfProperties {
  /// (e.g. 395747)
  external int get asn;

  /// The organization which owns the ASN of the incoming request.
  /// (e.g. Google Cloud)
  external String get asOrganization;
  external IncomingRequestCfPropertiesBotManagement? get botManagement;
  external String? get city;
  external String? get clientAcceptEncoding;
  external num get clientTcpRtt;
  external num get clientTrustScore;

  /// The three-letter airport code of the data center that the request
  /// hit. (e.g. "DFW")
  external String get colo;
  external String? get continent;

  /// The two-letter country code in the request. This is the same value
  /// as that provided in the CF-IPCountry header. (e.g. "US")
  external String get country;
  external String get httpProtocol;
  external String? get latitude;
  external String? get longitude;

  /// DMA metro code from which the request was issued, e.g. "635"
  external String? get metroCode;
  external String? get postalCode;

  /// e.g. "Texas"
  external String? get region;

  /// e.g. "TX"
  external String? get regionCode;

  /// e.g. "weight=256;exclusive=1"
  external String get requestPriority;

  /// e.g. "America/Chicago"
  external String? get timezone;
  external String get tlsVersion;
  external String get tlsCipher;
  external IncomingRequestCfPropertiesTLSClientAuth get tlsClientAuth;
}

@JS()
@anonymous
class IncomingRequestCfPropertiesBotManagement {
  external int get score;
  external bool get staticResource;
  external bool get verifiedBot;
}

@JS()
@anonymous
class IncomingRequestCfPropertiesTLSClientAuth {
  external String get certIssuerDNLegacy;
  external String get certIssuerDN;
  external String get certPresented;
  external String get certSubjectDNLegacy;
  external String get certSubjectDN;

  /// In format "Dec 22 19:39:00 2018 GMT"
  external String get certNotBefore;

  /// In format "Dec 22 19:39:00 2018 GMT"
  external String get certNotAfter;
  external String get certSerial;
  external String get certFingerprintSHA1;

  /// "SUCCESS", "FAILED:reason", "NONE"
  external String get certVerified;
}
