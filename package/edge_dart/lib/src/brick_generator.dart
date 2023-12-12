import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:mason/mason.dart';
import 'package:edge_dart/src/logger.dart';

class BrickGenerator {
  /// The logger to use.
  final Logger logger;

  /// The name of the brick to use (in the root of the `bricks` directory).
  final String brick;

  /// Any variables to pass to the brick template generator.
  final Map<String, dynamic> variables;

  /// An optional command to run after the brick is generated.
  final String? command;

  /// The location to generate the brick in (if not provided, the user will be prompted).
  final String? location;

  BrickGenerator({
    required this.logger,
    required this.brick,
    required this.variables,
    this.command,
    this.location,
  });

  Future<void> generate() async {
    String? outputPath = location;

    if (outputPath == null) {
      outputPath = logger
          .prompt('What directory would you like to create the project in?');
    }

    final outputDir =
        Directory(p.joinAll([Directory.current.path, outputPath]));

    if (location != null) {
      final confirmed = logger.confirm('Create project in ${outputDir.path}?',
          defaultValue: true);

      if (!confirmed) {
        logger.err('Exiting.');
        exit(1);
      }
    }

    if (await outputDir.exists()) {
      logger.err(
        'Directory ${outputDir.path} already exists. Exiting.',
      );
      exit(1);
    }

    logger.detail('Cloning the "$brick" template into $location');
    final progress =
        logger.progress('Creating new project in ${outputDir.path}...');

    final ref = Brick.git(
      GitPath(
        'https://github.com/azkadev/edge',
        path: 'bricks/$brick',
      ),
    );

    final generator = await MasonGenerator.fromBrick(ref);
    final target = DirectoryGeneratorTarget(outputDir);
    await generator.generate(target, vars: variables);

    progress.complete('Successfully cloned template.');
    logger.lineBreak();
    logger.info('To get started, run the following commands:');
    logger.lineBreak();
    logger.info('cd $location/'.prefix('\$').indent(2));
    logger.info('dart pub get'.prefix('\$').indent(2));
    if (command != null && command!.isNotEmpty) {
      logger.info('$command'.prefix('\$').indent(2));
    }
    logger.lineBreak();
  }
}
