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
