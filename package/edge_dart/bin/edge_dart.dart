// ignore_for_file: avoid_print, unused_local_variable, unused_import, non_constant_identifier_names, unnecessary_brace_in_string_interps, empty_catches, depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'package:general_lib/general_lib.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;
import "package:mason_logger/mason_logger.dart";

Logger logger = Logger(level: Level.verbose);
Future<Directory?> getPackageDirectory({
  String package_name = "package:edge_dart/edge_dart.dart",
}) async {
  Uri? res = await Isolate.resolvePackageUri(Uri.parse(package_name));
  if (res == null) {
    return null;
  }
  List<String> paths = [...res.pathSegments];
  for (var i = 0; i < package_name.split("/").length; i++) {
    paths.removeLast();
  }
  Directory directory = Directory(path.joinAll(paths));

  if (!directory.existsSync()) {
    directory = Directory(path.joinAll(["/", ...paths]));
  }
  return directory;
}

void main(List<String> args_raw) async {
  try {
    Directory? base_directory_lib = (await getPackageDirectory(
      package_name: "package:edge_dart/edge_dart.dart",
    ));

    if (base_directory_lib == null) {
      logger.info("Maaf kami tidak bisa menemukan directory library");
      exit(0);
    }

    Directory directory_lib = Directory(path.join(base_directory_lib.path, "lib"));
    Directory directory_lib_template = Directory(path.join(base_directory_lib.path, "template"));

    Args args = Args(args_raw);
    String name_exe = path.basenameWithoutExtension(Platform.script.toString()).split(".").first;
    String help_msg = """
A command-line ${name_exe}.

Usage: ${name_exe} <command> [arguments]

Global options:
  help                 Print this usage information. 
  version              Print the version.
  reload               Reload package ${name_exe}


Available commands: 
  create     Create a new Dart project.
  list_template list template
  clean

Run "${name_exe} help <command>" for more information about a command.

See https://youtube.com/@azkadev for detailed documentation and tutorial.
""";

    List<String> commands = [
      "help",
      "version",
      "create",
      "clean",
      "install",
      "list_template",
      "live_server",
      "reload",
      "build",
      "env",
      "setup",
    ];

    if (args.arguments.isEmpty) {
      logger.info(help_msg);

      String command = logger.chooseOne(
        "Interactive Telegam Client",
        choices: commands,
      );

      args.arguments = [command];
    }
    String first_args = args.arguments.first;
    if (!commands.contains(first_args.toLowerCase())) {
      logger.info(help_msg);
      exit(0);
    }
    bool isSucces = false;
    if (first_args == "reload") {
      Directory directory_pub = Directory(path.join(base_directory_lib.path, ".dart_tool", "pub"));
      if (directory_pub.existsSync()) {
        await directory_pub.delete(recursive: true);
      }
      bool is_procces = true;
      Process shell = await Process.start(
        "edge_dart",
        [],
        runInShell: true,
      );

      StreamSubscription<List<int>> shell_stdin = stdin.listen(
        (event) {
          shell.stdin.add(event);
        },
        onDone: () {
          is_procces = false;
        },
      );
      StreamSubscription<List<int>> shell_stder = shell.stderr.listen(
        (event) {
          stderr.add(event);
        },
        onDone: () {
          shell.kill();
          is_procces = false;
        },
      );

      StreamSubscription<List<int>> shell_stdout = shell.stdout.listen(
        (event) {
          stdout.add(event);
        },
        onDone: () {
          shell.kill();
          is_procces = false;
        },
      );

      while (true) {
        await Future.delayed(Duration(milliseconds: 500));
        if (is_procces) {
          continue;
        } else {
          await shell_stdin.cancel();
          await shell_stder.cancel();
          await shell_stdout.cancel();
          break;
        }
      }

      exit(0);
    }

    if (first_args == "clean") {
      void cleanFolder(Directory directory, bool is_current) {
        logger.info("dir: ${directory.path}");
        try {
          List<FileSystemEntity> dirs = directory.listSync();
          for (var i = 0; i < dirs.length; i++) {
            FileSystemEntity dir = dirs[i];
            try {
              if (dir is Directory) {
                if ([
                  ".dart_tool",
                  "build",
                ].contains(path.basename(dir.path))) {
                  if (is_current) {
                    if ([
                      "build",
                    ].contains(path.basename(dir.path))) {
                      dir.deleteSync(recursive: true);
                    }
                  } else {
                    dir.deleteSync(recursive: true);
                  }
                } else {
                  cleanFolder(dir.absolute, false);
                }
              }
            } catch (e) {}
          }
        } catch (e) {}
      }

      cleanFolder(Directory.current, true);

      exit(0);
    }

    if (first_args == "version") {
      logger.info("edge_dart version: 0.0.0 (stable) on ${Platform.operatingSystem}");
      exit(0);
    }

    if (first_args == "help") {
      try {
        String? two_args = args.arguments[1];
        if (two_args == "create") {
          String help_create = """
Create a new ${name_exe} project.

Usage: ${name_exe} create <directory> [arguments] 
  -f --force                      Force project generation, even if the target directory already exists.
  -t --template ${directory_lib_template.listSync().where((FileSystemEntity fileSystemEntity) {
                    return (fileSystemEntity.statSync().type == FileSystemEntityType.directory);
                  }).map((e) => path.basename(e.path)).toList().join("|")}

Run "${name_exe} help" to see global options.
""";
          logger.info(help_create);
          exit(0);
        }

        logger.info(help_msg);
        exit(0);
      } catch (e) {
        logger.info(help_msg);
        exit(0);
      }
    }

    if (first_args == "list_template") {
      logger.info("Get Templates");
      // durationTimeOut ??= ;
      DateTime dateTimeTimeOut = DateTime.now().add(Duration(minutes: 1));
      List<FileSystemEntity> dir_template = [];
      bool is_complete = false;

      var str = directory_lib_template.list().listen(
        (FileSystemEntity fileSystemEntity) {
          if (fileSystemEntity.statSync().type == FileSystemEntityType.directory) {
            dir_template.add(fileSystemEntity);
          }
        },
        onDone: () {
          is_complete = true;
        },
        cancelOnError: true,
      );

      while (true) {
        await Future.delayed(Duration(milliseconds: 1));
        if (dateTimeTimeOut.isExpired()) {
          await str.cancel();

          exit(0);
        }
        if (is_complete) {
          await str.cancel();
          break;
        }
      }
      logger.info("");
      for (var i = 0; i < dir_template.length; i++) {
        FileSystemEntity dirTemplate = dir_template[i];
        logger.info("\t${path.basename(dirTemplate.path)}");
      }
      logger.info("");
      logger.success("Jalankan Command ini untuk membuat project dengan template\n\n  ${name_exe} create name_project -t name_template");
      exit(0);
    }
    if (first_args == "create") {
      try {
        String two_args = () {
          try {
            return args.arguments[1];
          } catch (e) {
            String name_project = logger.prompt("Name Project? :");

            while (true) {
              if (name_project.isEmpty) {
                name_project = logger.prompt("Name Project? :");
              } else {
                break;
              }
            }
            return name_project;
          }
        }();
        logger.info("Create Project ${two_args}");
        List<String> templates = () {
          if (args["-t"] != null && (args["-t"] as String).isNotEmpty) {
            return args["-t"]!.split(",").whereType<String>().toList();
          } else if (args["--template"] != null && (args["--template"] as String).isNotEmpty) {
            return args["--template"]!.split(",").whereType<String>().toList();
          }
          List<String> templates_files = directory_lib_template.listSync().map((e) => path.basename(e.path)).whereType<String>().toList();

          return logger.chooseAny(
            "Silahkan Pilih Project",
            choices: templates_files,
            defaultValues: ["supabase_edge_functions_template"],
          );
        }();
        if (templates.isEmpty) {
          templates = ["supabase_edge_functions_template"];
        }
        String name = two_args;
        Directory directory_create = Directory(path.join(Directory.current.path, name));
        if (directory_create.existsSync()) {
          bool is_force = () {
            if ((args.arguments.contains("-f") || args.arguments.contains("--force"))) {
              return true;
            }
            return logger.confirm("Project ${name} Sudah ada apakah anda akan makasa? :");
          }();
          if (!is_force) {
            logger.info("Directory ${directory_create.path} already exists (use '--force' to force project generation)");
            exit(0);
          }
        }
        await directory_create.create(recursive: true);
        if (templates.isEmpty) {
          templates = ["supabase_edge_functions_template"];
        }
        Progress progress = logger.progress("Start Create Project ${name} menggunakan template ${templates.join(",")}...");
        if (templates.length > 1) {
          // logger.info("Creating ${name} using template ${templates.join(",")}...");
          for (var i = 0; i < templates.length; i++) {
            String template = templates[i];
            Directory directory_template_package = Directory(path.join(directory_lib_template.path, template));
            if (!directory_template_package.existsSync()) {
              logger.err("Failed Creating ${name} using template ${template} karena tidak ada template");
              exit(0);
            }
            Directory directory_create_folder = Directory(path.join(directory_create.path, template));
            if (!directory_create_folder.existsSync()) {
              await directory_create_folder.create(recursive: true);
            }
            directory_template_package.copyTo(
              directory_create_folder,
              ignoreDirList: [
                "build",
                ".dart_tool",
                "node_modules",
              ],
              ignoreFileList: [
                "pubspec.lock",
              ],
            );

            directory_create_folder.renameRecursive(
              origin_name: template,
              new_name: "${name}_${template.split("_").first}",
              ignoreDirList: [
                "build",
                ".dart_tool",
                "node_modules",
              ],
              ignoreFileList: [
                "pubspec.lock",
              ],
            );

            directory_create.renameRecursive(
              origin_name: template,
              new_name: "${name}_${template.split("_").first}",
              ignoreDirList: [
                "build",
                ".dart_tool",
                "node_modules",
              ],
              ignoreFileList: [
                "pubspec.lock",
              ],
            );

            directory_create.renameRecursive(
              origin_name: template.camelCaseClass(),
              new_name: "${name}_${template.split("_").first}".camelCaseClass(),
              ignoreDirList: [
                "build",
                ".dart_tool",
                "node_modules",
              ],
              ignoreFileList: [
                "pubspec.lock",
              ],
            );
          }
          progress.complete("Succes Build");
          logger.success("""
Created project ${name} ! In order to get started, run the following commands:

  cd ${name}
""");
          exit(0);
        } else {
          String template = templates.first;
          Directory directory_template_package = Directory(path.join(directory_lib_template.path, template));
          if (!directory_template_package.existsSync()) {
            logger.err("Failed Creating ${name} using template ${template} karena tidak ada template");
            exit(0);
          }

          directory_template_package.copyTo(
            directory_create,
            ignoreDirList: [
              "build",
              ".dart_tool",
              "node_modules",
            ],
          );
          directory_create.renameRecursive(
            origin_name: template,
            new_name: name,
            ignoreDirList: [
              "build",
              ".dart_tool",
              "node_modules",
            ],
          );
          directory_create.renameRecursive(
            origin_name: template.camelCaseClass(),
            new_name: name.camelCaseClass(),
            ignoreDirList: [
              "build",
              ".dart_tool",
              "node_modules",
            ],
          );
        }
        progress.complete("Succes Build");
        logger.success("""
Created project ${name} ! In order to get started, run the following commands:

  cd ${name}
""");
        exit(0);
      } catch (e) {
        logger.info(e.toString());
        exit(0);
      }
    }

    if (first_args == "build") {
      try {
        String two_args = args.arguments[1];

        if (two_args == "tdlib") {}

        if (two_args == "telegram-bot-api") {}

        exit(0);
      } catch (e) {
        exit(0);
      }
    }

    if (first_args == "setup") {
      List<SetupData> setup_datas = [];
      if (dart.isLinux) {
        logger.info("Setup Telegram Client On Linux");

        Progress progress = logger.progress("Setup Telegram Client On");
        await Future.delayed(Duration(milliseconds: 500));
        progress.update("Check telegram-bot-api And libtdjson.so");

        await Future.delayed(Duration(milliseconds: 500));
        setup_datas = [
          SetupData(
            path: "/usr/local/bin/telegram-bot-api",
            download_url: "",
          ),
          SetupData(
            path: "/usr/local/lib/libtdjson.so",
            download_url: "",
          ),
        ];

        await Future.delayed(Duration(milliseconds: 500));
        for (var i = 0; i < setup_datas.length; i++) {
          SetupData setupData = setup_datas[i];
          File file_setup = File(setupData.path);
          progress.update("Check: ${file_setup.path} Pending");
          if (file_setup.existsSync()) {
            progress.update("Check: ${file_setup.path} FOUND");
            if (args.arguments.contains("-f")) {
              progress.update("Remove: ${file_setup.path}");
              await Process.run(
                "sudo",
                [
                  "rm",
                  file_setup.path,
                ],
              );
              i--;
              continue;
            } else {
              progress.update("Tolong tambahkan Arguments: -f");
              exit(0);
            }
          } else {
            progress.update("Start Download: ${path.basename(file_setup.path)}");
            File file_setup_data = File(path.join(Directory.current.path, path.basename(file_setup.path)));
            try {
              Response res = (await get(Uri.parse(file_setup_data.path)));
              await file_setup_data.writeAsBytes(res.bodyBytes);
            } catch (e) {}
            if (file_setup_data.existsSync()) {
              await Process.run(
                "sudo",
                [
                  "cp",
                  path.join(Directory.current.path, path.basename(file_setup.path)),
                  file_setup.path,
                ],
              );

              progress.update("Chmod: ${path.basename(file_setup.path)}");
              await Process.run(
                "sudo",
                [
                  "chmod",
                  "777",
                  file_setup.path,
                ],
              );
              progress.update("Succes Saved: ${path.basename(file_setup.path)}");
            } else {
              progress.update("Failed Download: ${path.basename(file_setup.path)}\n\nMungkin Server sedang down");
            }
          }
        }
        progress.complete("Setup Finished");

        exit(0);
      }
      if (dart.isMacOS) {
        logger.info("Setup Telegram Client On Macos");
        logger.info("Check telegram-bot-api And libtdjson.dylib");

        setup_datas = [
          SetupData(
            path: "/usr/local/bin/telegram-bot-api",
            download_url: "",
          ),
          SetupData(
            path: "/usr/local/lib/libtdjson.so",
            download_url: "",
          ),
        ];
        for (var i = 0; i < setup_datas.length; i++) {
          SetupData setupData = setup_datas[i];
          File file_setup = File(setupData.path);
          logger.info("Check: ${file_setup.path} Pending");
          if (file_setup.existsSync()) {
            logger.info("Check: ${file_setup.path} FOUND");
            if (args.arguments.contains("-f")) {
              logger.info("Remove: ${file_setup.path}");
              await Process.run(
                "sudo",
                [
                  "rm",
                  file_setup.path,
                ],
              );
              i--;
              continue;
            } else {
              logger.info("Tolong tambahkan Arguments: -f");
              exit(0);
            }
          } else {
            logger.info("Start Download: ${path.basename(file_setup.path)}");
            File file_setup_data = File(path.join(Directory.current.path, path.basename(file_setup.path)));
            try {
              Response res = (await get(Uri.parse(file_setup_data.path)));
              await file_setup_data.writeAsBytes(res.bodyBytes);
            } catch (e) {}
            if (file_setup_data.existsSync()) {
              await Process.run(
                "sudo",
                [
                  "cp",
                  path.join(Directory.current.path, path.basename(file_setup.path)),
                  file_setup.path,
                ],
              );

              logger.info("Chmod: ${path.basename(file_setup.path)}");
              await Process.run(
                "sudo",
                [
                  "chmod",
                  "777",
                  file_setup.path,
                ],
              );
              logger.info("Succes Saved: ${path.basename(file_setup.path)}");
            } else {
              logger.info("Failed Download: ${path.basename(file_setup.path)}\n\nMungkin Server sedang down");
            }
          }
        }
        logger.info("");

        logger.info("Setup Finished");
        exit(0);
      }
      if (dart.isWindows) {
        logger.info("Setup Telegram Client On Windows");
        logger.info("Check telegram-bot-api.exe And libtdjson.dll");

        setup_datas = [
          SetupData(
            path: "/usr/local/bin/telegram-bot-api",
            download_url: "",
          ),
          SetupData(
            path: "/usr/local/lib/libtdjson.so",
            download_url: "",
          ),
        ];
        for (var i = 0; i < setup_datas.length; i++) {
          SetupData setupData = setup_datas[i];
          File file_setup = File(setupData.path);
          logger.info("Check: ${file_setup.path} Pending");
          if (file_setup.existsSync()) {
            logger.info("Check: ${file_setup.path} FOUND");
            if (args.arguments.contains("-f")) {
              logger.info("Remove: ${file_setup.path}");
              await Process.run(
                "sudo",
                [
                  "rm",
                  file_setup.path,
                ],
              );
              i--;
              continue;
            } else {
              logger.info("Tolong tambahkan Arguments: -f");
              exit(0);
            }
          } else {
            logger.info("Start Download: ${path.basename(file_setup.path)}");
            File file_setup_data = File(path.join(Directory.current.path, path.basename(file_setup.path)));
            try {
              Response res = (await get(Uri.parse(file_setup_data.path)));
              await file_setup_data.writeAsBytes(res.bodyBytes);
            } catch (e) {}
            if (file_setup_data.existsSync()) {
              await Process.run(
                "sudo",
                [
                  "cp",
                  path.join(Directory.current.path, path.basename(file_setup.path)),
                  file_setup.path,
                ],
              );
              logger.info("Chmod: ${path.basename(file_setup.path)}");
              await Process.run(
                "sudo",
                [
                  "chmod",
                  "777",
                  file_setup.path,
                ],
              );
              logger.info("Succes Saved: ${path.basename(file_setup.path)}");
            } else {
              logger.info("Failed Download: ${path.basename(file_setup.path)}\n\nMungkin Server sedang down");
            }
          }
        }
        logger.info("");
        logger.info("Setup Finished");
        exit(0);
      }
      logger.info("Setup Failed karena tidak support platform: ${dart.operatingSystem}");
      exit(0);
    }
  } catch (e, stack) {
    print("${e} ${stack}");
    exit(0);
  }
}

class SetupData {
  String download_url;
  String path;
  SetupData({
    required this.download_url,
    required this.path,
  });
}
