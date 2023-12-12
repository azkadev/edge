import 'dart:io';
import 'package:edge_dart/src/logger.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;

import '../../compiler.dart';
import '../base_command.dart';

import '../../platforms/cloudflare_workers.dart';

class CloudflareBuildCommand extends BaseCommand {
  CloudflareWorkers workers = CloudflareWorkers();

  @override
  final name = "cloudflare_workers";

  @override
  final description =
      "Builds a Dart Edge project for the Cloudflare Workers environment.";

  CloudflareBuildCommand({
    required super.logger,
  }) {
    argParser.addFlag(
      'dev',
      help:
          'Compiles Dart code with low levels of minification, for faster compilation but less performant code.',
    );
  }

  bool get isDev => argResults!['dev'] as bool;

  @override
  void run() async {
    if (!await workers.tomlFile.exists()) {
      logger.err('No wrangler.toml exists in the current directory.');
      logger.lineBreak();

      final docs = link(
        uri: Uri.parse('https://docs.dartedge.dev/platform/cloudflare'),
        message: 'https://docs.dartedge.dev/platform/cloudflare',
      );

      logger.info(
        'To get started with Cloudflare Workers, vist the docs: $docs',
      );
      exit(1);
    }

    final compiler = Compiler(
      logger: logger,
      entryPoint: p.join(Directory.current.path, 'lib', 'main.dart'),
      outputDirectory: workers.edgeToolDirectory.path,
      outputFileName: 'main.dart.js',
      level: isDev ? CompilerLevel.O1 : CompilerLevel.O4,
    );

    await compiler.compile();

    final durableObjectBindings = workers.getDurableObjectNames();

    String entryFile = workers.generateEntryFile('main.dart.js');

    // Add durable objects as exports.
    for (final durableObjectName in durableObjectBindings) {
      entryFile += workers.generateDurableObjectExport(durableObjectName);
    }

    if (durableObjectBindings.isNotEmpty) {
      logger.detail('Creating Durable Object exports: $durableObjectBindings');
    }

    // Update the entry file.
    await File(p.join(workers.edgeToolDirectory.path, 'entry.js'))
        .writeAsString(entryFile);

    logger.detail(
      'Entry file generated at ${p.join(workers.edgeToolDirectory.path, 'entry.js')}',
    );
  }
}
