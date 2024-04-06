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
