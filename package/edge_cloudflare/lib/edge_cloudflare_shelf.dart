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
// import 'dart:js_util';

// import 'package:shelf_router/shelf_router.dart' show Router;
// import 'package:shelf/src/request.dart' show Request;
// import 'package:shelf/src/response.dart' show Response;

// import 'package:js/js.dart' as js;
// import 'edge_cloudflare_shelf.dart';
// import 'fetch_interop.dart' as interop;

// export 'cloudflare_interop.dart'
//     show
//         IncomingRequestCfProperties,
//         IncomingRequestCfPropertiesBotManagement,
//         IncomingRequestCfPropertiesTLSClientAuth;
// export 'package:shelf/src/request.dart' show Request;
// export 'package:shelf/src/response.dart' show Response;
// export 'package:shelf_router/shelf_router.dart' show Router;

// void serve(Router router) {
//   interop.addEventListener('fetch',
//       js.allowInterop((interop.FetchEvent event) async {
//     event.respondWith(interop.futureToPromise(Future(() async {
//       // final context = {
//       //   // if (event.request.cf != null) 'cf': event.request.cf!,
//       // };
//       final shelfRequest = Request(
//         event.request.method, Uri.parse(event.request.url),
//         // context: context,
//         // TODO other properties
//       );
//       final shelfResponse = await router.call(shelfRequest);
//       // response.headersAll.forEach((key, values) {
//       //   values.forEach((value) {
//       //     event.respondWith.headers.append(key, value);
//       //   });
//       // });
//       return interop.Response(await shelfResponse.readAsString());
//     })));
//   }));
// }

// extension CloudflareRequest on Request {
//   IncomingRequestCfProperties? get cf => context['cf'] as IncomingRequestCfProperties?;
// }
