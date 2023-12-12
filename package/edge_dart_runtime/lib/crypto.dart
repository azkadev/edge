import 'dart:typed_data';

import 'package:typings/core.dart' as interop;

final crypto = Crypto._(interop.crypto.call());

class Crypto {
  final interop.Crypto _delegate;

  Crypto._(this._delegate);

  SubtleCrypto get subtle => SubtleCrypto._(_delegate.subtle);

  // TODO Is this the right way to do this?
  interop.ArrayBufferView getRandomValues(interop.ArrayBufferView typedArray) =>
      _delegate.getRandomValues(typedArray);

  String randomUUID() => _delegate.randomUUID();
}

class SubtleCrypto {
  final interop.SubtleCrypto _delegate;

  SubtleCrypto._(this._delegate);

  Future<ByteBuffer> encrypt(
    Algorithm algorithm,
    CryptoKey key,
    dynamic data,
  ) {
    return _delegate.encrypt(algorithm._delegate, key._delegate, data);
    // TODO - how to handle return type?
  }

  // TODO decrypt, sign, verify, digest, generateKey, deriveKey, deriveBits, importKey, exportKey, wrapKey, unwrapKey
}

abstract class Algorithm {
  final interop.Algorithm _delegate;
  Algorithm._(this._delegate);
  String get name => _delegate.name;
}

class RsaOaepParams extends Algorithm {
  final interop.RsaOaepParams _rsaDelegate;

  RsaOaepParams._(this._rsaDelegate)
      : super._(interop.Algorithm(name: 'RSA-OAEP'));

  factory RsaOaepParams({
    ByteBuffer? label,
  }) =>
      RsaOaepParams._(interop.RsaOaepParams(label: label, name: "RSA-OAEP"));

  ByteBuffer? get label => _rsaDelegate.label as interop.ArrayBufferLike;
  set label(ByteBuffer? value) => _rsaDelegate.label = value;
}

class CryptoKey {
  final interop.CryptoKey _delegate;

  CryptoKey._(this._delegate);

  interop.KeyType get type => _delegate.type;
  bool get extractable => _delegate.extractable;
  List<interop.KeyUsageOptions> get usages => _delegate.usages;
}
