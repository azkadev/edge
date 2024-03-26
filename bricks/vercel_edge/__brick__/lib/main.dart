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
