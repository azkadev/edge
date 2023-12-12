import 'base_command.dart';
import 'new_commands/cloudflare_new_command.dart';
import 'new_commands/vercel_new_command.dart';
import 'new_commands/supabase_new_command.dart';

class NewCommand extends BaseCommand {
  @override
  final name = "new";

  @override
  final description = "Create a new Dart Edge project from a template.";

  NewCommand({
    required super.logger,
  }) {
    addSubcommand(VercelNewCommand(logger: logger));
    addSubcommand(CloudflareNewCommand(logger: logger));
    addSubcommand(SupabaseNewCommand(logger: logger));
  }
}
