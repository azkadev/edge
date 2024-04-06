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
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:mason_logger/mason_logger.dart';
import 'package:watcher/watcher.dart';
import 'package:path/path.dart' as p;

import 'compiler.dart';

class DevServer {
  final Logger logger;
  final Compiler compiler;
  final String? startScript;
  final String? port;

  DevServer({
    required this.logger,
    required this.compiler,
    this.startScript,
    this.port,
  });

  Future<Process> _startEdgeRuntime(String entryFile) {
    return Process.start(
      'npx',
      [
        'edge-runtime',
        '--listen',
        entryFile,
        '--port',
        port ?? Platform.environment['PORT'] ?? '3000',
      ],
      runInShell: true,
      includeParentEnvironment: true,
      mode: ProcessStartMode.detachedWithStdio,
    );
  }

  Future<String> _compile() async {
    final compiledFile = await compiler.compile();

    if (startScript != null) {
      await File(compiledFile).writeAsString(
        startScript!,
        mode: FileMode.append,
      );
    }

    return compiledFile;
  }

  Future<void> start() async {
    String compiled = await _compile();

    while (true) {
      Process process = await _startEdgeRuntime(
        compiled,
      );

      void kill(ProcessSignal signal) {
        process.kill(signal);
        exit(0);
      }

      List<StreamSubscription> subscriptions = [
        ProcessSignal.sigint.watch().listen(kill),
        ProcessSignal.sigterm.watch().listen(kill),
        process.stdout.transform(utf8.decoder).listen(logger.write),
        process.stderr.transform(utf8.decoder).listen(logger.err),
      ];

      final watcher = DirectoryWatcher(p.join(Directory.current.path, 'lib'));
      Timer? _debounce;
      StreamSubscription? watcherSubscription;

      final completer = Completer();
      watcherSubscription = watcher.events.listen((event) async {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 750), () {
          if (!completer.isCompleted) completer.complete();
        });
      });

      try {
        await completer.future;
        await watcherSubscription.cancel();
        await Future.wait(subscriptions.map((e) => e.cancel()));
        compiled = await _compile();
      } finally {
        kill(ProcessSignal.sigterm);
      }
    }
  }
}
