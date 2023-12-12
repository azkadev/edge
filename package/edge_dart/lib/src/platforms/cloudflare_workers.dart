import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:toml/toml.dart';

/// A class that contains all the logic for building a Cloudflare Workers project.
class CloudflareWorkers {
  /// The Directory where the Dart Edge generated files live.
  Directory edgeToolDirectory = Directory(
    p.join(Directory.current.path, '.dart_tool', 'edge'),
  );

  /// The wranger.toml file.
  File tomlFile = File(p.join(Directory.current.path, 'wrangler.toml'));

  /// Parses and returns the names of all the Durable Objects in the wrangler.toml file.
  Set<String> getDurableObjectNames() {
    final toml = TomlDocument.parse(tomlFile.readAsStringSync()).toMap();

    final durableObjectBindings = toml['durable_objects']?['bindings'] ?? [];
    final Set<String> durableObjectNames = {
      for (final binding in durableObjectBindings)
        if (binding['class_name'] != null) binding['class_name']
    };

    return durableObjectNames;
  }

  /// Generates the entry file for the Cloudflare Workers project.
  String generateEntryFile(String entryFileName) {
    return '''import './${entryFileName}';

export default {
  fetch: (request, env, ctx) => {
    if (self.__dartCloudflareFetchHandler !== undefined) {
      return self.__dartCloudflareFetchHandler(request, env, ctx);
    }
  },
  scheduled: (event, env, ctx) => {
    if (self.__dartCloudflareScheduledHandler !== undefined) {
      return self.__dartCloudflareScheduledHandler(event, env, ctx);
    }
  },
  email: (message, env, ctx) => {
    if (self.__dartCloudflareEmailHandler !== undefined) {
      return self.__dartCloudflareEmailHandler(message, env, ctx);
    }
  },
};

''';
  }

  /// Generates named exports for each Durable Object registered in the wrangler.toml file.
  ///
  /// These clasess interop with the global namespace, therefore implementation
  /// of Cloudflare Workers Durable Objects should provide JavaScript objects
  /// that are accessible from Dart within the global namespace.
  String generateDurableObjectExport(String className) {
    return '''export class $className {
  constructor(state, env) {
    const instance = self.__dartCloudflareDurableObjects["$className"];

    if (!instance) {
      throw new Error(
        `No Dart Durable object instance named '$className' found.`
      );
    }

    this.delegate = instance(state, env);
  }

  fetch(request) {
    return this.delegate.fetch(request);
  }

  alarm() {
    return this.delegate.alarm();
  }
}
''';
  }
}
