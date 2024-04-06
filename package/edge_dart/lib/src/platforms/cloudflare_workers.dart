/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
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
