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
