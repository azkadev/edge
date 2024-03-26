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


<!-- END LICENSE --> */
{{^shelf}}
import 'package:vercel_edge/vercel_edge.dart';
{{/shelf}}
{{#shelf}}
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:vercel_edge/vercel_edge_shelf.dart';
{{/shelf}}

void main() {
  {{^shelf}}
  VercelEdge(fetch: (request) {
    return Response("Hello...");
  });
  {{/shelf}}
  {{#shelf}}
  VercelEdgeShelf(fetch: (request) {
    final app = Router();

    app.get('/hello', (request) {
      return Response.ok("World!");
    });

    app.all('/<ignored|.*>', (request) {
      return Response.notFound('Not found');
    });

    return app(request);
  });
  {{/shelf}}
}
