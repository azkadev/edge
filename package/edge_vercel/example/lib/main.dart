// import 'package:edge_vercel/edge_vercel.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:edge_vercel/edge_vercel_shelf.dart';

void main() {
  // VercelEdge(fetch: (request) {
  //   return Response("Hello...");
  // });

  VercelEdgeShelf(fetch: (request) {
    final app = Router();

    app.get('/hello', (request) {
      return Response.ok("Hello...");
    });

    app.all('/<ignored|.*>', (request) {
      return Response.notFound('Not found');
    });

    return app(request);
  });
}
