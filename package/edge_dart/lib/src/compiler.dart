import 'dart:io';

import 'package:edge_dart/src/logger.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;

enum CompilerLevel {
  O1,
  O2,
  O3,
  O4,
}

class Compiler {
  final Logger logger;

  // The entry point of the application.
  final String entryPoint;

  // The output directory path.
  final String outputDirectory;

  final CompilerLevel level;

  // The output file name. Defaults to `main.dart.js`.
  final String outputFileName;

  final String fileName;
  final bool showProgress;
  final bool exitOnError;

  Compiler({
    required this.logger,
    required this.entryPoint,
    required this.outputDirectory,
    required this.level,
    this.fileName = 'Dart entry file',
    this.outputFileName = 'main.dart.js',
    this.showProgress = true,
    this.exitOnError = true,
  });

  Future<String> compile() async {
    final entry = File(entryPoint);

    if (!entry.existsSync()) {
      logger.err(
          'Attempted to compile the entry file at ${entry.path}, but no file was found.');
      logger.lineBreak();

      final docs = link(
          uri: Uri.parse('https://docs.dartedge.dev'),
          message: 'https://docs.dartedge.dev');

      logger.info('Visit the docs for more information: $docs');
      exit(1);
    }

    // final compiling = logger.progress('Compiling Dart entry point');

    final outputPath = p.join(outputDirectory, outputFileName);

    logger.detail(
        'Compiling with optimization level ${level.name} ${entry.path} to $outputPath');

    final progress =
        showProgress ? logger.progress('Compiling $fileName') : null;

    final process = await Process.run('dart', [
      'compile',
      'js',
      '-${level.name}',
      '--no-frequency-based-minification',
      '--server-mode',
      '-o',
      outputPath,
      entry.path,
    ]);

    if (process.exitCode != 0) {
      progress?.cancel();
      logger.err('Compilation of the Dart entry file failed:');
      logger.lineBreak();
      logger.err(process.stdout);
      if (exitOnError) exit(1);
    }

    progress?.complete();
    logger.detail(process.stdout);

    return outputPath;
  }
}
