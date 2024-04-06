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
