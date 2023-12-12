import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:edge_dart/src/config.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;

abstract class BaseCommand extends Command {
  final Logger logger;

  final String configFilePath = p.join(Directory.current.path, 'edge.yaml');

  Future<Config> getConfig() {
    final file = File(configFilePath);
    if (!file.existsSync()) {
      return Future.value(Config());
    } else {
      return file.readAsString().then(Config.loadFromYaml).then(updateConfig);
    }
  }

  FutureOr<Config> updateConfig(Config cfg) {
    return cfg;
  }

  BaseCommand({
    required this.logger,
  });
}
