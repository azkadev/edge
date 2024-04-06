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
import 'dart:io';

import 'package:edge_dart/src/config.dart';
import 'package:path/path.dart' as p;

import '../../compiler.dart';
import '../../watcher.dart';
import '../base_command.dart';

class SupabaseBuildCommand extends BaseCommand {
  @override
  final name = "supabase_functions";

  @override
  final description = "Builds the project for Supabase Edge Functions.";

  SupabaseBuildCommand({
    required super.logger,
  }) {
    argParser.addFlag(
      'dev',
      help: 'Runs Dart Edge in a local development environment with hot reload via Vercel CLI.',
    );
    argParser.addOption(
      'project-path',
      abbr: 'p',
      help: 'The path to the supabase project.',
    );
  }

  @override
  Future<Config> updateConfig(Config cfg) async {
    Config config = cfg.copyWith(
      supabase: cfg.supabase.copyWith(
        projectPath: p.canonicalize(argResults!.wasParsed('project-path') ? argResults!['project-path'] as String : cfg.supabase.projectPath),
      ),
    );

    logger.detail('Supabase project path: ${config.supabase.projectPath}');
    logger.detail('Supabase functions: ${config.supabase.functions}');
    return config;
  }

  Future<void> runDev() async {
    final cfg = await getConfig();
    final exitOnError = cfg.get(cfg.supabase, (c) => c.exitWatchOnFailure) ?? true;
    logger.detail("Watcher will ${exitOnError ? '' : 'not '}exit on error.");

    final watcher = Watcher(
      include: '**/*.dart',
      debounce: 500,
      watchPath: p.join(Directory.current.path, 'lib'),
    );

    final compilers = <Compiler>[];
    final futures = <Future>[];

    final progress = logger.progress('Compiling ' + cfg.supabase.functions.length.toString() + ' functions');

    for (final fn in cfg.supabase.functions.entries) {
      final fnDir = p.join(cfg.supabase.projectPath, 'functions', fn.key);
      final entryFile = File(p.join(fnDir, 'index.ts'));
      if (!entryFile.parent.existsSync()) {
        await entryFile.parent.create(recursive: true);
      }

      final compiler = Compiler(
        logger: logger,
        entryPoint: p.join(Directory.current.path, fn.value),
        outputDirectory: fnDir,
        outputFileName: 'main.dart.js',
        level: cfg.get(cfg.supabase, (c) => c.devCompilerLevel) ?? CompilerLevel.O1,
        fileName: fn.value,
        showProgress: false,
        exitOnError: exitOnError,
      );

      futures.add(compiler.compile());

      futures.add(entryFile.writeAsString(
        edgeFunctionEntryFileDefaultValue('main.dart.js'),
      ));

      compilers.add(compiler);
    }

    await Future.wait(futures);

    progress.complete();

    watcher.watch().listen((event) async {
      final progress = logger.progress(
        'Compiling ' + cfg.supabase.functions.length.toString() + ' functions',
      );
      await Future.wait(
        compilers.map((compiler) => compiler.compile()),
      );
      progress.complete();
    });
  }

  Future<void> runBuild() async {
    final cfg = await getConfig();

    logger.info('Compiling ' + cfg.supabase.functions.length.toString() + ' functions');

    await Future.any(cfg.supabase.functions.entries.map((fn) async {
      final fnDir = p.join(cfg.supabase.projectPath, 'functions', fn.key);
      final entryFile = File(p.join(fnDir, 'index.ts'));
      if (!entryFile.parent.existsSync()) {
        await entryFile.parent.create(recursive: true);
      }

      final compiler = Compiler(
        logger: logger,
        entryPoint: p.join(Directory.current.path, fn.value),
        outputDirectory: fnDir,
        outputFileName: 'main.dart.js',
        level: cfg.get(cfg.supabase, (c) => c.prodCompilerLevel) ?? CompilerLevel.O4,
        fileName: fn.value,
        exitOnError: cfg.get(cfg.supabase, (c) => c.exitWatchOnFailure) ?? true,
      );

      await compiler.compile();

      await entryFile.writeAsString(
        edgeFunctionEntryFileDefaultValue('main.dart.js'),
      );
    }));
  }

  @override
  void run() async {
    final isDev = argResults!['dev'] as bool;
    if (isDev) {
      await runDev();
    } else {
      await runBuild();
    }
  }
}

final edgeFunctionEntryFileDefaultValue = (String fileName) => '''
import { serve } from "https://deno.land/std@0.131.0/http/server.ts";
import "./${fileName}";

serve((request) => {
  if (self.__dartSupabaseFetchHandler) {
    return self.__dartSupabaseFetchHandler(request);
  }

  return new Response("Something went wrong", { status: 500 });
});

declare global {
  interface Window {
    __dartSupabaseFetchHandler?: (request: Request) => Promise<Response>;
  }
}
''';
