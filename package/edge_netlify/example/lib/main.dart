import 'package:edge_netlify/edge_netlify.dart';

void main() {
  NetlifyEdge(fetch: (request, context) {
    return Response("Hello, you're visiting from");
  });
}
