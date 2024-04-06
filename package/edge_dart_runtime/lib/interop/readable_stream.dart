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
