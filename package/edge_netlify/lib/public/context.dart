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
