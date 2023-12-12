import 'package:edge_dart_runtime/interop/utils_interop.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart' as js_utils;
import 'iterator_interop.dart' as i;

@JS()
@staticInterop
class Headers {
  external factory Headers([dynamic init]);
}

extension HeadersProps on Headers {
  void append(String name, String value) {
    js_utils.callMethod(this, 'append', [name, value]);
  }

  void delete(String name) {
    js_utils.callMethod(this, 'delete', [name]);
  }

  String? get(String name) {
    return js_utils.callMethod(this, 'get', [name]);
  }

  bool has(String name) {
    return js_utils.callMethod(this, 'has', [name]);
  }

  void set(String name, String value) {
    js_utils.callMethod(this, 'set', [name, value]);
  }

  Iterable<List<String>> get entries {
    final iterator = js_utils.callMethod(this, 'entries', []);
    return i.fromJSIterator(iterator).map((e) => e.cast<String>());
  }

  Iterable<String> get keys {
    final iterator = js_utils.callMethod<i.Iterator>(this, 'keys', []);
    return i.fromJSIterator(iterator).map<String>(dartify);
  }

  Iterable<String> get values {
    final iterator = js_utils.callMethod<i.Iterator>(this, 'values', []);
    return i.fromJSIterator(iterator).map<String>(dartify);
  }

  Map<String, String> toMap() {
    final map = <String, String>{};
    for (final entry in entries) {
      map[entry[0]] = entry[1];
    }
    return map;
  }
}
