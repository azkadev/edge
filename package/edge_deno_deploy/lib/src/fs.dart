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
