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
import 'interop/deno_interop.dart' as interop;

class Env {
  final interop.Env _delegate;

  Env._(this._delegate);

  /// Retrieve the value of an environment variable.
  ///
  /// Returns `null` if the supplied environment variable is not defined.
  String? get(String key) => _delegate.get(key);

  /// Set the value of an environment variable.
  void set(String key, String value) => _delegate.set(key, value);

  /// Delete the value of an environment variable.
  void delete(String key) => _delegate.delete(key);

  /// Check whether an environment variable is present or not.
  bool has(String key) => _delegate.has(key);

  /// Returns a snapshot of the environment variables at invocation as a simple Map of keys and values.
  Map<String, String> toJson() => _delegate.toObject();
}

Env envFromJsObject(interop.Env env) {
  return Env._(env);
}
