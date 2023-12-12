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
