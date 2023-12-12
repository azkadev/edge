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
