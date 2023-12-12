import 'package:typings/core.dart' as interop;

extension CloudflareWorkersRequestInteropExtension on interop.Request {
  String? get ipAddress => headers.get('x-real-ip');
  String? get city => headers.get('x-vercel-ip-city');
  String? get country => headers.get('x-vercel-ip-country');
  String? get region {
    final requestId = headers.get('x-vercel-id');
    if (requestId == null) {
      return 'dev1';
    }
    return requestId.split(':')[0];
  }

  String? get countryRegion => headers.get('x-vercel-ip-country-region');
  String? get latitude => headers.get('x-vercel-ip-latitude');
  String? get longitude => headers.get('x-vercel-ip-longitude');
}
