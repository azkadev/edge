import 'dart:js';

export 'dart:async' show FutureOr;

export 'package:typings/core.dart'
    show
        ReferrerPolicy,
        ResponseType,
        RequestCache,
        RequestCredentials,
        RequestDestination,
        RequestMode,
        RequestRedirect,
        atob,
        btoa;

export 'abort/abort.dart' show AbortController, AbortSignal;
export 'blob.dart' show Blob, BlobPropertyBag;
export 'cache/cache.dart' show Cache;
export 'cache/cache_query_options.dart'
    show CacheQueryOptions, MultiCacheQueryOptions;
export 'cache/cache_storage.dart' show CacheStorage, caches;
export 'file.dart' show File;
export 'form_data.dart' show FormData, FormDataEntryValue;
export 'headers.dart' show Headers;
export 'io_http_client.dart';
export 'request.dart' show Request;
export 'resource.dart' show Resource;
export 'response.dart' show Response;
export 'text_decoder.dart'
    show TextDecoder, TextDecodeOptions, TextDecoderOptions;
export 'text_encoder.dart' show TextEncoder, TextEncoderEncodeIntoResult;
export 'top.dart';

/// This should be called before any other platform code is run.
void setupRuntime() {
  // Dart to JS looks for some context properties to determine whether some
  // features are available. Uri.base checks whether window.location.href is
  // available, so we patch it in here.
  if (context['self']['location'] == null) {
    context['self']['location'] = JsObject.jsify({
      'href': '',
    });
  }

  // Dart to JS assumes we're in a browser context, so we need to patch in.
  context['window'] ??= context['self'];
  // HttpOverrides.global = FetchHttpOverride();
}
