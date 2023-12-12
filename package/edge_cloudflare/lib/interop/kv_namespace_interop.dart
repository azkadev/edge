import 'dart:js_util' as js_util;
import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'package:edge_dart_runtime/interop/utils_interop.dart';

@anonymous
@JS()
@staticInterop
class KVNamespace {
  external factory KVNamespace();
}

extension PropsKVNamespace on KVNamespace {
  Future<T> get<T>(String name, [KVNamespaceGetOptions? options]) =>
      js_util.promiseToFuture(
          js_util.callMethod(this, 'get', [name, options ?? jsUndefined]));

  Future<KVNamespaceGetWithMetadataResult<T>> getWithMetadata<T>(
    String name, [
    KVNamespaceGetOptions? options,
  ]) =>
      js_util.promiseToFuture(
          js_util.callMethod(this, 'getWithMetadata', [name, options]));

  Future<void> put(
    String key,
    Object value, [
    KVNamespacePutOptions? options,
  ]) =>
      js_util.promiseToFuture<void>(js_util
          .callMethod(this, 'put', [key, value, options ?? jsUndefined]));

  Future<void> delete(/* string | string[] */ dynamic keys) =>
      js_util.promiseToFuture<void>(js_util.callMethod(this, 'delete', [keys]));

  Future<KVNamespaceListResult> list([KVNamespaceListOptions? options]) =>
      js_util.promiseToFuture(js_util.callMethod(this, 'list', [options]));
}

@anonymous
@JS()
@staticInterop
class KVNamespaceGetWithMetadataResult<T> {
  external factory KVNamespaceGetWithMetadataResult();
}

extension PropsKVNamespaceGetWithMetadataResult<T>
    on KVNamespaceGetWithMetadataResult {
  T? get value => js_util.getProperty(this, 'value');

  Object? get metadata => js_util.getProperty(this, 'metadata');
}

@anonymous
@JS()
@staticInterop
class KVNamespaceGetOptions {
  external factory KVNamespaceGetOptions();
}

extension PropsKVNamespaceGetOptions on KVNamespaceGetOptions {
  set type(String? value) {
    js_util.setProperty(this, 'type', value ?? jsUndefined);
  }

  set cacheTtl(int? value) {
    js_util.setProperty(this, 'expiration', value ?? jsUndefined);
  }
}

@anonymous
@JS()
@staticInterop
class KVNamespacePutOptions {
  external factory KVNamespacePutOptions();
}

extension PropsKVNamespacePutOptions on KVNamespacePutOptions {
  set expiration(DateTime? value) {
    js_util.setProperty(this, 'expiration',
        value != null ? value.millisecondsSinceEpoch / 1000 : jsUndefined);
  }

  set expirationTtl(int? value) {
    js_util.setProperty(this, 'expirationTtl', value ?? jsUndefined);
  }

  set metadata(Object? value) {
    js_util.setProperty(
        this, 'metadata', value != null ? jsify(value) : jsUndefined);
  }
}

@anonymous
@JS()
@staticInterop
class KVNamespaceListResult {
  external factory KVNamespaceListResult();
}

extension PropsKVNamespaceListResult on KVNamespaceListResult {
  bool get listComplete => js_util.getProperty(this, 'list_complete');
  external dynamic get keys;
  external String? get cursor;
}

@anonymous
@JS()
@staticInterop
class KVNamespaceListKey {
  external factory KVNamespaceListKey();
}

extension PropsKVNamespaceListKey on KVNamespaceListKey {
  String get name => js_util.getProperty(this, 'name');
  int? get expiration => js_util.getProperty(this, 'expiration');
  Object? get metadata => js_util.getProperty(this, 'metadata');
}

@anonymous
@JS()
@staticInterop
class KVNamespaceListOptions {
  external factory KVNamespaceListOptions();
}

extension PropsKVNamespaceListOptions on KVNamespaceListOptions {
  set limit(int? value) {
    js_util.setProperty(this, 'limit', value ?? jsUndefined);
  }

  set prefix(String? value) {
    js_util.setProperty(this, 'prefix', value ?? jsUndefined);
  }

  set cursor(String? value) {
    js_util.setProperty(this, 'cursor', value ?? jsUndefined);
  }
}
