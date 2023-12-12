import 'dart:io';

import 'package:path/path.dart';

void main(List<String> args) {
  String name = ".";

  Directory directory_create = Directory(join(Directory.current.path, name));
  if (name == ".") {
    name = basename(dirname(directory_create.path));
  }

  print(name);
}
