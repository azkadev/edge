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
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:edge_http_client/edge_http_client.dart';
import 'package:supabase_client/supabase_client.dart';
import 'package:supabase_functions/supabase_functions.dart';
import "package:general_lib/general_lib.dart";
import 'package:telegram_client_edge/telegram_client_edge.dart';

void main() async {
  // ignore: unused_local_variable
  Crypto crypto = Crypto(key: "MAR3Lh4cMBNjZ3O0s22Z5597iFAe3fQ9");
  EdgeHttpClient http = EdgeHttpClient();

  Database db = Supabase.database(
    supabaseUrl: "",
    supabaseKey: "",
    httpClient: http,
  );
  String token_bot = "";
  // ignore: unused_local_variable
  TelegramBotApiWeb tg =
      TelegramBotApiWeb(tokenBot: token_bot, httpClient: http);

  SupabaseFunctions(
    fetch: (request) async {
      try {
        String method = request.method.toLowerCase();

        if (method != "post") {
          return Response.json(
              {"@type": "error", "message": "hanya menerima method post!"});
        }
        String body_raw = await request.text();
        Map jsonBody = {};

        try {
          jsonBody = json.decode(body_raw);
        } catch (e) {}
        Map? result =
            await db.get(from: "web", dataId: "key", searchData: "count");
        if (result == null) {
          await db.add(from: "web", data: {
            "key": "count",
            "count": 1,
          });
        } else {
          result["count"] += 1;
          await db.update(
            from: "web",
            dataOrigin: {
              "key": "count",
            },
            dataUpdate: result,
          );
        }
        return Response.json({
          "@type": "ok",
          "url": request.url.toString(),
          "path": request.url.path,
          "request_body": jsonBody,
        });
      } catch (e, stack) {
        return Response("Error: ${e.toString()} ${stack.toString()}");
      }
    },
  );
}
