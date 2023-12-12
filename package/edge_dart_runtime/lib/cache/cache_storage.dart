import 'dart:js_util';

import 'package:typings/core.dart' as interop hide caches;
import '../interop/cache_interop.dart' as interop;
import '../request.dart';
import '../response.dart';
import 'cache.dart';
import 'cache_query_options.dart';

final caches = CacheStorage._(interop.caches);

class CacheStorage {
  final interop.CacheStorage _delegate;

  CacheStorage._(this._delegate);

  Future<bool> delete(String cacheName) async {
    return _delegate.delete(cacheName);
  }

  Future<bool> has(String cacheName) async {
    return _delegate.has(cacheName);
  }

  Future<Iterable<String>> keys() async {
    return _delegate.keys();
  }

  Future<Response?> match(Request request,
      [MultiCacheQueryOptions? options]) async {
    final obj = await promiseToFuture<interop.Response?>(
        _delegate.match(request.delegate, options?.delegate));
    return obj == null ? null : responseFromJsObject(obj);
  }

  Future<Cache> open(String name) async {
    return cacheFromJsObject(await _delegate.open(name));
  }
}
