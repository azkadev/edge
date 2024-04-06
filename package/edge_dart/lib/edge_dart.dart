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
