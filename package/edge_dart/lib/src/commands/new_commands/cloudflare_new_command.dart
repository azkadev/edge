import '../../brick_generator.dart';
import '../base_command.dart';

class CloudflareNewCommand extends BaseCommand {
  @override
  final name = "edge_cloudflare";

  @override
  final description =
      "Create a new Cloudflare Workers project using Dart Edge.";

  CloudflareNewCommand({
    required super.logger,
  }) {
    argParser.addFlag(
      'shelf',
      help:
          'Whether to use the shelf package for routing and handling requests.',
    );
  }

  @override
  void run() async {
    return BrickGenerator(
      logger: logger,
      brick: 'edge_cloudflare',
      command: 'wrangler dev --local',
      location: argResults!.rest.isNotEmpty ? argResults!.rest.first : null,
      variables: {},
    ).generate();
  }
}
