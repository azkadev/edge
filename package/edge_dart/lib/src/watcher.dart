import 'dart:async';

import 'package:watcher/watcher.dart';
import 'package:glob/glob.dart';

class Watcher {
  final String watchPath;
  final String? include;
  final int? debounce;

  Watcher({
    required this.watchPath,
    this.include,
    this.debounce,
  });

  Stream<String> watch() {
    final watcher = DirectoryWatcher(watchPath);
    StreamSubscription? _subscription;
    final controller = StreamController<String>.broadcast(
      onCancel: () {
        _subscription?.cancel();
      },
    );
    final includeGlob = include != null ? Glob(include!) : null;
    Timer? _debounce;

    _subscription = watcher.events.listen((event) async {
      final path = event.path;

      // Ignore files not in the include glob.
      if (includeGlob != null && !includeGlob.matches(path)) return;

      if (debounce == null) {
        controller.add(path);
        return;
      }

      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(Duration(milliseconds: debounce!), () {
        controller.add(path);
      });
    });

    return controller.stream;
  }
}
