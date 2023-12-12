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
