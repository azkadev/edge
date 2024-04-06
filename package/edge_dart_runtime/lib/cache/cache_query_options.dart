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
import 'package:typings/core.dart' as interop;

class CacheQueryOptions {
  bool? ignoreSearch;
  bool? ignoreMethod;
  bool? ignoreVary;

  CacheQueryOptions({
    this.ignoreSearch,
    this.ignoreMethod,
    this.ignoreVary,
  });
}

extension CacheQueryOptionsExtension on CacheQueryOptions {
  interop.CacheQueryOptions get delegate {
    // Only set the properties that are not null.
    interop.CacheQueryOptions delegate = interop.CacheQueryOptions();
    if (ignoreSearch != null) delegate = delegate..ignoreSearch = ignoreSearch!;
    if (ignoreMethod != null) delegate = delegate..ignoreMethod = ignoreMethod!;
    if (ignoreVary != null) delegate = delegate..ignoreVary = ignoreVary!;
    return delegate;
  }
}

class MultiCacheQueryOptions extends CacheQueryOptions {
  String? cacheName;

  MultiCacheQueryOptions({
    this.cacheName,
    super.ignoreSearch,
    super.ignoreMethod,
    super.ignoreVary,
  });
}

extension MultiCacheQueryOptionsExtension on MultiCacheQueryOptions {
  interop.MultiCacheQueryOptions get delegate {
    // Only set the properties that are not null.
    interop.MultiCacheQueryOptions delegate = interop.MultiCacheQueryOptions();
    if (cacheName != null) delegate = delegate..cacheName = cacheName!;
    if (ignoreSearch != null) delegate = delegate..ignoreSearch = ignoreSearch!;
    if (ignoreMethod != null) delegate = delegate..ignoreMethod = ignoreMethod!;
    if (ignoreVary != null) delegate = delegate..ignoreVary = ignoreVary!;
    return delegate;
  }
}
