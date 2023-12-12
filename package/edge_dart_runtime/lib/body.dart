import 'dart:typed_data';

import 'form_data.dart';

abstract class Body {
  Stream<List<int>>? get body;
  bool get bodyUsed;
  Future<String> text();
  Future<Object?> json();
  Future<FormData> formData();
  Future<Object> blob();
  Future<ByteBuffer> arrayBuffer();
}
