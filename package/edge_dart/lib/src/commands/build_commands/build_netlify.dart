import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as p;

import '../../compiler.dart';
import '../base_command.dart';

class NetlifyBuildCommand extends BaseCommand {
  @override
  final name = "netlify";

  @override
  final description = "TODO.";

  NetlifyBuildCommand({
    required super.logger,
  }) {
    argParser.addOption('port',
        help: 'The port to run the dev server on.', defaultsTo: '4000');
    argParser.addFlag(
      'dev',
      help:
          'Runs Dart Edge in a local development environment with hot reload via Netlify CLI.',
    );
  }

  Future<void> runDev() async {
    final netlifyEdge = Directory(
      p.join(Directory.current.path, '.netlify', 'edge-functions', 'dart_edge'),
    );

    final compiler = Compiler(
      logger: logger,
      entryPoint: p.join(Directory.current.path, 'lib', 'main.dart'),
      outputDirectory: netlifyEdge.path,
      level: CompilerLevel.O1,
    );

    await compiler.compile();

    await File(p.join(netlifyEdge.path, 'index.js'))
        .writeAsString(edgeFunctionEntryFileDefaultValue('main.dart.js'));

    // try {
    //   print('Starting hot reload...');
    //   final reloader = await HotReloader.create(
    //     debounceInterval: Duration(milliseconds: 50),
    //     onBeforeReload: (ctx) {
    //       print(ctx.event?.path);
    //       return true;
    //     },
    //     onAfterReload: (ctx) async {
    //       // TODO: Compiler works, but netlify doesnt realise the file has
    //       // changes unless we manually save?
    //       logger.write('Changes detected...');
    //       await compiler.compile();
    //     },
    //   );
    // } catch (e) {
    //   print(e);
    // }

    // print(Platform.environment);

    // final devServer = DevServer(
    //   logger: logger,
    //   startScript: devAddEventListener,
    //   port: argResults!['port'] as String,
    //   compiler: Compiler(
    //     logger: logger,
    //     entryPoint: p.join(Directory.current.path, 'lib', 'main.dart'),
    //     outputDirectory: edgeTool.path,
    //     outputFileName: 'main.dart.js',
    //     level: CompilerLevel.O1,
    //   ),
    // );

    // await devServer.start();
  }

  @override
  void run() async {
    // TODO: figure out how to get durable objects from toml

    final isDev = argResults!['dev'] as bool;

    // final netlifyTool = Directory(
    //   p.join(Directory.current.path, '.netlify', 'edge-functions', 'dart_edge'),
    // );

    if (isDev) {
      await runDev();
    }

    // final compiler = Compiler(
    //   logger: logger,
    //   entryPoint: p.join(Directory.current.path, 'lib', 'main.dart'),
    //   outputDirectory: netlifyTool.path,
    //   outputFileName: 'main.dart.js',
    //   level: isDev ? CompilerLevel.O1 : CompilerLevel.O4,
    // );

    // await compiler.compile();

    // // Update the entry file.
    // await File(p.join(netlifyTool.path, 'index.js'))
    //     .writeAsString(edgeFunctionEntryFileDefaultValue('main.dart.js'));
  }
}

const devAddEventListener = '''addEventListener("fetch", async (event) => {
  if (self.__dartNetlifyFetchHandler !== undefined) {
    event.respondWith(self.__dartNetlifyFetchHandler(event.request, {}));
  }
});
''';

final edgeFunctionEntryFileDefaultValue =
    (String fileName) => '''import './${fileName}';

export default (request, context) => {
  if (self.__dartNetlifyFetchHandler !== undefined) {
    return self.__dartNetlifyFetchHandler(request, context);
  }
}

export const config = { path: "*" }
''';
