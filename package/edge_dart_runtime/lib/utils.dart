import 'dart:typed_data' show ByteBuffer, Uint8List;

Object? convertBody(Object? body) {
  if (body == null) {
    return null;
  }

  if (body is String) {
    return body;
  }

  if (body is Uint8List) {
    return body;
  }

  if (body is ByteBuffer) {
    return body;
  }

  throw ArgumentError.value(
    body,
    'body',
    'Body must be an nullable instance of [String], [ByteBuffer] or [Uint8List].',
  );
}
