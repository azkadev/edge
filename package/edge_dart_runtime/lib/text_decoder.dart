import 'package:typings/core.dart' as interop;

class TextDecoder {
  final interop.TextDecoder _delegate;

  // TextDecoder._(this._delegate);

  // TODO: What happens if label is null? do we need to use undefined?
  TextDecoder([String? label, TextDecoderOptions? options])
      : _delegate = interop.TextDecoder(label, options?._delegate);

  String get encoding => _delegate.encoding;

  bool get fatal => _delegate.fatal;

  bool get ignoreBOM => _delegate.ignoreBOM;

  // TODO + TextDecodeOptions
  // String decode([Uint8List? input, TextDecodeOptions? options]) =>
  //     _delegate.decode(input, options?._delegate);
}

class TextDecodeOptions {}

class TextDecoderOptions {
  final interop.TextDecoderOptions _delegate;

  TextDecoderOptions._(this._delegate);

  bool get fatal => _delegate.fatal ?? false;

  set fatal(bool newValue) {
    _delegate.fatal = newValue;
  }

  bool get ignoreBOM => _delegate.ignoreBOM ?? false;

  set ignoreBOM(bool newValue) {
    _delegate.ignoreBOM = newValue;
  }
}
