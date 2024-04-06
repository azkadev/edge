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
