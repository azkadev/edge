// import 'dart:js_util';

// import 'package:shelf_router/shelf_router.dart' show Router;
// import 'package:shelf/src/request.dart' show Request;
// import 'package:shelf/src/response.dart' show Response;

// import 'package:js/js.dart' as js;
// import 'edge_cloudflare_shelf.dart';
// import 'fetch_interop.dart' as interop;

// export 'cloudflare_interop.dart'
//     show
//         IncomingRequestCfProperties,
//         IncomingRequestCfPropertiesBotManagement,
//         IncomingRequestCfPropertiesTLSClientAuth;
// export 'package:shelf/src/request.dart' show Request;
// export 'package:shelf/src/response.dart' show Response;
// export 'package:shelf_router/shelf_router.dart' show Router;

// void serve(Router router) {
//   interop.addEventListener('fetch',
//       js.allowInterop((interop.FetchEvent event) async {
//     event.respondWith(interop.futureToPromise(Future(() async {
//       // final context = {
//       //   // if (event.request.cf != null) 'cf': event.request.cf!,
//       // };
//       final shelfRequest = Request(
//         event.request.method, Uri.parse(event.request.url),
//         // context: context,
//         // TODO other properties
//       );
//       final shelfResponse = await router.call(shelfRequest);
//       // response.headersAll.forEach((key, values) {
//       //   values.forEach((value) {
//       //     event.respondWith.headers.append(key, value);
//       //   });
//       // });
//       return interop.Response(await shelfResponse.readAsString());
//     })));
//   }));
// }

// extension CloudflareRequest on Request {
//   IncomingRequestCfProperties? get cf => context['cf'] as IncomingRequestCfProperties?;
// }
