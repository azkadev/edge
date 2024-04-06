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

/// Information about a directory entry.
///
/// See https://deno.land/api@v1.30.3?s=Deno.DirEntry
class DirEntry {
  final interop.DirEntry _delegate;

  DirEntry._(this._delegate);

  /// The file name of the entry. It is just the entity name and does not
  /// include the full path.
  String get name => _delegate.name;

  /// True if this is info for a regular file. Mutually exclusive to
  /// DirEntry.isDirectory and DirEntry.isSymlink.
  bool get isFile => _delegate.isFile;

  /// True if this is info for a regular directory. Mutually exclusive to
  /// DirEntry.isFile and DirEntry.isSymlink.
  bool get isDirectory => _delegate.isDirectory;

  /// True if this is info for a symlink. Mutually exclusive to DirEntry.isFile
  /// and DirEntry.isDirectory.
  bool get isSymlink => _delegate.isSymlink;
}

DirEntry dirEntryFromJsObject(interop.DirEntry jsObject) =>
    DirEntry._(jsObject);
