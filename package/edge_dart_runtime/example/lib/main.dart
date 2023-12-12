import 'package:edge_dart_runtime/edge_dart_runtime.dart';
import 'package:http/http.dart' as http;

void main() {
  // Setup the runtime environment.
  setupRuntime();
}

/// A fetch event handler.
Future<Response> fetchHandler(Request request) async {
  print('do request');
  final r =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  print(r.body);

  return Response('Hello, world!!', status: 200);
}
