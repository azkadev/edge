import 'request.dart';

abstract class Resource {
  const factory Resource(String url) = StringValue;
  const factory Resource.uri(Uri uri) = UriValue;
  const factory Resource.request(Request request) = RequestValue;

  static Uri getUri(Resource resource) {
    if (resource is StringValue) {
      return Uri.parse(resource.url);
    } else if (resource is UriValue) {
      return resource.uri;
    } else {
      return (resource as RequestValue).request.url;
    }
  }
}

class StringValue implements Resource {
  final String url;

  const StringValue(this.url);
}

class UriValue implements Resource {
  final Uri uri;

  const UriValue(this.uri);
}

class RequestValue implements Resource {
  final Request request;

  const RequestValue(this.request);
}
