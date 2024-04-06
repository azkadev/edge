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
      outputPath = logger.prompt('What directory would you like to create the project in?');
    }

    final outputDir = Directory(p.joinAll([Directory.current.path, outputPath]));

    if (location != null) {
      final confirmed = logger.confirm('Create project in ${outputDir.path}?', defaultValue: true);

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

    logger.detail('Cloning the "${brick}" template into $location');
    final progress = logger.progress('Creating new project in ${outputDir.path}...');

    final ref = Brick.git(
      GitPath(
        'https://github.com/azkadev/edge',
        path: 'bricks/${brick}',
      ),
    );

    final generator = await MasonGenerator.fromBrick(ref);
    final target = DirectoryGeneratorTarget(outputDir);
    await generator.generate(target, vars: variables);

    progress.complete('Successfully cloned template.');
    logger.lineBreak();
    logger.info('To get started, run the following commands:');
    logger.lineBreak();
    logger.info('cd ${location}/'.prefix('\$').indent(2));
    logger.info('dart pub get'.prefix('\$').indent(2));
    if (command != null && command!.isNotEmpty) {
      logger.info('${command}'.prefix('\$').indent(2));
    }
    logger.lineBreak();
  }
}
