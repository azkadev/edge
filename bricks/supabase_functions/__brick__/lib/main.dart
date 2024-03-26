import 'package:supabase_functions/supabase_functions.dart';

void main() {
  SupabaseFunctions(fetch: (request) {
    return Response("Hello from Supabase Edge Functions!");
  });
}
