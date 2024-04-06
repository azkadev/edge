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
import 'package:edge_dart_runtime/request.dart';

import '../interop/request_interop.dart' as interop;

extension CloudflareWorkersRequestExtension on Request {
  IncomingRequestCfProperties get cf =>
      IncomingRequestCfProperties._(delegate.cf);
}

class IncomingRequestCfProperties {
  final interop.IncomingRequestCfProperties _delegate;

  IncomingRequestCfProperties._(this._delegate);

  /// (e.g. 395747)
  int get asn => _delegate.asn;

  /// The organization which owns the ASN of the incoming request.
  /// (e.g. Google Cloud)
  String get asOrganization => _delegate.asOrganization;
  IncomingRequestCfPropertiesBotManagement? get botManagement {
    final obj = _delegate.botManagement;
    if (obj == null) return null;
    return IncomingRequestCfPropertiesBotManagement._(obj);
  }

  String? get city => _delegate.city;
  String? get clientAcceptEncoding => _delegate.clientAcceptEncoding;
  num get clientTcpRtt => _delegate.clientTcpRtt;
  num get clientTrustScore => _delegate.clientTrustScore;

  /// The three-letter airport code of the data center that the request
  /// hit. (e.g. "DFW")
  String get colo => _delegate.colo;
  String? get continent => _delegate.continent;

  /// The two-letter country code in the request. This is the same value
  /// as that provided in the CF-IPCountry header. (e.g. "US")
  String get country => _delegate.country;
  String get httpProtocol => _delegate.httpProtocol;
  String? get latitude => _delegate.latitude;
  String? get longitude => _delegate.longitude;

  /// DMA metro code from which the request was issued, e.g. "635"
  String? get metroCode => _delegate.metroCode;
  String? get postalCode => _delegate.postalCode;

  /// e.g. "Texas"
  String? get region => _delegate.region;

  /// e.g. "TX"
  String? get regionCode => _delegate.regionCode;

  /// e.g. "weight=256;exclusive=1"
  String get requestPriority => _delegate.requestPriority;

  /// e.g. "America/Chicago"
  String? get timezone => _delegate.timezone;
  String get tlsVersion => _delegate.tlsVersion;
  String get tlsCipher => _delegate.tlsCipher;
  IncomingRequestCfPropertiesTLSClientAuth get tlsClientAuth =>
      IncomingRequestCfPropertiesTLSClientAuth._(_delegate.tlsClientAuth);
}

class IncomingRequestCfPropertiesBotManagement {
  final interop.IncomingRequestCfPropertiesBotManagement _delegate;
  IncomingRequestCfPropertiesBotManagement._(this._delegate);
  int get score => _delegate.score;
  bool get staticResource => _delegate.staticResource;
  bool get verifiedBot => _delegate.verifiedBot;
}

class IncomingRequestCfPropertiesTLSClientAuth {
  final interop.IncomingRequestCfPropertiesTLSClientAuth _delegate;
  IncomingRequestCfPropertiesTLSClientAuth._(this._delegate);

  String get certIssuerDNLegacy => _delegate.certIssuerDNLegacy;
  String get certIssuerDN => _delegate.certIssuerDN;
  String get certPresented => _delegate.certPresented;
  String get certSubjectDNLegacy => _delegate.certSubjectDNLegacy;
  String get certSubjectDN => _delegate.certSubjectDN;

  /// In format "Dec 22 19:39:00 2018 GMT"
  String get certNotBefore => _delegate.certNotBefore;

  /// In format "Dec 22 19:39:00 2018 GMT"
  String get certNotAfter => _delegate.certNotAfter;
  String get certSerial => _delegate.certSerial;
  String get certFingerprintSHA1 => _delegate.certFingerprintSHA1;

  /// "SUCCESS", "FAILED:reason", "NONE"
  String get certVerified => _delegate.certVerified;
}
