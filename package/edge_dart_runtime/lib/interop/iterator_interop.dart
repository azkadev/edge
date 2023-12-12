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
