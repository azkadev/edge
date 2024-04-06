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

import '../compiler.dart';
import '../dev_server.dart';
import 'base_command.dart';

class DevCommand extends BaseCommand {
  @override
  final name = "dev";

  @override
  final description = "Runs a local development environment with hot reload.";

  DevCommand({
    required super.logger,
  }) {
    argParser.addOption('port', abbr: 'p', defaultsTo: '3000');
  }

  @override
  void run() async {
    final edgeTool = Directory(
      p.join(Directory.current.path, '.dart_tool', 'edge'),
    );

    final devServer = DevServer(
      logger: logger,
      port: argResults!['port'],
      compiler: Compiler(
        logger: logger,
        entryPoint: p.join(Directory.current.path, 'lib', 'main.dart'),
        outputDirectory: edgeTool.path,
        outputFileName: 'main.dart.js',
        level: CompilerLevel.O1,
      ),
    );

    await devServer.start();
  }
}
