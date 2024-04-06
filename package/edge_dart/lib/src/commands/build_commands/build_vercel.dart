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
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

import '../../compiler.dart';
import '../../dev_server.dart';
import '../base_command.dart';

class VercelBuildCommand extends BaseCommand {
  @override
  final name = "edge_vercel";

  @override
  final description = "Builds the project.";

  VercelBuildCommand({
    required super.logger,
  }) {
    argParser.addFlag(
      'dev',
      defaultsTo: false,
      negatable: false,
      help:
          'Runs Dart Edge in a local development environment with hot reload via Vercel CLI.',
    );

    argParser.addFlag(
      'use-filesystem',
      defaultsTo: false,
      negatable: false,
      help:
          'Instructs Vercel to match requests against the file system (for use when assets are required). This has no effect in development mode.',
    );
  }

  bool get isDev {
    return argResults!['dev'] as bool;
  }

  bool get useFilesystem {
    return argResults!['use-filesystem'] as bool;
  }

  Future<String> _compile(
    String outputDirectory, {
    required CompilerLevel level,
  }) async {
    final outFileName = 'main.dart.js';

    final compiler = Compiler(
      logger: logger,
      entryPoint: p.join(Directory.current.path, 'lib', 'main.dart'),
      outputDirectory: outputDirectory,
      outputFileName: outFileName,
      level: level,
    );

    await compiler.compile();
    return p.join(outputDirectory, outFileName);
  }

  Future<void> runDev() async {
    final edgeTool = Directory(
      p.join(Directory.current.path, '.dart_tool', 'edge'),
    );

    final devServer = DevServer(
      logger: logger,
      startScript: devAddEventListener,
      compiler: Compiler(
        logger: logger,
        entryPoint: p.join(Directory.current.path, 'lib', 'main.dart'),
        outputDirectory: edgeTool.path,
        outputFileName: 'main.dart.js',
        level: CompilerLevel.O1,
      ),
    );

    devServer.start();
  }

  Future<void> runBuild() async {
    final vercelDirectory = Directory(
      p.join(Directory.current.path, '.vercel'),
    );

    final edgeFunction = Directory(
      p.join(vercelDirectory.path, 'output', 'functions', 'dart.func'),
    );

    await _compile(
      edgeFunction.path,
      level: CompilerLevel.O4,
    );

    final configFile =
        File(p.join(vercelDirectory.path, 'output', 'config.json'));

    String configFileValue;
    if (await configFile.exists()) {
      // If a config file already exists, merge in the new route.
      final json = jsonDecode(await configFile.readAsString());

      // If there is no routes key, or it is not an iterable, create a new one.
      if (json['routes'] == null || json['routes'] is! Iterable) {
        json['routes'] = [
          if (useFilesystem) {'handle': 'filesystem'},
          {'src': '/*', 'dest': 'dart'}
        ];
      } else {
        final hasFileSystemHandler = (json['routes'] as Iterable).firstWhere(
          (route) => route['handle'] == 'filesystem',
          orElse: () => null,
        );

        if (useFilesystem && hasFileSystemHandler == null) {
          json['routes'] = [
            {'handle': 'filesystem'},
            ...json['routes'],
          ];
        }

        if (!useFilesystem && hasFileSystemHandler != null) {
          json['routes'] = (json['routes'] as Iterable)
              .skipWhile((value) => value['handle'] == 'filesystem')
              .toList();
        }

        // Otherwise, check if the route already exists.
        final route = (json['routes'] as Iterable).firstWhere(
          (route) => route['dest'] == 'dart',
          orElse: () => null,
        );

        // If the route does not exist, add it.
        if (route == null) {
          json['routes'] = [
            ...json['routes'],
            {'src': '/*', 'dest': 'dart'},
          ];
        }
      }
      configFileValue = jsonEncode(json);
    } else {
      // Otherwise create a new config file.
      configFileValue = configFileDefaultValue([
        if (useFilesystem) {'handle': 'filesystem'},
        {'src': '/*', 'dest': 'dart'}
      ]);
    }

    // Write the config file.
    await configFile.writeAsString(configFileValue);

    // Create a File instance of the Edge Function config file.
    final edgeFunctionConfig = File(
      p.join(edgeFunction.path, '.vc-config.json'),
    );

    // Write the Edge Function config file.
    await edgeFunctionConfig.writeAsString(edgeFunctionConfigFileDefaultValue);

    // Write the Edge Function config file.
    await File(p.join(edgeFunction.path, 'entry.js')).writeAsString(
      edgeFunctionEntryFileDefaultValue('main.dart.js'),
    );
  }

  @override
  void run() async {
    if (isDev) {
      await runDev();
    } else {
      await runBuild();
    }
  }
}

configFileDefaultValue(Iterable<dynamic> routes) => '''{
  "version": 3,
  "routes": ${jsonEncode(routes)}
}
''';

const edgeFunctionConfigFileDefaultValue = '''{
  "runtime": "edge",
  "entrypoint": "entry.js"
}
''';

const devAddEventListener = '''addEventListener("fetch", async (event) => {
  if (self.__dartVercelFetchHandler !== undefined) {
    event.respondWith(self.__dartVercelFetchHandler(event.request));
  }
});
''';

final edgeFunctionEntryFileDefaultValue =
    (String fileName) => '''import './${fileName}';

export default (request) => {
  if (self.__dartVercelFetchHandler !== undefined) {
    return self.__dartVercelFetchHandler(request);
  }
};
''';
