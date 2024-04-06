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
import 'dart:js';

export 'dart:async' show FutureOr;

export 'package:typings/core.dart' show ReferrerPolicy, ResponseType, RequestCache, RequestCredentials, RequestDestination, RequestMode, RequestRedirect, atob, btoa;

export 'abort/abort.dart' show AbortController, AbortSignal;
export 'blob.dart' show Blob, BlobPropertyBag;
export 'cache/cache.dart' show Cache;
export 'cache/cache_query_options.dart' show CacheQueryOptions, MultiCacheQueryOptions;
export 'cache/cache_storage.dart' show CacheStorage, caches;
export 'file.dart' show File;
export 'form_data.dart' show FormData, FormDataEntryValue;
export 'headers.dart' show Headers;
export 'io_http_client.dart';
export 'request.dart' show Request;
export 'resource.dart' show Resource;
export 'response.dart' show Response;
export 'text_decoder.dart' show TextDecoder, TextDecodeOptions, TextDecoderOptions;
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
