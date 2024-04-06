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
import 'package:js/js.dart';

@JS()
@staticInterop
class Symbol {
  external factory Symbol();
}

@JS('Symbol.iterator')
external Symbol get _iterator;

@anonymous
@JS()
@staticInterop
class Iterator<T> {
  external factory Iterator();
}

Iterable<T> fromJSIterator<T>(dynamic jsIterable) sync* {
  while (true) {
    final result = js_util.callMethod<IteratorResult<T>>(
      jsIterable,
      'next',
      [],
    );

    if (result.done) {
      break;
    }

    yield result.value;
  }
}

extension PropsIterator<T> on Iterator<T> {
  Iterable<T> toIterable<T>() sync* {
    final generator = js_util.getProperty(this, _iterator);
    final iterator = js_util.callMethod(generator, 'call', []);

    while (true) {
      final result = _next<T>(iterator);

      if (result.done) {
        break;
      }
      yield result.value;
    }
  }

  IteratorResult<T> _next<T>(dynamic iteratorInstance) {
    return js_util.callMethod(iteratorInstance, 'next', []);
  }
}

@JS('Symbol.asyncIterator')
external Symbol get _asyncIterator;

@anonymous
@JS()
@staticInterop
class AsyncIterator<T> {
  external factory AsyncIterator();
}

extension PropsAsyncIterator<T> on AsyncIterator<T> {
  Stream<T> toStream<T>() async* {
    final iterator = js_util.getProperty(this, _asyncIterator);
    final callable = js_util.callMethod(iterator, 'call', []);

    while (true) {
      final result = await _next<T>(callable);
      if (result.done) {
        break;
      }
      yield result.value;
    }
  }

  Future<IteratorResult<T>> _next<T>(dynamic iteratorInstance) {
    return js_util.promiseToFuture(
      js_util.callMethod(iteratorInstance, 'next', []),
    );
  }
}

@anonymous
@JS()
@staticInterop
class IteratorResult<T> {
  external factory IteratorResult();
}

extension PropsIteratorResult<T> on IteratorResult<T> {
  bool get done => js_util.getProperty(this, 'done');
  T get value => js_util.getProperty(this, 'value');
}
