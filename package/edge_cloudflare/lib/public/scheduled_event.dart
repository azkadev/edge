import '../interop/scheduled_event_interop.dart' as interop;

class ScheduledEvent {
  final interop.ScheduledEvent _delegate;

  ScheduledEvent._(this._delegate);

  String get cron => _delegate.cron;
  String? get type => _delegate.type;
  DateTime get scheduledTime =>
      DateTime.fromMillisecondsSinceEpoch(_delegate.scheduledTime);
}

ScheduledEvent scheduledEventFromJsObject(interop.ScheduledEvent obj) =>
    ScheduledEvent._(obj);
