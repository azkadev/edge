import 'dart:js_util' as js_util;
import 'package:js/js.dart';

import 'package:typings/core.dart' as interop;

import '../request.dart';
import '../resource.dart';

interop.Request requestFromResource(Resource resource) {
  switch (resource.runtimeType) {
    case StringValue:
      return interop.Request((resource as StringValue).url);
    case UriValue:
      return interop.Request((resource as UriValue).uri.toString());
    case RequestValue:
      return (resource as RequestValue).request.delegate;
    default:
      throw Exception('Unknown resource type ${resource.runtimeType}');
  }
}

@JS('Object.keys')
external List<Object?> objectKeys(Object? object);

@JS('undefined')
external Object get jsUndefined;

@anonymous
@JS()
class JavaScriptObject {
  external factory JavaScriptObject();
}

extension PropsJavaScriptObject on JavaScriptObject {
  T get<T>(String key) => js_util.getProperty(this, key);
  void set(String key, dynamic value) {
    js_util.setProperty(this, key, value);
  }
}

bool isBasicType(value) {
  if (value == null || value is num || value is bool || value is String) {
    return true;
  }
  return false;
}

T dartify<T>(dynamic jsObject) {
  if (isBasicType(jsObject)) {
    return jsObject as T;
  }

  if (jsObject is List) {
    return jsObject.map(dartify).toList() as T;
  }

  var keys = objectKeys(jsObject);
  var result = <String, dynamic>{};
  for (var key in keys) {
    result[key as String] = dartify(js_util.getProperty(jsObject, key));
  }

  return result as T;
}
