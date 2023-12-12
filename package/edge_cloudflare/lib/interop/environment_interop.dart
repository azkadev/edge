import 'dart:js_util' as js_util;
import 'package:js/js.dart';

import 'kv_namespace_interop.dart';
import 'durable_object_interop.dart';

@anonymous
@JS()
@staticInterop
class Environment {
  external factory Environment();
}

extension PropsEnvironment on Environment {
  KVNamespace getKVNamespace(String name) {
    final obj = js_util.getProperty(this, name);
    if (obj == null) {
      // TODO better error
      throw StateError(
        'KVNamespace binding not found: $name - ensure it has been added to the wrangler.toml',
      );
    }
    return obj;
  }

  DurableObjectNamespace getDurableObjectNamespace(String name) {
    final obj = js_util.getProperty(this, name);
    if (obj == null) {
      // TODO better error
      throw StateError(
        'No durable object found',
      );
    }
    return obj;
  }
}
