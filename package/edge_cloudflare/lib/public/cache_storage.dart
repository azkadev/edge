import 'package:edge_dart_runtime/edge_dart_runtime.dart';
import 'package:edge_dart_runtime/cache/cache.dart';

import '../interop/cache_interop.dart' as interop;

extension CloudflareWorkersCacheStorageExtension on CacheStorage {
  Cache get defaultCache => cacheFromJsObject(interop.defaultCache);
}
