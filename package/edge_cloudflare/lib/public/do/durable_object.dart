import 'dart:async';

import 'package:edge_dart_runtime/request.dart';
import 'package:edge_dart_runtime/response.dart';
import '../../interop/durable_object_interop.dart' as interop;

import '../environment.dart';
import 'durable_object_state.dart';

abstract class DurableObject {
  final interop.DurableObject _delegate;

  DurableObjectState get state =>
      durableObjectStateFromJsObject(_delegate.state);

  Environment get env => environmentFromJsObject(_delegate.env);

  DurableObject() : _delegate = interop.DurableObject();

  FutureOr<Response> fetch(Request request);
  FutureOr<void> alarm() {}
}

extension DurableObjectExtension on DurableObject {
  interop.DurableObject get delegate => _delegate;
}
