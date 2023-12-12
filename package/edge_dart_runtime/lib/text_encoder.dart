import 'dart:typed_data' show Uint8List;

import 'package:typings/core.dart' as interop;

class TextEncoder {
  final interop.TextEncoder _delegate;

  TextEncoder._(this._delegate);

  String get encoding => _delegate.encoding;

  Uint8List encode([String? input]) => _delegate.encode(input);

  TextEncoderEncodeIntoResult encodeInto(String input, Uint8List destination) =>
      TextEncoderEncodeIntoResult._(
        _delegate.encodeInto(input, destination),
      );
}

extension TextEncoderExtension on TextEncoder {
  interop.TextEncoder get delegate => _delegate;
}

TextEncoder textEncoderFromJsObject(interop.TextEncoder jsObject) =>
    TextEncoder._(jsObject);

class TextEncoderEncodeIntoResult {
  final interop.TextEncoderEncodeIntoResult _delegate;

  TextEncoderEncodeIntoResult._(this._delegate);

  int get read => _delegate.read as int? ?? 0;

  set read(int newValue) {
    _delegate.read = newValue;
  }

  int get written => _delegate.written as int? ?? 0;

  set written(int newValue) {
    _delegate.written = newValue;
  }
}

extension TextEncoderEncodeIntoResultExtension on TextEncoderEncodeIntoResult {
  interop.TextEncoderEncodeIntoResult get delegate => _delegate;
}

TextEncoder textEncoderEncodeIntoResultFromJsObject(
        interop.TextEncoder jsObject) =>
    TextEncoder._(jsObject);
