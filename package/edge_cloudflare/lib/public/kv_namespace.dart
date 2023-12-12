import 'dart:js_util';
import 'dart:typed_data';

import 'package:edge_dart_runtime/interop/utils_interop.dart';
import 'package:edge_dart_runtime/interop/readable_stream.dart';

import '../interop/kv_namespace_interop.dart' as interop;

class KVNamespace {
  final interop.KVNamespace _delegate;

  KVNamespace._(this._delegate);

  Future<String?> get(
    String name, {
    int? cacheTtl,
  }) =>
      _delegate.get(
        name,
        interop.KVNamespaceGetOptions()
          ..type = 'text'
          ..cacheTtl = cacheTtl,
      );

  Future<KVNamespaceGetWithMetadataResult<String?>> getWithMetadata(
    String name, {
    int? cacheTtl,
  }) async {
    return KVNamespaceGetWithMetadataResult._(
      await _delegate.getWithMetadata(
        name,
        interop.KVNamespaceGetOptions()
          ..type = 'text'
          ..cacheTtl = cacheTtl,
      ),
    );
  }

  Future<Map<K, V>> getJson<K, V>(
    String name, {
    int? cacheTtl,
  }) async {
    final json = await _delegate.get(
      name,
      interop.KVNamespaceGetOptions()
        ..type = 'json'
        ..cacheTtl = cacheTtl,
    );

    return dartify(json) as Map<K, V>;
  }

  Future<KVNamespaceGetWithMetadataResult<Map<K, V>?>>
      getJsonWithMetadata<K, V>(
    String name, {
    int? cacheTtl,
  }) async {
    return KVNamespaceGetWithMetadataResult._(
      await _delegate.getWithMetadata(
        name,
        interop.KVNamespaceGetOptions()
          ..type = 'json'
          ..cacheTtl = cacheTtl,
      ),
    );
  }

  Future<ByteBuffer?> getBuffer(
    String name, {
    int? cacheTtl,
  }) =>
      _delegate.get(
        name,
        interop.KVNamespaceGetOptions()
          ..type = 'arrayBuffer'
          ..cacheTtl = cacheTtl,
      );

  Future<KVNamespaceGetWithMetadataResult<ByteBuffer?>> getBufferWithMetadata(
    String name, {
    int? cacheTtl,
  }) async {
    return KVNamespaceGetWithMetadataResult._(
      await _delegate.getWithMetadata(
        name,
        interop.KVNamespaceGetOptions()
          ..type = 'arrayBuffer'
          ..cacheTtl = cacheTtl,
      ),
    );
  }

  Future<Stream<List<int>>?> getStream(
    String name, {
    int? cacheTtl,
  }) async {
    final stream = await _delegate.get(
      name,
      interop.KVNamespaceGetOptions()
        ..type = 'stream'
        ..cacheTtl = cacheTtl,
    );

    if (stream == null) {
      return null;
    }

    final reader = callMethod<ReadableStreamDefaultReader>(
      stream,
      'getReader',
      [],
    );

    return streamFromJSReader(reader);
  }

  Future<KVNamespaceGetWithMetadataResult<ReadableStream?>>
      getStreamWithMetadata(
    String name, {
    int? cacheTtl,
  }) async {
    return KVNamespaceGetWithMetadataResult._(
      await _delegate.getWithMetadata(
        name,
        interop.KVNamespaceGetOptions()
          ..type = 'stream'
          ..cacheTtl = cacheTtl,
      ),
    );
  }

  Future<void> put(
    String key,
    Object value, {
    DateTime? expiration,
    int? expirationTtl,
    Object? metadata,
  }) =>
      _delegate.put(
        key,
        value,
        interop.KVNamespacePutOptions()
          ..expiration = expiration
          ..expirationTtl = expirationTtl
          ..metadata = metadata,
      );

  Future<void> delete(Iterable<String> keys) => _delegate.delete(keys);

  Future<KVNamespaceListResult> list({
    int? limit,
    String? prefix,
    String? cursor,
  }) async =>
      KVNamespaceListResult._(
        await _delegate.list(
          interop.KVNamespaceListOptions()
            ..limit = limit
            ..prefix = prefix
            ..cursor = cursor,
        ),
      );
}

KVNamespace kvNamespaceFromJsObject(interop.KVNamespace obj) =>
    KVNamespace._(obj);

class KVNamespaceGetWithMetadataResult<T> {
  final interop.KVNamespaceGetWithMetadataResult<T> _delegate;
  KVNamespaceGetWithMetadataResult._(this._delegate);
  T get value => dartify(_delegate.value);
  Object? get metadata => dartify(_delegate.metadata);
}

class KVNamespaceListResult {
  final interop.KVNamespaceListResult _delegate;
  KVNamespaceListResult._(this._delegate);
  Iterable<KVNamespaceListKey> get keys {
    return [
      for (int i = 0; i < _delegate.keys.length; i++)
        KVNamespaceListKey._(_delegate.keys[i])
    ];
  }

  bool get listComplete => _delegate.listComplete;
  String? get cursor => _delegate.cursor;
}

class KVNamespaceListKey {
  final interop.KVNamespaceListKey _delegate;
  KVNamespaceListKey._(this._delegate);
  String get name => _delegate.name;
  Object? get metadata => _delegate.metadata;
}
