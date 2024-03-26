import 'package:cloudflare_workers/cloudflare_workers.dart';

void main() {
  CloudflareWorkers(fetch: (request, env, ctx) {
    return Response("Hello...");
  });
}
