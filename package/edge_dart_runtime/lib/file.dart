import 'dart:js_util';
import 'dart:typed_data';

import 'package:typings/core.dart' as interop;

import './interop/readable_stream.dart';
import 'blob.dart';

class File implements Blob {
  final interop.File _delegate;

  File._(this._delegate);

  String get name => _delegate.name;
  int get lastModified => _delegate.lastModified.toInt();
  String? get webkitRelativePath {
    try {
      return _delegate.webkitRelativePath;
    } catch (e) {
      // Throws a JS error if the `webkitdirectory` attribute was not set on
      // the input element, but this is accessed.
      // See: https://developer.mozilla.org/en-US/docs/Web/API/File/webkitRelativePath
      return null;
    }
  }

  @override
  Future<ByteBuffer> arrayBuffer() => _delegate.arrayBuffer();

  @override
  int get size => _delegate.size.toInt();

  @override
  Blob slice([int? start, int? end, String? contentType]) {
    return blobFromJsObject(_delegate.slice(start, end, contentType));
  }

  @override
  Stream<List<int>> stream() {
    return streamFromJSReadable(callMethod(_delegate, 'stream', []));
  }

  @override
  Future<String> text() => _delegate.text();

  @override
  String get type => _delegate.type;
}

extension FileExtension on File {
  interop.File get delegate => _delegate;
}

File fileFromJsObject(interop.File delegate) {
  return File._(delegate);
}
