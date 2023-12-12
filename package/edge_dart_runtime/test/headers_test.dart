import 'package:edge_dart_runtime/edge_dart_runtime.dart';
import 'package:test/test.dart';

void main() {
  group('Headers', () {
    test('Headers()', () {
      expect(Headers()['foo'], null);
      expect(Headers({'foo': 'bar'})['foo'], 'bar');
    });

    test('.has()', () {
      expect(Headers().has('foo'), false);
      expect(Headers({'foo': 'bar'}).has('foo'), true);
    });

    test('.append()', () {
      final headers = Headers({'foo': 'bar'})..append('foo', 'baz');
      expect(headers['foo'], 'bar, baz');
    });

    test('.keys()', () {
      final headers = Headers({'foo': 'bar'});
      expect(headers.keys.toList(), ['foo']);
    });

    test('.delete()', () {
      final headers = Headers({'foo': 'bar'})..delete('foo');
      expect(headers['foo'], null);
    });

    test('setter', () {
      final headers = Headers({'foo': 'bar'});
      headers['bar'] = 'baz';
      expect(headers['foo'], 'bar');
      expect(headers['bar'], 'baz');
    });

    test('getter', () {
      final headers = Headers({'foo': 'bar'});
      expect(headers['foo'], 'bar');
    });
  });
}
