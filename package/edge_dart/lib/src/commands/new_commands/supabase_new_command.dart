import '../../brick_generator.dart';
import '../base_command.dart';

class SupabaseNewCommand extends BaseCommand {
  @override
  final name = "supabase_functions";

  @override
  final description =
      "Create a new Supabase Edge Functions project using Dart Edge.";

  @override
  final takesArguments = true;

  SupabaseNewCommand({
    required super.logger,
  });

  @override
  void run() async {
    return BrickGenerator(
      logger: logger,
      brick: 'supabase_functions',
      location: argResults!.rest.isNotEmpty ? argResults!.rest.first : null,
      variables: {},
    ).generate();
  }
}
