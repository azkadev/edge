// ignore_for_file: unused_local_variable

import 'package:edge_dart_http_client/edge_dart_http_client.dart';
import 'package:general_lib/general_lib.dart';
import 'package:edge_supabase/edge_supabase.dart';
import 'package:xendit/scheme/create_invoice.dart';
import 'package:xendit/xendit.dart';

void main() async {
  Xendit xendit = Xendit(
    apiKey:
        "xnd_development_ms2qSK9DyLkX5T8bX0g0RytDP3M2K2mBN6NoruOpPP8d8ruI6UZGk2rxFvOj",
    httpClient: EdgeHttpClient(),
  );
  SupabaseFunctions(fetch: (request) async {
    try {
      String path_url = request.url.path.trim();
      String method = request.method.toLowerCase();
      Map queryParameters = request.url.queryParameters;
      print(path_url);
      if (path_url == "/example/invoice") {
        CreateInvoice createInvoice = await xendit.createInvoice(
            external_id: "Sasas_${DateTime.now().toString()}", amount: 50000);

        return Response(createInvoice.rawData.toStringifyPretty());
      }

      return Response.json('Hello Supabase from Dart :D');
    } catch (e, stack) {
      return Response("Error: ${e}, stack: ${stack}");
    }
  });
}
