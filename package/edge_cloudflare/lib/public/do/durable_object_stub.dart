import '../../interop/durable_object_interop.dart' as interop;

import '../fetcher.dart';
import 'durable_object_id.dart';

class DurableObjectStub extends Fetcher {
  final interop.DurableObjectStub _delegate;

  DurableObjectStub._(this._delegate) : super(_delegate);

  DurableObjectId get id => durableObjectIdFromJsObject(_delegate.id);
  String get name => _delegate.name;
}

DurableObjectStub durableObjectStubFromJsObject(
        interop.DurableObjectStub obj) =>
    DurableObjectStub._(obj);
