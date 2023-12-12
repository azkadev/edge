import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:typings/core.dart' as interop;

import 'file.dart';

part 'form_data.freezed.dart';

class FormData {
  final interop.FormData _delegate;
  FormData._(this._delegate);

  FormData() : _delegate = interop.FormData();

  void append(String name, FormDataEntryValue value) {
    value.when(file: (value) {
      throw UnimplementedError();
    }, string: (value) {
      _delegate.append.$3(
        name,
        interop.Blob(
          [value],
          interop.BlobPropertyBag(type: 'text/plain'),
        ),
      );
    });
  }

  void delete(String name) => _delegate.delete(name);

  bool has(String name) => _delegate.has(name);

  FormDataEntryValue? get(String name) {
    final value = _delegate.get(name);

    if (value is String) {
      return FormDataEntryValue.string(value);
    } else if (value is interop.File) {
      return FormDataEntryValue.file(fileFromJsObject(value));
    }

    return null;
  }

  Iterable<FormDataEntryValue> getAll(String name) sync* {
    final values = _delegate.getAll(name);

    for (final value in values) {
      if (value is String) {
        yield FormDataEntryValue.string(value);
      } else if (value is interop.File) {
        yield FormDataEntryValue.file(fileFromJsObject(value));
      } else {
        throw StateError('Unknown FormDataEntryValue type: $value');
      }
    }
  }

  operator []=(String name, FormDataEntryValue value) {
    value.when(file: (value) {
      throw UnimplementedError();
    }, string: (value) {
      _delegate.set.$3(
        name,
        interop.Blob(
          [value],
          interop.BlobPropertyBag(type: 'text/plain'),
        ),
      );
    });
  }

  FormDataEntryValue? operator [](String name) {
    return get(name);
  }
}

FormData formDataFromJsObject(interop.FormData delegate) {
  return FormData._(delegate);
}

/// Represents a form data entry.
@Freezed(
  equal: false,
  copyWith: false,
  map: FreezedMapOptions.none,
)
class FormDataEntryValue with _$FormDataEntryValue {
  const factory FormDataEntryValue.file(File file) = FileValue;

  /// Creates a [FormDataEntryValue] instance from a [String].
  const factory FormDataEntryValue.string(String value) = StringValue;
}
