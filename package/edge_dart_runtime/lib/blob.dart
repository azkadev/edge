import 'dart:js_util';
import 'dart:typed_data';

import 'package:edge_dart_runtime/interop/readable_stream.dart';
import 'package:typings/core.dart' as interop;

class Blob {
  final interop.Blob _delegate;

  Blob._(this._delegate);

  Blob([Iterable<dynamic>? blobParts, BlobPropertyBag? options])
      : _delegate = interop.Blob(
          blobParts?.toList() as List<Object>?,
          options?.delegate ?? interop.BlobPropertyBag(),
        );

  int get size => _delegate.size.toInt();
  String get type => _delegate.type;

  Blob slice([int? start, int? end, String? contentType]) {
    return Blob._(_delegate.slice(start, end, contentType));
  }

  Stream<List<int>> stream() {
    return streamFromJSReadable(callMethod(_delegate, 'stream', []));
  }

  Future<String> text() => _delegate.text();

  Future<ByteBuffer> arrayBuffer() => _delegate.arrayBuffer();
}

extension BlobExtension on Blob {
  interop.Blob get delegate => _delegate;
}

Blob blobFromJsObject(interop.Blob delegate) {
  return Blob._(delegate);
}

class BlobPropertyBag {
  String? type;
  interop.EndingType? endings;

  BlobPropertyBag({this.type, this.endings});
}

extension on BlobPropertyBag {
  interop.BlobPropertyBag get delegate {
    return interop.BlobPropertyBag(
      type: type,
      endings: endings,
    );
  }
}
