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
import 'package:js/js.dart';
import 'package:edge_netlify/public/context.dart';
import 'package:edge_dart_runtime/interop/promise_interop.dart';
import 'package:edge_dart_runtime/edge_dart_runtime.dart';
import 'package:edge_dart_runtime/request.dart';
import 'package:edge_dart_runtime/response.dart';
import 'package:typings/core.dart' as interop;
import 'interop/context_interop.dart' as interop;

export 'package:edge_dart_runtime/edge_dart_runtime.dart';
export './public/context.dart' hide netlifyContextFromJsObject;

@JS('__dartNetlifyFetchHandler')
external set __dartNetlifyFetchHandler(
    Promise<interop.Response> Function(
            interop.Request req, interop.NetlifyContext)
        f);

class NetlifyEdge {
  final FutureOr<Response> Function(Request request, NetlifyContext context)?
      fetch;

  NetlifyEdge({
    this.fetch,
  }) {
    // Setup the runtime environment.
    setupRuntime();

    if (fetch != null) {
      __dartNetlifyFetchHandler =
          allowInterop((interop.Request req, interop.NetlifyContext context) {
        return futureToPromise(Future(() async {
          final response = await fetch!(
            requestFromJsObject(req),
            netlifyContextFromJsObject(context),
          );
          return response.delegate;
        }));
      });
    }
  }
}
