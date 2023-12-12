import '../../interop/durable_object_interop.dart' as interop;

class DurableObjectId {
  final interop.DurableObjectId _delegate;

  DurableObjectId._(this._delegate);

  String get name => _delegate.name;
  bool equals(DurableObjectId other) => _delegate.equals(other._delegate);

  @override
  String toString() => _delegate.mToString();
}

extension DurableObjectIdExtension on DurableObjectId {
  interop.DurableObjectId get delegate => _delegate;
}

DurableObjectId durableObjectIdFromJsObject(interop.DurableObjectId obj) =>
    DurableObjectId._(obj);
