import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

import 'src/commands/dev_command.dart';
import 'src/commands/build_command.dart';
import 'src/commands/new_command.dart';

void main(List<String> args) {
  EdgeCommandRunner().run(args);
}

class EdgeCommandRunner extends CommandRunner<void> {
  final Logger _logger;

  EdgeCommandRunner({
    Logger? logger,
  })  : _logger = logger ?? Logger(),
        super("edge",
            "A Command-Line Interface for managing Dart Edge projects.") {
    /// Add global flags.
    argParser.addFlag(
      'verbose',
      abbr: 'v',
      help: 'Enables verbose logging.',
    );

    addCommand(NewCommand(logger: _logger));
    addCommand(DevCommand(logger: _logger));
    addCommand(BuildCommand(logger: _logger));
  }

  @override
  void printUsage() {
    _logger.info(usage);
  }

  @override
  Future<void> run(Iterable<String> args) async {
    final argResults = argParser.parse(args);

    if (argResults['verbose'] == true) {
      _logger.level = Level.verbose;
    }

    _logger.detail('Running command: edge ${args.join(' ')}');

    return super.run(args);
  }
}
