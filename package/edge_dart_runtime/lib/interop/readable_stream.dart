import 'dart:js_util' as js_util;
import 'dart:typed_data';
import 'package:js/js.dart';

@JS()
@staticInterop
@anonymous
class ReadableStream {
  external factory ReadableStream();
}

extension ReadableStreamProps on ReadableStream {
  bool get locked => js_util.getProperty(this, 'locked');

  ReadableStreamDefaultReader getReader() {
    final reader = js_util.callMethod<ReadableStreamDefaultReader>(
      this,
      'getReader',
      [],
    );

    return reader;
  }
}

class ReadResult {
  final bool done;
  final Uint8List? value;

  ReadResult(this.done, this.value);
}

@JS()
@staticInterop
@anonymous
class ReadableStreamDefaultReader {
  external factory ReadableStreamDefaultReader();
}

extension ReadableStreamReaderProps on ReadableStreamDefaultReader {
  Future<ReadResult> read() async {
    final promise = js_util.callMethod(this, 'read', []);
    final future = js_util.promiseToFuture(promise);

    final result = await future;
    final done = js_util.getProperty<bool>(result, 'done');
    final value = js_util.getProperty<Uint8List?>(result, 'value');

    return ReadResult(done, value);
  }

  bool get closed => js_util.getProperty(this, 'closed');

  Future<void> cancel() async {
    await js_util.callMethod(this, 'cancel', []);
  }

  Future<void> releaseLock() async {
    await js_util.callMethod(this, 'releaseLock', []);
  }
}

Stream<List<int>> streamFromJSReadable(ReadableStream jsStream) {
  final reader = jsStream.getReader();
  return streamFromJSReader(reader);
}

Stream<List<int>> streamFromJSReader(
    ReadableStreamDefaultReader reader) async* {
  while (true) {
    final result = await reader.read();

    if (result.done) {
      break;
    }

    yield result.value!;
  }
}
