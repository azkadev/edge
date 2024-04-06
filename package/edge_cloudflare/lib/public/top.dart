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
import 'dart:js_util' as js_util;

import 'package:edge_dart_runtime/edge_dart_runtime.dart' hide fetch;
import 'package:edge_dart_runtime/headers.dart';
import 'package:edge_dart_runtime/response.dart';
import 'package:edge_dart_runtime/abort/abort.dart';

import 'package:typings/core.dart' as interop;
import 'package:edge_dart_runtime/interop/utils_interop.dart' as interop;
import '../interop/request_init_interop.dart' as interop;

import 'request_init.dart';

Future<Response> fetch(
  Resource resource, {
  CloudflareRequestInit? cf,
  String? method,
  Headers? headers,
  Object? body,
  String? referrer,
  interop.ReferrerPolicy? referrerPolicy,
  interop.RequestMode? mode,
  interop.RequestCredentials? credentials,
  interop.RequestCache? cache,
  interop.RequestRedirect? redirect,
  String? integrity,
  bool? keepalive,
  AbortSignal? signal,
}) async {
  final init = interop.RequestInit(
    method: method,
    headers: headers?.delegate,
    body: body,
    referrer: referrer,
    referrerPolicy: referrerPolicy,
    mode: mode,
    credentials: credentials,
    cache: cache,
    redirect: redirect,
    integrity: integrity,
    keepalive: keepalive,
    signal: signal?.delegate,
  );

  // Attach the non-standard Cloudflare properties to the Request Init object.
  if (cf != null) {
    init.cf = cf.delegate;
  }

  return responseFromJsObject(
    await js_util.promiseToFuture(
      interop.fetch(
        interop.requestFromResource(resource),
        init,
      ),
    ),
  );
}
