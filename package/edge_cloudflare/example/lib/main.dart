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
import 'package:edge_cloudflare/edge_cloudflare.dart';

void main() {
  CloudflareWorkers(
    durableObjects: {
      'MyDurableObject': () => MyDurableObject(),
    },
    fetch: (request, env, ctx) async {
      // Access the namespace of the Durable Object (defined in wrangler.toml)
      final durable = env.getDurableObjectNamespace('FOO_BAR');

      // Generate an ID for the Durable Object (can be any string).
      final id = durable.idFromName(request.url.path);

      // Send a request to the Durable Object.
      return durable.get(id).fetch(request);
    },
  );
}

class MyDurableObject extends DurableObject {
  @override
  FutureOr<Response> fetch(Request request) async {
    // These calls are transactional.
    final views = (await state.storage.get<int>('views') ?? 0) + 1;
    await state.storage.put('views', views);

    return Response('This page has been viewed $views times.');
  }
}
